package build

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	"rtacc/internal/config"
)

// Options はビルド時の上書きオプション（CLI など）。CLI で指定した値は JSON より優先する。
type Options struct {
	Toolset       string   // 上書き（CLI --toolset）
	TargetName    string   // ビルドする target の name
	Output        string   // 上書き（CLI -o）
	OutputDir     string   // 上書き（CLI --output-dir）
	Optimize      string   // 上書き（CLI -O / --optimize）
	Includes      []string // 上書き（CLI -I）。指定時は JSON の includes より優先
	Defines       []string // 上書き（CLI -D）
	Libs          []string // 上書き（CLI --libs）
	Flags         []string // 上書き（CLI --flags）。ターゲットの追加フラグ
	CompilerFlags []string // 追加（CLI --compiler-flags）。ツールセットの compiler_flags に追加
	LinkerFlags   []string // 追加（CLI --linker-flags）。ツールセットの linker_flags に追加
	Compiler      string
	Linker        string
	ExtraFlags    []string
}

// Paths は clang / INtime のパス。
type Paths struct {
	Clang         string // clang.exe フルパス
	IntimeInclude string // RT\include
	IntimeLib     string // RT\LIB
}

// DefaultPaths は環境変数または既定値で Paths を構築する。
func DefaultPaths() Paths {
	intime := os.Getenv("INTIME")
	if intime == "" {
		intime = `C:\Program Files (x86)\INtime`
	}
	llvm := os.Getenv("LLVM")
	if llvm == "" {
		llvm = `C:\Program Files\LLVM\bin`
	}
	return Paths{
		Clang:         filepath.Join(llvm, "clang.exe"),
		IntimeInclude: filepath.Join(intime, "RT", "include"),
		IntimeLib:     filepath.Join(intime, "RT", "LIB"),
	}
}

// BuildTarget は 1 つのターゲットをビルドする。
func BuildTarget(proj *config.Project, target *config.Target, projectDir string, paths Paths, opts Options) error {
	toolsetName := strings.TrimSpace(target.Toolset)
	if opts.Toolset != "" {
		toolsetName = strings.TrimSpace(opts.Toolset)
	}
	if toolsetName == "" {
		toolsetName = "llvm"
	}
	ts, ok := proj.Toolsets[toolsetName]
	if !ok {
		return fmt.Errorf("toolset not found: %q (available: %s)", toolsetName, listToolsetNames(proj))
	}

	// 出力パス: CLI の -o / --output-dir を最優先し、未指定時のみ target の output_dir + output を使う
	outputPath := config.ResolveOutputPath(target, projectDir)
	if opts.Output != "" {
		if opts.OutputDir != "" {
			outputPath = filepath.Join(opts.OutputDir, opts.Output)
		} else {
			outputPath = opts.Output
		}
	} else if opts.OutputDir != "" {
		outputPath = filepath.Join(opts.OutputDir, target.Output)
	}
	outDir := filepath.Dir(outputPath)
	if err := os.MkdirAll(outDir, 0755); err != nil {
		return err
	}

	optimize := target.Optimize
	if opts.Optimize != "" {
		optimize = opts.Optimize
	}
	if optimize == "" {
		optimize = "2"
	}

	ext := strings.ToLower(filepath.Ext(target.Output))
	isRsl := ext == ".rsl"

	// CLI 指定があれば JSON より優先（includes, defines, libs, flags）
	t := *target
	if len(opts.Includes) > 0 {
		t.Includes = opts.Includes
	}
	if len(opts.Defines) > 0 {
		t.Defines = opts.Defines
	}
	if len(opts.Libs) > 0 {
		t.Libs = opts.Libs
	}
	if len(opts.Flags) > 0 {
		t.Flags = opts.Flags
	}
	tsCopy := ts
	if len(opts.CompilerFlags) > 0 {
		tsCopy.CompilerFlags = append(tsCopy.CompilerFlags, opts.CompilerFlags...)
	}
	if len(opts.LinkerFlags) > 0 {
		tsCopy.LinkerFlags = append(tsCopy.LinkerFlags, opts.LinkerFlags...)
	}

	// compiler が cl のときは cl+link（vs2012 / vs2017 / vs2022 など）。それ以外は clang+lld。
	useVS := strings.TrimSpace(ts.Compiler) == "cl"
	if useVS {
		fmt.Printf("toolset: %s (cl+link)\n", toolsetName)
		return buildVS(&t, &tsCopy, outputPath, outDir, projectDir, paths, optimize, isRsl, opts, toolsetName)
	}
	fmt.Printf("toolset: %s (clang+lld)\n", toolsetName)
	return buildLLVM(&t, &tsCopy, outputPath, outDir, projectDir, paths, optimize, isRsl, opts)
}

