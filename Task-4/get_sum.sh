#!/bin/bash
# Script: get_sum.sh
# Description: Asks user for numbers, sums positive ones until 0 is entered

# Function to check if a number is positive
is_positive() {
    local num=$1
    if [ "$num" -gt 0 ]; then
        return 0   # true (positive)
    else
        return 1   # false (not positive)
    fi
}

sum=0

# Loop to read user input until 0 is entered
while true; do
    read -p "Enter a number (0 to stop): " num

    if [ "$num" -eq 0 ]; then
        break
    fi

    if is_positive "$num"; then
        sum=$((sum + num))
    fi
done

echo "Sum of positive numbers: $sum"
