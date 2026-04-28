#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 1
#SBATCH -c 2
#SBATCH --mem=32G
#SBATCH -t 06:00:00
#SBATCH -J busco
#SBATCH -o busco.out
#SBATCH -e busco.err

# Load BUSCO 
module load BUSCO/5.8.2-gfbf-2024a

# Run BUSCO
busco \
-i ../01_assembly/canu/assembly_output/e_faecium.contigs.fasta \
-o busco_output \
-l /sw/data/local/BUSCO_Data/v5/lineages/bacteria_odb10 \
-m genome \
-c 2
