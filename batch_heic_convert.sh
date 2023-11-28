#!/bin/bash

# Parent directory where you want to search for HEIC files
parent_dir="${1:-/images}"

# Full path to the heic_convert.sh script
heic_convert_script="/usr/bin/heic_convert.sh"

# Find all directories containing HEIC files in the parent directory
heic_directories=$(find "$parent_dir" -type f -name "*.heic" -exec dirname {} \; | sort -u)

# Loop through the list of directories
for dir in $heic_directories; do
  # Run heic_convert.sh in the directory with source_dir argument
  "$heic_convert_script" "$dir"
done

echo "Conversion of HEIC files in subdirectories complete."

