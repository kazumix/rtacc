// rtacc - INtime RTA 用ビルドドライバ（LLVM/Clang ベース）
// .c / .obj / .lib を列挙して .rta または .rsl を生成する。
// 使い方:
//   rtacc project.json
//   rtacc project.json --target app --toolset llvm
//   rtacc main.c -o app.rta
package main

import (
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"strings"

	"rtacc/internal/build"
	"rtacc/internal/config"
)

func main() {
	if err := run(os.Args[1:]); err != nil {
		fmt.Fprintf(os.Stderr, "rtacc: %v\n", err)
		os.Exit(1)
	}
}

func run(args []string) error {
	if len(args) == 0 {
		printUsage()
		return nil
	}
	first := args[0]
	if strings.HasSuffix(strings.ToLower(first), ".json") {
		return runJSON(first, args[1:])
	}
	return runCLI(args)
}

func runJSON(jsonPath string, rest []string) error {
	fs := flag.NewFlagSet("rtacc-json", flag.ExitOnError)
	targetName := fs.String("target", "", "ビルドするターゲット名（省略時は先頭）")
	output := fs.String("o", "", "出力ファイル名の上書き")
	toolset := fs.String("toolset", "", "上書きツールセット (llvm / vs2017)")
	outputDir := fs.String("output-dir", "", "出力ディレクトリの上書き")
	optimize := fs.String("optimize", "", "最適化レベル (0,1,2,3,s,z)")
	compileOnly := fs.Bool("c", false, "コンパイルのみ（.obj まで。リンクしない）")
	includes := fs.String("I", "", "インクルードパス（; 区切り）。JSON より優先")
	defines := fs.String("D", "", "定義（; 区切り）。JSON より優先")
	libs := fs.String("libs", "", "リンクする lib（; 区切り）。JSON より優先")
	flags := fs.String("flags", "", "ターゲット追加フラグ（; 区切り）。JSON より優先")
	compilerFlags := fs.String("compiler-flags", "", "コンパイラオプション（; 区切り）")
	linkerFlags := fs.String("linker-flags", "", "リンカオプション（; 区切り）")
	if err := fs.Parse(rest); err != nil {
		return err
	}

	proj, err := config.LoadFile(jsonPath)
	if err != nil {
		return err
	}
	projectDir := filepath.Dir(jsonPath)
	paths := build.DefaultPaths()
	opts := build.Options{
		Toolset:     strings.TrimSpace(*toolset),
		TargetName:  strings.TrimSpace(*targetName),
		Output:      strings.TrimSpace(*output),
		OutputDir:   strings.TrimSpace(*outputDir),
		CompileOnly: *compileOnly,
		Optimize:    strings.TrimSpace(*optimize),
	}
	if *includes != "" {
		opts.Includes = splitSemicolon(*includes)
	}
	if *defines != "" {
		opts.Defines = splitSemicolon(*defines)
	}
	if *libs != "" {
		opts.Libs = splitSemicolon(*libs)
	}
	if *flags != "" {
		opts.Flags = splitSemicolon(*flags)
	}
	if *compilerFlags != "" {
		opts.CompilerFlags = splitSemicolon(*compilerFlags)
	}
	if *linkerFlags != "" {
		opts.LinkerFlags = splitSemicolon(*linkerFlags)
	}

	var targets []*config.Target
	if opts.TargetName != "" {
		for i := range proj.Targets {
			if proj.Targets[i].Name == opts.TargetName {
				targets = append(targets, &proj.Targets[i])
				break
			}
		}
		if len(targets) == 0 {
			return fmt.Errorf("target not found: %s", opts.TargetName)
		}
	} else {
		for i := range proj.Targets {
			targets = append(targets, &proj.Targets[i])
		}
		if len(targets) == 0 {
			return fmt.Errorf("no targets in project")
		}
	}

	for _, t := range targets {
		if err := build.BuildTarget(proj, t, projectDir, paths, opts); err != nil {
			return err
		}
	}
	return nil
}

// extractOutput は args から -o / -o=value を先に取り出す。Go の flag は先頭の非フラグで止まるため、
// 「main.c -o app.rta」の順でも -o を認識させる。
func extractOutput(args []string) (output string, rest []string) {
	for i := 0; i < len(args); i++ {
		a := args[i]
		if a == "-o" && i+1 < len(args) {
			output = args[i+1]
			rest = append(rest, args[:i]...)
			rest = append(rest, args[i+2:]...)
			return output, rest
		}
		if strings.HasPrefix(a, "-o=") {
			output = strings.TrimPrefix(a, "-o=")
			rest = append(rest, args[:i]...)
			rest = append(rest, args[i+1:]...)
			return output, rest
		}
	}
	return "", args
}

