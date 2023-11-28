#!/bin/bash -e
source "$(dirname "$0")/functions.sh"  # Assuming functions.sh is in the same directory as heic_convert.sh

# Source directory containing HEIC files
src_dir="${1:-/images}"

# Check if src_dir ends with 'heic'
if [[ "$src_dir" == *heic ]]; then
  # Extract the parent directory without 'heic' to avoid recursion
  src_dir="${src_dir%/heic}"
fi

# set destination dir for heic files
heic_dir="$src_dir/heic"

# Use find_and_move to move HEIC files to the 'heic' folder with subnames
find_and_move "$src_dir" "$heic_dir" "heic"

# Convert HEIC to JPEG for all HEIC files in the source directory
for heic_file in "$heic_dir"/*.heic; do

  # Get the base file name without extension & remove spaces
  base_name=$(basename "$heic_file" .heic)
  #base_name="${base_name// /_}"

  # Check if the corresponding JPEG file already exists
  if [ ! -f "$src_dir/$base_name.jpg" ]; then

    # Convert HEIC to JPEG and save with the modified base name and a .jpg extension
    if convert "$heic_file" "$src_dir/$base_name.jpg"; then
      echo "Converted: $heic_file to $src_dir/$base_name.jpg"
    else
      echo "Failed: conversion errors on $heic_file" 
    fi
  else
    echo "Skipped: $heic_file (JPEG already exists: $src_dir/$base_name.jpg)"
  fi
done

echo "Conversion complete."

