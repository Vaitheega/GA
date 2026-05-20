#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH -J bwa_index
#SBATCH --output=bwa_index.%j.out

# Load BWA
module load BWA/0.7.19-GCCcore-13.3.0

# Build genome index using PacBio assembled genome
bwa index /home/vaith/GA/analyses/01_assembly/canu/assembly_output/e_faecium.contigs.fasta
