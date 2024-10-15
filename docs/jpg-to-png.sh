#!/usr/bin/env bash

cd wallpapers || exit 1
for img in *.jpg; do
  convert "$img" "${img%.jpg}.png"
  rm "$img"
done
