#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <start_index> <end_index>"
  exit 1
fi

# Read the start and end indices
start_index=$1
end_index=$2

# Ensure the arguments are integers
if ! [[ "$start_index" =~ ^-?[0-9]+$ && "$end_index" =~ ^-?[0-9]+$ ]]; then
  echo "Both arguments must be integers."
  exit 1
fi

# Ensure start_index is less than or equal to end_index
if [ "$start_index" -gt "$end_index" ]; then
  echo "Start index should be less than or equal to end index."
  exit 1
fi

# Output file name
output_file="inputFile"

# Generate the file
> "$output_file" # Clear the file if it exists
for ((i=start_index; i<=end_index; i++)); do
  echo "$i, $((RANDOM % 1000))" >> "$output_file"
done

echo "File '$output_file' generated successfully."
