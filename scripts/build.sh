#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
site_dir="$repo_root/_site"

site_files=(index.html 404.html site.css design-system/tokens.css design-system/components.css)

for path in "${site_files[@]}"; do
  if [[ ! -f "$repo_root/$path" ]]; then
    printf 'Required site file is missing: %s\n' "$path" >&2
    exit 1
  fi
done

if [[ ! -d "$repo_root/design-system/assets" ]]; then
  printf 'Required site directory is missing: design-system/assets\n' >&2
  exit 1
fi

rm -rf "$site_dir"
mkdir -p "$site_dir/design-system"

for path in "${site_files[@]}"; do
  cp "$repo_root/$path" "$site_dir/$path"
done

cp -R "$repo_root/design-system/assets" "$site_dir/design-system/assets"
touch "$site_dir/.nojekyll"