func listToolsetNames(proj *config.Project) string {
	var names []string
	for k := range proj.Toolsets {
		names = append(names, k)
	}
	return strings.Join(names, ", ")
}

// buildLLVM は clang + lld で .c → .ll → .asm → .obj → .rta/.rsl を実行する。
func buildLLVM(t *config.Target, ts *config.Toolset, outputPath, outDir, projectDir string, paths Paths, optimize string, isRsl bool, opts Options) error {
	clang := paths.Clang
	if _, err := os.Stat(clang); os.IsNotExist(err) {
		return fmt.Errorf("clang が見つかりません: %s", clang)
	}
	if _, err := os.Stat(paths.IntimeInclude); os.IsNotExist(err) {
		return fmt.Errorf("INtime include が見つかりません: %s", paths.IntimeInclude)
	}
	if _, err := os.Stat(paths.IntimeLib); os.IsNotExist(err) {
		return fmt.Errorf("INtime LIB が見つかりません: %s", paths.IntimeLib)
	}

	includeArgs := []string{"-I" + paths.IntimeInclude, "-D__INTIME__"}
	for _, inc := range t.Includes {
		includeArgs = append(includeArgs, "-I"+inc)
	}
	for _, d := range t.Defines {
		includeArgs = append(includeArgs, "-D"+d)
	}
	baseCompile := []string{"-m32", "-target", "i386-pc-windows-msvc"}
	if optimize != "" {
		baseCompile = append(baseCompile, "-O"+optimize)
	}
	// 標準の警告抑制（INtime ヘッダ用）を先頭に付与し、続けて JSON/CLI の compiler_flags を追加
	compilerFlags := append([]string(nil), defaultLLVMCompilerFlags()...)
	compilerFlags = append(compilerFlags, ts.CompilerFlags...)
	compilerFlags = append(compilerFlags, t.Flags...)
	compilerFlags = append(compilerFlags, opts.ExtraFlags...)

	var objFiles []string

	for _, src := range t.Sources {
		ext := strings.ToLower(filepath.Ext(src))
		switch ext {
		case ".c":
			base := strings.TrimSuffix(filepath.Base(src), ext)
			pathSrc := src
			if !filepath.IsAbs(pathSrc) {
				pathSrc = filepath.Join(projectDir, src)
			}
			llPath := filepath.Join(outDir, base+".ll")
			asmPath := filepath.Join(outDir, base+".asm")
			objPath := filepath.Join(outDir, base+".obj")

			// 1) .c -> .ll
			args1 := append(includeArgs, baseCompile...)
			args1 = append(args1, "-emit-llvm", "-S")
			args1 = append(args1, compilerFlags...)
			args1 = append(args1, pathSrc, "-o", llPath)
			if err := run(clang, args1, "C→LL"); err != nil {
				return err
			}
			// 2) .ll -> .asm
			args2 := []string{"-x", "ir"}
			args2 = append(args2, baseCompile...)
			args2 = append(args2, "-S", llPath, "-o", asmPath)
			if err := run(clang, args2, "LL→asm"); err != nil {
				return err
			}
			// 3) .asm -> .obj
			args3 := []string{"-m32", "-target", "i386-pc-windows-msvc", "-c", asmPath, "-o", objPath}
			if err := run(clang, args3, "asm→obj"); err != nil {
				return err
			}
			objFiles = append(objFiles, objPath)
		case ".obj", ".o":
			pathSrc := src
			if !filepath.IsAbs(pathSrc) {
				pathSrc = filepath.Join(projectDir, src)
			}
			objFiles = append(objFiles, pathSrc)
		}
	}

	// リンク
	linkerFlags := defaultLLVMLinkerFlags(paths.IntimeLib)
	linkerFlags = append(linkerFlags, ts.LinkerFlags...)
	if isRsl {
		linkerFlags = append(linkerFlags, "-shared")
	}

	args := []string{"-fuse-ld=lld-link", "-m32", "-target", "i386-pc-windows-msvc", "-nostdlib"}
	for _, f := range linkerFlags {
		if strings.HasPrefix(f, "-Wl,") {
			args = append(args, f)
		} else if strings.HasPrefix(f, "-") {
			args = append(args, f)
		} else {
			args = append(args, "-Xlinker", f)
		}
	}
	for _, obj := range objFiles {
		args = append(args, obj)
	}
	// INtime 既定 libs（vshelper は1つのみ。重複シンボルを防ぐ）
	for _, lib := range intimeDefaultLibsLLVM(paths.IntimeLib) {
		args = append(args, "-Xlinker", lib)
	}
	for _, lib := range t.Libs {
		args = append(args, "-Xlinker", lib)
	}
	args = append(args, "-o", outputPath)

	if err := run(clang, args, "link"); err != nil {
		return err
	}
	fmt.Printf("Done: %s\n", outputPath)
	return nil
}

