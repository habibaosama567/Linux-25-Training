#!/bin/bash

# Function to check if a number is positive
is_positive() {
    if [ "$1" -gt 0 ]; then
        return 0   # Positive
    else
        return 1   # Not positive
    fi
}

sum=0

while true; do
    read -p "Enter a number: " num
    if [ "$num" -eq 0 ]; then
        break
    fi
    if is_positive "$num"; then
        sum=$((sum + num))
    fi
done

echo "$sum"

