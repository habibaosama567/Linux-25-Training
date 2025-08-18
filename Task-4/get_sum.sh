#!/bin/bash

is_positive() {
    if [ "$1" -gt 0 ] 2>/dev/null; then
        return 0
    else
        return 1
    fi
}

sum=0

# If input is piped, read from stdin
if [ ! -t 0 ]; then
    while read -r num; do
        if [ "$num" -eq 0 ] 2>/dev/null; then
            break
        fi
        if is_positive "$num"; then
            sum=$((sum + num))
        fi
    done
else
    # Interactive mode
    while true; do
        read -p "Enter a number (0 to stop): " num
        if [ "$num" -eq 0 ] 2>/dev/null; then
            break
        fi
        if is_positive "$num"; then
            sum=$((sum + num))
        fi
    done
fi

echo "Sum of positive numbers: $sum"
