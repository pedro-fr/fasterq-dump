#!/usr/bin/bash

# This script is used to download SRA files from NCBI using fastq-dump
# Usage: fastq-dump.sh <SRR_Acc_List.txt> <output_directory>

## Parameters ##

# Check if the user has provided an SRR_Acc_List.txt file
if [ -z "$1" ]; then
    read -p "Please provide an SRR_Acc_List.txt: " input_file
else
    input_file="$1"
fi

# Check if the user has provided an output directory 
# to store the downloaded files
if [ -z "$2" ]; then
    read -p "Please provide a path to output directory: " output_dir
else
    output_dir="$2"
fi

## Downloading SRA files from NCBI using fastq-dump ##
echo "Downloading SRA files from NCBI using fastq-dump"

# While loop to read the SRR_Acc_List.txt file and download the SRA files
while read -r sample; do
    echo "Downloading sample $sample"
    fastq-dump --split-3 "$sample" --outdir "$output_dir"
done < "$input_file"

echo "Download complete"
echo "Downloaded files are stored in $output_dir"