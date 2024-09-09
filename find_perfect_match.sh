#!/bin/bash

query_file=$1
subject_file=$2
output_file=$3


blastn -query "$query_file" -subject "$subject_file" -task blastn-short -outfmt '6 qseqid sseqid pident length' -out "$output_file"


perfect_matches=$(awk '$3 == 100 && $4 == 28 {print}' "$output_file" | wc -l)


echo "Number of perfect matches: $perfect_matches"
