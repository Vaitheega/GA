#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH -J fastqc_rna
#SBATCH --output=fastqc_rna.%j.out

# Load module
module load FastQC

# Run FastQC on BH
fastqc ~/GA/data/rna_raw/BH/*.fastq.gz -o ~/GA/analyses/01_fastqc/rna/

# Run FastQC on Serum
fastqc ~/GA/data/rna_raw/Serum/*.fastq.gz -o ~/GA/analyses/01_fastqc/rna/
