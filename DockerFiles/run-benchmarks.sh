#!/bin/sh

git clone https://github.com/KidmanC/DockerFiles.git
cd DockerFiles

LANGUAGES=("java" "python" "javascript" "kotlin" "rust")

echo "Language, Execution Time (ms)" > results.csv

for lang in "${LANGUAGES[@]}"; do
	echo "Building and running $lang implementation..."

	docker build -t "countingsort-$lang" "./$lang"

	time=$(docker run --rm "countingsort-$lang")

	echo
