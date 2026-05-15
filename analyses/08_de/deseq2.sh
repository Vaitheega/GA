#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 04:00:00
#SBATCH -J deseq2
#SBATCH --output=deseq2.%j.out

# Load modules
module load R/4.4.2-gfbf-2024a
module load R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2

# Run DESeq2 analysis
Rscript deseq2_analysis.R
