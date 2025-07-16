#!/bin/bash

# Define the source directory where the search starts
SOURCE_DIR="/home/rowan/.local/share/Steam/steamapps/workshop/content/440/"
TARGET_DIR="./tf/maps"  # Output directory for compressed files

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Find all .bsp files in subdirectories
find "$SOURCE_DIR" -type f -name "*.bsp" | while read bsp_file; do
    # Get the filename without the path
    filename=$(basename "$bsp_file")
    
    # Copy the file to the target directory
    cp "$bsp_file" "$TARGET_DIR/$filename"

    # Compress the copied file with bzip2
    bzip2 -f "$TARGET_DIR/$filename"

    echo "Copied and compressed: $bsp_file -> $TARGET_DIR/$filename.bz2"
done

echo "All .bsp files have been copied and compressed using bzip2."

echo "Deleting undesirable maps"
rm ./tf/maps/surf_kitsune2_tf2.bsp.bz2
