#!/bin/bash -l
#SBATCH -A uppmax2026-1-94
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J trimmomatic

module load bioinfo-tools
module load Trimmomatic/0.39-Java-17

# BH samples
for sample in ERR1797972 ERR1797973 ERR1797974
do
trimmomatic PE \
../data/rna_raw/BH/${sample}_1.fastq.gz \
../data/rna_raw/BH/${sample}_2.fastq.gz \
../data/trimmed_data/BH/trim_paired_${sample}_1.fastq.gz \
../data/trimmed_data/BH/trim_single_${sample}_1.fastq.gz \
../data/trimmed_data/BH/trim_paired_${sample}_2.fastq.gz \
../data/trimmed_data/BH/trim_single_${sample}_2.fastq.gz \
SLIDINGWINDOW:4:20 MINLEN:36
done

# Serum samples
for sample in ERR1797969 ERR1797970 ERR1797971
do
trimmomatic PE \
../data/rna_raw/Serum/${sample}_1.fastq.gz \
../data/rna_raw/Serum/${sample}_2.fastq.gz \
../data/trimmed_data/Serum/trim_paired_${sample}_1.fastq.gz \
../data/trimmed_data/Serum/trim_single_${sample}_1.fastq.gz \
../data/trimmed_data/Serum/trim_paired_${sample}_2.fastq.gz \
../data/trimmed_data/Serum/trim_single_${sample}_2.fastq.gz \
SLIDINGWINDOW:4:20 MINLEN:36
done
