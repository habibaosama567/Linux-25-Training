#!/bin/bash
# Script: extract_key.sh
# Description: Extracts two archives (.zip or .tar.xz) into extracted_files folder

set -e  # Exit if any command fails

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <archive1> <archive2>"
    exit 1
fi

# Create target extraction folder
outdir="extracted_files"
mkdir -p "$outdir" || { echo "Failed to create $outdir"; exit 1; }

extract_archive() {
    local file="$1"
    local dest="$2"

    if [[ "$file" == *.zip ]]; then
        unzip -o "$file" -d "$dest"
    elif [[ "$file" == *.tar.xz ]]; then
        tar -xJf "$file" -C "$dest"
    else
        echo "Unsupported file format: $file"
        exit 1
    fi
}


extract_archive "$1" "$outdir"
extract_archive "$2" "$outdir"



