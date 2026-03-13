package config

import (
	"encoding/json"
	"os"
	"path/filepath"
	"strings"
)

// Project は rtacc の JSON プロジェクト設定。
// toolsets: ツールセット定義（vs / llvm）
// targets: ビルドターゲット（複数可）
type Project struct {
	Toolsets map[string]Toolset `json:"toolsets"`
	Targets  []Target           `json:"targets"`
}

// Toolset はコンパイラ/リンカの組み合わせ。
type Toolset struct {
	Compiler      string   `json:"compiler"`       // cl, clang, clang-cl
	Linker        string   `json:"linker"`         // link, lld
	CompilerFlags []string `json:"compiler_flags"`  // 例: -Wall, /W3
	LinkerFlags   []string `json:"linker_flags"`   // 例: /HEAP:4194304, -Wl,--heap-size=4M
}

// Target は1つのビルドターゲット（.rta または .rsl）。
type Target struct {
	Name        string   `json:"name"`
	Toolset     string   `json:"toolset"`      // toolsets のキー
	OutputDir   string   `json:"output_dir"`    // 出力ディレクトリ（空ならカレント）
	Output      string   `json:"output"`       // 出力ファイル名（.rta or .rsl）
	Optimize    string   `json:"optimize"`     // 0,1,2,3,s,z
	CompileOnly bool     `json:"compile_only"` // true の場合は .obj まで（リンクしない）
	Includes    []string `json:"includes"`
	Sources     []string `json:"sources"`      // .c, .obj, .lib の並び
	Libs        []string `json:"libs"`
	Defines     []string `json:"defines"`
	Flags       []string `json:"flags"`        // ターゲット固有の追加フラグ
}

// LoadFile は JSON ファイルを読み込み、環境変数を展開して返す。
func LoadFile(path string) (*Project, error) {
	data, err := os.ReadFile(path)
	if err != nil {
		return nil, err
	}
	var p Project
	if err := json.Unmarshal(data, &p); err != nil {
		return nil, err
	}
	ExpandProject(&p)
	return &p, nil
}

// SaveFile は Project を JSON として保存する。
func SaveFile(path string, p *Project) error {
	data, err := json.MarshalIndent(p, "", "  ")
	if err != nil {
		return err
	}
	// 既存ファイルがある場合は上書きしない前提で呼び出し側が制御する。
	dir := filepath.Dir(path)
	if dir != "" && dir != "." {
		if err := os.MkdirAll(dir, 0755); err != nil {
			return err
		}
	}
	return os.WriteFile(path, data, 0644)
}

// ExpandProject はプロジェクト内の $(VAR) / %VAR% を環境変数で展開する。
func ExpandProject(p *Project) {
	for name, t := range p.Toolsets {
		t.CompilerFlags = expandStrings(t.CompilerFlags)
		t.LinkerFlags = expandStrings(t.LinkerFlags)
		p.Toolsets[name] = t
	}
	for i := range p.Targets {
		p.Targets[i].OutputDir = expandOne(p.Targets[i].OutputDir)
		p.Targets[i].Output = expandOne(p.Targets[i].Output)
		p.Targets[i].Includes = expandStrings(p.Targets[i].Includes)
		p.Targets[i].Sources = expandStrings(p.Targets[i].Sources)
		p.Targets[i].Libs = expandStrings(p.Targets[i].Libs)
		p.Targets[i].Defines = expandStrings(p.Targets[i].Defines)
		p.Targets[i].Flags = expandStrings(p.Targets[i].Flags)
	}
}

func expandOne(s string) string {
	// $(VAR) を ${VAR} に変換して os.Expand で展開
	s = replaceParenEnv(s)
	return os.Expand(s, func(key string) string { return os.Getenv(key) })
}

func replaceParenEnv(s string) string {
	// $(INTIME) -> ${INTIME} にして Expand で展開できるようにする
	var b strings.Builder
	i := 0
	for i < len(s) {
		if i+1 < len(s) && s[i] == '$' && s[i+1] == '(' {
			j := i + 2
			for j < len(s) && s[j] != ')' {
				j++
			}
			if j < len(s) {
				b.WriteString("${")
				b.WriteString(s[i+2 : j])
				b.WriteString("}")
				i = j + 1
				continue
			}
		}
		b.WriteByte(s[i])
		i++
	}
	return b.String()
}

func expandStrings(ss []string) []string {
	out := make([]string, len(ss))
	for i, s := range ss {
		out[i] = expandOne(s)
	}
	return out
}

// ResolveOutputPath は target の出力フルパスを返す（output_dir + output）。
func ResolveOutputPath(t *Target, projectDir string) string {
	if t.OutputDir == "" {
		return t.Output
	}
	dir := t.OutputDir
	if !filepath.IsAbs(dir) {
		dir = filepath.Join(projectDir, dir)
	}
	return filepath.Join(dir, t.Output)
}
