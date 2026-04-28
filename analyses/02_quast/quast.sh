#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 1
#SBATCH -c 2
#SBATCH --mem=16G
#SBATCH -t 01:00:00
#SBATCH -J quast
#SBATCH -o quast.out
#SBATCH -e quast.err

module load QUAST/5.3.0

quast.py \
~/GA/analyses/01_assembly/canu/assembly_output/e_faecium.contigs.fasta \
-o quast_output