// defaultLLVMCompilerFlags は llvm ツールセットの標準コンパイラフラグ（INtime ヘッダの警告抑制）。
func defaultLLVMCompilerFlags() []string {
	return []string{
		"-Wno-unknown-pragmas", "-Wno-ignored-pragma-intrinsic",
		"-Wno-pragma-pack", "-Wno-ignored-attributes",
	}
}

func defaultLLVMLinkerFlags(intimeLib string) []string {
	return []string{
		"/SUBSYSTEM:CONSOLE", "/MACHINE:X86", "/SAFESEH:NO", "/NODEFAULTLIB",
		"/FORCE:MULTIPLE", "/IGNORE:2005", // netlib.lib と vshelper*.lib の ___guard_check_icall_fptr 重複を許容（socket API のため netlib は必須）
		"/LIBPATH:" + intimeLib,
	}
}

// intimeDefaultLibsLLVM は LLVM ツールセット用の INtime 既定ライブラリ。
// vshelper22.lib が存在すればそれを、存在しない場合は vshelper17.lib が存在すればそちらを 1 つだけリンクする。
// netlib は socket API 用で必須。
func intimeDefaultLibsLLVM(intimeLib string) []string {
	vshelper := "vshelper22.lib"
	if _, err := os.Stat(filepath.Join(intimeLib, vshelper)); os.IsNotExist(err) {
		if _, err2 := os.Stat(filepath.Join(intimeLib, "vshelper17.lib")); err2 == nil {
			vshelper = "vshelper17.lib"
		}
	}
	return []string{"pcibus.lib", "netlib.lib", vshelper, "clib.lib", "rt.lib"}
}

// intimeDefaultLibsVS は VS ツールセット用の INtime 既定ライブラリ。toolset 名に応じて vshelper を1つだけ選ぶ。netlib は socket API 用で必須。
func intimeDefaultLibsVS(toolsetName string) []string {
	vshelper := "vshelper22.lib"
	if strings.Contains(toolsetName, "2017") || strings.Contains(toolsetName, "2015") ||
		strings.Contains(toolsetName, "2013") || strings.Contains(toolsetName, "2012") {
		vshelper = "vshelper17.lib"
	}
	return []string{"pcibus.lib", "netlib.lib", vshelper, "clib.lib", "rt.lib"}
}

// defaultVSCompilerFlags は vs2017 ツールセットの標準コンパイラフラグ（/wd による警告抑制のみ。/W3 /nologo は JSON で指定）。
func defaultVSCompilerFlags() []string {
	return []string{"/wd4068", "/wd4103"}
}

