#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH -J fastqc_trimmed
#SBATCH --output=fastqc_trimmed.%j.out

module load FastQC

# BH trimmed
fastqc /proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/trimmed/*.fastq.gz -o /home/vaith/GA/analyses/01_fastqc/rna_trimmed/

# Serum trimmed
fastqc /proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trimmed/*.fastq.gz -o /home/vaith/GA/analyses/01_fastqc/rna_trimmed/
