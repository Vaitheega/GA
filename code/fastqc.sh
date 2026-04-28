#!/bin/bash -l
#SBATCH -A uppmax2026-1-94
#SBATCH -p pelle
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J fastqc

module load FastQC/0.12.1-Java-17

cd ~/GA/analyses/00_QC/pacbio
mkdir -p fastqc_results
fastqc *.fastq.gz -o fastqc_results