#!/usr/bin/env bash

# Desktop view (3 column)
WALLPAPERS_FOLDER="./wallpapers"
WALLPAPERS_MD="./README.md"
[[ -d "$WALLPAPERS_FOLDER" ]] || (echo "Wallpapers folder not found" && exit 1)

cat <<EOT >"$WALLPAPERS_MD"
# Nixy Wallpapers

A collection of wallpapers for [Nixy](https://github.com/anotherhadi/nixy).
See the [mobile readme (1 columns)](./docs/MOBILE-VIEW.md)

| Preview |    |    |
| ------- | -- | -- |
EOT

# Put the wallpapers in 3 columns
i=0
for file in "$WALLPAPERS_FOLDER"/*.png; do
  filename=$(basename "$file")
  printf "| ![$filename](./wallpapers/$filename) $filename " >>"$WALLPAPERS_MD"
  i=$((i + 1))
  if [ "$i" -eq 3 ]; then
    echo "|" >>"$WALLPAPERS_MD"
    i=0
  fi
done
if [ "$i" -ne 0 ]; then
  echo "|" >>"$WALLPAPERS_MD"
fi

# Mobile view (1 column)

WALLPAPERS_FOLDER="./wallpapers"
WALLPAPERS_MD="./docs/MOBILE-VIEW.md"
[[ -d "$WALLPAPERS_FOLDER" ]] || (echo "Wallpapers folder not found" && exit 1)

cat <<EOT >"$WALLPAPERS_MD"
# Nixy Wallpapers

A collection of wallpapers for [Nixy](https://github.com/anotherhadi/nixy).
See the [desktop readme (3 columns)](../README.md)

| Preview |
| ------- |
EOT

for file in "$WALLPAPERS_FOLDER"/*.png; do
  filename=$(basename "$file")
  echo "| ![$filename](../wallpapers/$filename) $filename |" >>"$WALLPAPERS_MD"
done
