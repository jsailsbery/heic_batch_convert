#!/bin/bash

# Define the safe_move function
safe_move() {
  local source_file="$1"  # Source file to be moved
  local destination_dir="$2"  # Destination directory

  # Create the destination directory if it doesn't exist
  mkdir -p "$destination_dir"

  local base_name=$(basename "$source_file")
  local target_path="$destination_dir/$base_name"

  # Check if the file already exists in the destination directory
  if [ -e "$target_path" ]; then
    # Extract the file name without extension and extension separately
    file_name_without_ext="${base_name%.*}"
    file_extension="${base_name##*.}"

    # Initialize a counter
    counter=1

    # Generate a new filename with subname until it's unique
    while [ -e "$destination_dir/${file_name_without_ext}_$counter.$file_extension" ]; do
      ((counter++))
    done

    # Construct the new target path with a unique subname
    target_path="$destination_dir/${file_name_without_ext}_$counter.$file_extension"
  fi

  mv "$source_file" "$target_path"
}

# Example usage of the safe_move function:
# safe_move "source_file.heic" "/destination_directory"


#!/bin/bash

# Define the find_and_move function
find_and_move() {
  local source_dir="$1"  # Source directory
  local destination_dir="$2"  # Destination directory
  local extension="$3"  # Optional file extension

  # Find files in the source directory based on the optional extension
  if [ -n "$extension" ]; then
    files_to_move=$(find "$source_dir" -maxdepth 1 -name "*.$extension")
  else
    files_to_move=$(find "$source_dir" -maxdepth 1)
  fi

  # Move files to the destination directory using the safe_move function
  if [ -n "$files_to_move" ]; then
    while IFS= read -r file; do
      safe_move "$file" "$destination_dir"
    done <<< "$files_to_move"
  else
    echo "No files to move."
  fi
}

# Example usage of the find_and_move function:
# find_and_move "/source_directory" "/destination_directory" "heic"

