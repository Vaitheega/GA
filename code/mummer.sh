#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 1
#SBATCH -c 2
#SBATCH --mem=16G
#SBATCH -t 00:30:00
#SBATCH -J mummer
#SBATCH -o mummer.out
#SBATCH -e mummer.err

# Load modules
module load MUMmer/4.0.1-GCCcore-13.3.0
module load gnuplot

# Align your assembly to reference
nucmer \
~/GA/data/reference.fasta \
~/GA/analyses/01_assembly/canu/assembly_output/e_faecium.contigs.fasta \
-p alignment

# Filter best alignments
delta-filter -1 alignment.delta > alignment.filter

# Generate plot
mummerplot -png -p plot alignment.filter