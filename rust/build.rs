use gdnative_project_utils::*;
use glob::glob;
use std::path::Path;

fn generate_gdns(name: &str) -> String {
    format!(
        r#"[gd_resource type="NativeScript" load_steps=2 format=2]

[ext_resource path="res://native/rust/superdot.gdnlib" type="GDNativeLibrary" id=1]

[resource]
class_name = "{name}"
script_class_name = "{name}"
library = ExtResource( 1 )
"#,
        name = name,
    )
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let classes = scan_crate("src")?;

    // Delete removed classes
    for entry in glob("../godot/native/rust/*.gdns")? {
        let entry = entry?;
        let name = entry
            .file_name()
            .unwrap()
            .to_string_lossy()
            .to_string()
            .replace(".gdns", "");
        if !classes.contains(&name) {
            println!("cargo:warning=removed class {:?}", &name);
            std::fs::remove_file(entry)?;
        }
    }

    // Generate gdns files
    for name in classes {
        let content = generate_gdns(&name);
        let path = format!("../godot/native/rust/{}.gdns", &name);
        let path = Path::new(&path);

        let do_write_file = match std::fs::read_to_string(&path) {
            Ok(existing) => existing != content,
            Err(_) => true,
        };

        if do_write_file {
            println!("cargo:warning=changed or added class {:?}", &name);
            std::fs::write(&path, content)?;
        }
    }

    Ok(())
}
