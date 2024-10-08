#!/usr/bin/env bash

cd wallpapers || exit 1
for img in *.jpg; do
  optipng "$img"
done
