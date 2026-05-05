#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:30:00
#SBATCH -J prokka
#SBATCH --output=prokka.%j.out
#SBATCH --error=prokka.%j.err

module load prokka

INPUT=/home/vaith/GA/analyses/01_assembly/canu/assembly_output/e_faecium.contigs.fasta

prokka $INPUT \
  --outdir prokka_output \
  --prefix efaecium \
  --genus Enterococcus \
  --species faecium \
  --cpus 2
