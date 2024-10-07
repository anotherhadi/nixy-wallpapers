#!/usr/bin/env bash

# Create WALLPAPERS.md to preview wallpapers in ./wallpapers

WALLPAPERS_FOLDER="."
WALLPAPERS_MD="./README.md"
[[ -d "$WALLPAPERS_FOLDER" ]] || (echo "Wallpapers folder not found" && exit 1)

echo "# Nixy Wallpapers" >"$WALLPAPERS_MD"
echo "" >>"$WALLPAPERS_MD"
printf "A collection of wallpapers for [Nixy](https://github.com/anotherhadi/nixy)." >>"$WALLPAPERS_MD"
echo "" >>"$WALLPAPERS_MD"
echo "" >>"$WALLPAPERS_MD"
echo "| Preview |" >>"$WALLPAPERS_MD"
echo "| -- |" >>"$WALLPAPERS_MD"

for file in "$WALLPAPERS_FOLDER"/*.png; do
  filename=$(basename "$file")
  echo "| ![$filename](./$filename) $filename |" >>"$WALLPAPERS_MD"
done

# Format
pandoc -t commonmark_x "$WALLPAPERS_MD" -o "/tmp/wallpapers.md"
mv "/tmp/wallpapers.md" "$WALLPAPERS_MD"