// buildVS は Visual Studio の cl + link で .c → .obj → .rta/.rsl をビルドする。
// toolset 名に応じて vshelper17 または vshelper22 のいずれか1つのみをリンクする。
func buildVS(t *config.Target, ts *config.Toolset, outputPath, outDir, projectDir string, paths Paths, optimize string, isRsl bool, opts Options, toolsetName string) error {
	clExe := "cl"
	linkExe := "link"
	if _, err := exec.LookPath(clExe); err != nil {
		return fmt.Errorf("cl が見つかりません。Developer Command Prompt for VS 2017/2022 などで実行してください: %w", err)
	}
	if _, err := exec.LookPath(linkExe); err != nil {
		return fmt.Errorf("link が見つかりません。Developer Command Prompt for VS 2017/2022 などで実行してください: %w", err)
	}
	if _, err := os.Stat(paths.IntimeInclude); os.IsNotExist(err) {
		return fmt.Errorf("INtime include が見つかりません: %s", paths.IntimeInclude)
	}
	if _, err := os.Stat(paths.IntimeLib); os.IsNotExist(err) {
		return fmt.Errorf("INtime LIB が見つかりません: %s", paths.IntimeLib)
	}

	// INtime の include/lib を環境変数に追加（既存の前に付ける）
	env := appendVSEnv(paths.IntimeInclude, paths.IntimeLib)

	optFlag := vsOptimizeFlag(optimize)
	// 標準の /wd を先頭に付与し、続けて JSON/CLI の compiler_flags を追加
	compilerFlags := append([]string(nil), defaultVSCompilerFlags()...)
	compilerFlags = append(compilerFlags, ts.CompilerFlags...)
	compilerFlags = append(compilerFlags, t.Flags...)
	compilerFlags = append(compilerFlags, opts.ExtraFlags...)

	var objFiles []string
	for _, src := range t.Sources {
		ext := strings.ToLower(filepath.Ext(src))
		switch ext {
		case ".c":
			pathSrc := src
			if !filepath.IsAbs(pathSrc) {
				pathSrc = filepath.Join(projectDir, src)
			}
			base := strings.TrimSuffix(filepath.Base(src), ext)
			objPath := filepath.Join(outDir, base+".obj")
			args := []string{"/c", "/nologo", "/I" + paths.IntimeInclude}
			for _, inc := range t.Includes {
				args = append(args, "/I"+inc)
			}
			for _, d := range t.Defines {
				args = append(args, "/D"+d)
			}
			args = append(args, "/D__INTIME__")
			if optFlag != "" {
				args = append(args, optFlag)
			}
			args = append(args, compilerFlags...)
			args = append(args, "/Fo"+objPath, pathSrc)
			if err := runWithEnv(env, clExe, args, "cl"); err != nil {
				return err
			}
			objFiles = append(objFiles, objPath)
		case ".obj", ".o":
			pathSrc := src
			if !filepath.IsAbs(pathSrc) {
				pathSrc = filepath.Join(projectDir, src)
			}
			objFiles = append(objFiles, pathSrc)
		}
	}

	// リンク（VERSION/HEAP/STACK は JSON の linker_flags で指定）。netlib と vshelper のシンボル重複は許容。
	linkerFlags := []string{
		"/OUT:" + outputPath,
		"/SUBSYSTEM:CONSOLE",
		"/MACHINE:X86",
		"/LIBPATH:" + paths.IntimeLib,
		"/FORCE:MULTIPLE", "/IGNORE:2005",
	}
	linkerFlags = append(linkerFlags, ts.LinkerFlags...)
	if isRsl {
		linkerFlags = append(linkerFlags, "/DLL")
	}
	args := append(linkerFlags, objFiles...)
	for _, lib := range intimeDefaultLibsVS(toolsetName) {
		args = append(args, lib)
	}
	args = append(args, t.Libs...)
	if err := runWithEnv(env, linkExe, args, "link"); err != nil {
		return err
	}
	fmt.Printf("Done: %s\n", outputPath)
	return nil
}

func vsOptimizeFlag(level string) string {
	switch level {
	case "0":
		return "/Od"
	case "1":
		return "/O1"
	case "2", "":
		return "/O2"
	case "3":
		return "/Ox"
	case "s", "z":
		return "/O1"
	default:
		return "/O2"
	}
}

// appendVSEnv は INtime の include/lib を INCLUDE/LIB の先頭に付けた環境を返す。
func appendVSEnv(intimeInclude, intimeLib string) []string {
	env := os.Environ()
	include := os.Getenv("INCLUDE")
	if include != "" {
		include = intimeInclude + ";" + include
	} else {
		include = intimeInclude
	}
	lib := os.Getenv("LIB")
	if lib != "" {
		lib = intimeLib + ";" + lib
	} else {
		lib = intimeLib
	}
	return setEnv(env, "INCLUDE", include, "LIB", lib)
}

func setEnv(env []string, k1, v1, k2, v2 string) []string {
	out := make([]string, 0, len(env)+2)
	done1, done2 := false, false
	for _, e := range env {
		if strings.HasPrefix(e, k1+"=") {
			out = append(out, k1+"="+v1)
			done1 = true
			continue
		}
		if strings.HasPrefix(e, k2+"=") {
			out = append(out, k2+"="+v2)
			done2 = true
			continue
		}
		out = append(out, e)
	}
	if !done1 {
		out = append(out, k1+"="+v1)
	}
	if !done2 {
		out = append(out, k2+"="+v2)
	}
	return out
}

func runWithEnv(env []string, exe string, args []string, phase string) error {
	fmt.Printf("[%s] %s %s\n", phase, exe, strings.Join(args, " "))
	cmd := exec.Command(exe, args...)
	cmd.Env = env
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	if err := cmd.Run(); err != nil {
		return fmt.Errorf("%s: %w", phase, err)
	}
	return nil
}

func run(exe string, args []string, phase string) error {
	fmt.Printf("[%s] %s %s\n", phase, exe, strings.Join(args, " "))
	cmd := exec.Command(exe, args...)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	if err := cmd.Run(); err != nil {
		return fmt.Errorf("%s: %w", phase, err)
	}
	return nil
}
