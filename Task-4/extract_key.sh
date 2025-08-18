#!/bin/bash


if [ $# -ne 2 ]; then
    echo "Usage: $0 <archive1> <archive2>"
    exit 1
fi

mkdir -p extracted_files
rm -rf extracted_files/*


extract_archive() {
    file="$1"
    if [[ $file == *.zip ]]; then
        unzip -q "$file" -d extracted_files
    elif [[ $file == *.tar.xz ]]; then
        tar -xf "$file" -C extracted_files
    else
        echo "Unsupported file type: $file"
        exit 1
    fi
}

# Extract both archives
extract_archive "$1"
extract_archive "$2"