func runCLI(args []string) error {
	// -o をソースの後ろにあっても認識するよう先に抽出
	outputFromArgs, argsForParse := extractOutput(args)

	fs := flag.NewFlagSet("rtacc-cli", flag.ExitOnError)
	output := fs.String("o", "", "出力ファイル (.rta / .rsl)")
	outputDir := fs.String("output-dir", "", "中間・出力ディレクトリ（省略時は project.json の output_dir またはカレント）")
	toolset := fs.String("toolset", "", "ツールセット (llvm / vs2017)")
	optimize := fs.String("O", "2", "最適化レベル (0,1,2,3,s,z)")
	compileOnly := fs.Bool("c", false, "コンパイルのみ（.obj まで。リンクしない）")
	includes := fs.String("I", "", "インクルードパス（; 区切り）")
	defines := fs.String("D", "", "定義（; 区切り）")
	libs := fs.String("libs", "", "リンクする lib（; 区切り）")
	flags := fs.String("flags", "", "ターゲット追加フラグ（; 区切り）")
	compilerFlags := fs.String("compiler-flags", "", "コンパイラオプション（; 区切り）")
	linkerFlags := fs.String("linker-flags", "", "リンカオプション（; 区切り）")
	if err := fs.Parse(argsForParse); err != nil {
		return err
	}
	sources := fs.Args()
	if len(sources) == 0 {
		printUsage()
		return nil
	}
	if outputFromArgs != "" {
		*output = outputFromArgs
	} else if *output == "" {
		*output = "app.rta"
	}

	projectDir, _ := os.Getwd()
	toolsetToUse := strings.TrimSpace(*toolset)
	outputDirToUse := strings.TrimSpace(*outputDir)
	if toolsetToUse == "" || outputDirToUse == "" {
		if p, err := config.LoadFile(filepath.Join(projectDir, "project.json")); err == nil && len(p.Targets) > 0 {
			t := &p.Targets[0]
			if toolsetToUse == "" && strings.TrimSpace(t.Toolset) != "" {
				toolsetToUse = strings.TrimSpace(t.Toolset)
			}
			if outputDirToUse == "" && strings.TrimSpace(t.OutputDir) != "" {
				outputDirToUse = strings.TrimSpace(t.OutputDir)
			}
		}
		if toolsetToUse == "" {
			toolsetToUse = "llvm"
		}
	}

	proj := &config.Project{
		Toolsets: map[string]config.Toolset{
			"llvm":   {Compiler: "clang", Linker: "lld"},
			"vs2017": {Compiler: "cl", Linker: "link", CompilerFlags: []string{"/W3", "/nologo"}},
		},
		Targets: []config.Target{
			{
				Name:        "default",
				Toolset:     toolsetToUse,
				OutputDir:   outputDirToUse,
				Output:      *output,
				Optimize:    *optimize,
				CompileOnly: *compileOnly,
				Sources:     sources,
				Libs:        nil,
				Defines:     nil,
				Flags:       nil,
			},
		},
	}
	// project.json が存在しない場合は、CLI 指定＋デフォルトから生成して保存する。
	jsonPath := filepath.Join(projectDir, "project.json")
	if _, err := os.Stat(jsonPath); err != nil {
		if os.IsNotExist(err) {
			// 保存に失敗してもビルド自体は続行する。
			_ = config.SaveFile(jsonPath, proj)
		}
	}
	// CLI 指定はすべて opts に載せて BuildTarget で JSON より優先させる
	opts := build.Options{
		Toolset:     toolsetToUse,
		Output:      *output,
		OutputDir:   outputDirToUse,
		CompileOnly: *compileOnly,
		Optimize:    *optimize,
	}
	if *includes != "" {
		opts.Includes = splitSemicolon(*includes)
	}
	if *defines != "" {
		opts.Defines = splitSemicolon(*defines)
	}
	if *libs != "" {
		opts.Libs = splitSemicolon(*libs)
	}
	if *flags != "" {
		opts.Flags = splitSemicolon(*flags)
	}
	if *compilerFlags != "" {
		opts.CompilerFlags = splitSemicolon(*compilerFlags)
	}
	if *linkerFlags != "" {
		opts.LinkerFlags = splitSemicolon(*linkerFlags)
	}

	paths := build.DefaultPaths()
	return build.BuildTarget(proj, &proj.Targets[0], projectDir, paths, opts)
}

func splitSemicolon(s string) []string {
	var out []string
	for _, v := range strings.Split(s, ";") {
		if v = strings.TrimSpace(v); v != "" {
			out = append(out, v)
		}
	}
	return out
}

func printUsage() {
	fmt.Println(`rtacc - INtime RTA ビルドドライバ (LLVM/Clang)
  JSON で指定できる項目はすべて CLI でも指定可能。CLI が JSON より優先。

使い方:
  rtacc project.json              # プロジェクトの全ターゲットをビルド
  rtacc project.json --target app  # 指定ターゲットのみ
  rtacc project.json --toolset llvm --output-dir build/

  rtacc main.c -o app.rta                    # CLI: ソース 1 つ
  rtacc main.c util.c -o app.rta             # 複数ソースはスペース区切りで並べる
  rtacc main.c util.obj -o app.rta --libs "a.lib;b.lib"  # lib は ; 区切り

複数指定のしかた:
  sources  スペース区切りで並べる  …  rtacc main.c foo.c bar.obj -o app.rta
  -I, -D, -libs, -flags, -compiler-flags, -linker-flags  セミコロン(;)区切り  …  -libs "a.lib;b.lib"

オプション（JSON/CLI 共通。CLI 指定が JSON より優先）:
  -o file            出力ファイル名（.rta / .rsl）
  -target name       ビルドするターゲット名（project.json 時）
  -toolset llvm|vs2017  ツールセット
  -output-dir dir    中間・出力ディレクトリ
  -optimize, -O 0|1|2|3|s|z  最適化レベル
  -I path            インクルード（; で複数）
  -D MACRO           定義（; で複数）
  -libs "a.lib;b.lib" リンクする lib（; で複数）
  -flags "フラグ"     ターゲット追加フラグ（; で複数）
  -compiler-flags "フラグ"  コンパイラオプション（; で複数）
  -linker-flags "フラグ"   リンカオプション（; で複数）

環境変数:
  INTIME  INtime ルート（既定: C:\Program Files (x86)\INtime）
  LLVM    LLVM bin ディレクトリ（既定: C:\Program Files\LLVM\bin）
`)
}
