#!/bin/bash

# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <archive1> <archive2>"
    exit 1
fi

# Create timestamped folder
timestamp=$(date +%Y%m%d_%H%M%S)
folder="extracted_$timestamp"
mkdir -p "$folder"

# Function to extract an archive
extract_archive() {
    local file="$1"

    if [[ "$file" == *.zip ]]; then
        unzip -q "$file" -d "$folder"
    elif [[ "$file" == *.tar.xz ]]; then
        tar -xf "$file" -C "$folder"
    else
        echo "Unsupported file format: $file"
        exit 1
    fi
}

# Extract both archives
extract_archive "$1"
extract_archive "$2"

echo "Extraction complete. Files are in '$folder'"

