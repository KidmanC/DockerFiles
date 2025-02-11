#!/bin/bash

# Define an array with folder names
folders=("python" "javascript" "java" "rust" "kotlin")

# Loop through each folder
for folder in "${folders[@]}"; do
    echo "Processing $folder..."

    # Build the Docker image
    docker build -t "${folder}_benchmark" "$folder"

    # Run the container
    docker run --rm "${folder}_benchmark"

    echo "$folder benchmark completed."
done

echo "All benchmarks finished."

