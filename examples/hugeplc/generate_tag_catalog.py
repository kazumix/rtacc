import pathlib
import xml.etree.ElementTree as ET


def main() -> None:
    root = pathlib.Path(__file__).resolve().parent
    src = root / "hugeplc.tag"
    out = root / "hugeplc_tag_catalog.c"

    root = ET.parse(src).getroot()
    specs: list[str] = []
    for td in root.findall("TagData"):
        type_name = (td.findtext("TypeName") or "").strip()
        tag_name = (td.findtext("TagName") or "").strip()
        if not type_name or not tag_name:
            continue
        specs.append(f"{type_name}{tag_name}")

    seen = set()
    uniq: list[str] = []
    for s in specs:
        if s in seen:
            continue
        seen.add(s)
        uniq.append(s)

    with out.open("w", encoding="utf-8", newline="\n") as f:
        f.write("#include <stddef.h>\n")
        f.write("typedef unsigned char BOOL;\n")
        f.write("extern BOOL Rtedge_TagCreateByInstruction(char *string, BOOL hidden);\n\n")
        f.write("static const char *const k_hugeplc_tag_specs[] = {\n")
        for s in uniq:
            esc = s.replace("\\", "\\\\").replace("\"", "\\\"")
            f.write(f"    \"{esc}\",\n")
        f.write("};\n\n")
        f.write("void Hugeplc_CreateTagsFromCatalog(void)\n{\n")
        f.write("    size_t i;\n")
        f.write("    for (i = 0; i < sizeof(k_hugeplc_tag_specs) / sizeof(k_hugeplc_tag_specs[0]); i++)\n")
        f.write("        (void)Rtedge_TagCreateByInstruction((char *)k_hugeplc_tag_specs[i], 0);\n")
        f.write("}\n")

    print(f"written {out} count={len(uniq)}")


if __name__ == "__main__":
    main()
