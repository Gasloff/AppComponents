#!/usr/bin/env python3
import os
import json
import shutil


def main():
    root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    json_path = os.path.join(root, '28', 'icons_v5', 'AppComponents.json')

    with open(json_path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    name_to_id = {}
    for comp in data.get('appComponents', []):
        name = comp.get('name')
        cid = comp.get('id')
        if name and cid:
            name_to_id[name] = cid

    # Aliases: handle icon filenames that differ from component 'name'
    # Based on user-provided mappings
    name_aliases = {
        'Tabbed Application': 'Tabbed Application Mode',
        'map': 'Maps',
    }

    light_dir = os.path.join(root, '28', 'icons_v5', 'Light2')
    dark_dir = os.path.join(root, '28', 'icons_v5', 'Dark2')
    out_dir = os.path.join(root, '28', 'icons_v5')
    os.makedirs(out_dir, exist_ok=True)

    actions = []
    warnings = []

    def process_dir(src_dir: str, suffix: str):
        if not os.path.isdir(src_dir):
            warnings.append(f"Missing directory: {os.path.relpath(src_dir, root)}")
            return
        for fn in os.listdir(src_dir):
            if not fn.lower().endswith('.svg'):
                continue
            base = fn[:-4]  # strip .svg
            # Resolve id by exact name or via aliases
            resolved_name = base if base in name_to_id else name_aliases.get(base)
            if not resolved_name or resolved_name not in name_to_id:
                warnings.append(f"No mapping for '{base}' from {os.path.relpath(src_dir, root)}")
                continue
            new_name = f"{name_to_id[resolved_name]}{suffix}.svg"
            src = os.path.join(src_dir, fn)
            dst = os.path.join(out_dir, new_name)
            shutil.copyfile(src, dst)
            actions.append((src, dst))

    process_dir(light_dir, '')
    process_dir(dark_dir, '_dark')

    print(f"Copied {len(actions)} files.")
    for src, dst in actions[:30]:
        print(f"-> {os.path.relpath(src, root)}  =>  {os.path.relpath(dst, root)}")
    if len(actions) > 30:
        print(f"... and {len(actions)-30} more")
    if warnings:
        print("Warnings:")
        for w in warnings:
            print(" - ", w)


if __name__ == '__main__':
    main()
