#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <archive1> <archive2>"
    exit 1
fi

# Create a unique timestamped folder
timestamp=$(date +%Y%m%d_%H%M%S)
output_dir="extracted_${timestamp}"
mkdir -p "$output_dir"

extract_archive() {
    file="$1"
    if [[ $file == *.zip ]]; then
        unzip -q "$file" -d "$output_dir"
    elif [[ $file == *.tar.xz ]]; then
        tar -xf "$file" -C "$output_dir"
    else
        echo "Unsupported file type: $file"
        exit 1
    fi
}

# Extract both archives
extract_archive "$1"
extract_archive "$2"

echo "Files extracted into $output_dir"
