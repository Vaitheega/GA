#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=32G
#SBATCH -t 12:00:00
#SBATCH -J canu_assembly
#SBATCH -o canu.out
#SBATCH -e canu.err

# Load modules
module load canu/2.3-GCCcore-13.3.0-Java-17
module load SAMtools/1.22.1-GCC-13.3.0

# Run Canu assembly

canu -p e_faecium \
     -d assembly_output \
     genomeSize=2.8m \
     useGrid=false \
     gridOptions="--account=uppmax2026-1-61" \
     -pacbio-raw /proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/genomics_data/PacBio/*.fastq.gz