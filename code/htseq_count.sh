#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 04:00:00
#SBATCH -J htseq_count
#SBATCH --output=htseq_count.%j.out

# Load module
module load HTSeq/2.1.2-gfbf-2024a

# GFF annotation
GFF=/proj/uppmax2026-1-61/nobackup/vaith_GA/GA/analyses/05_prokka/prokka_output/efaecium_clean.gff

# BAM directory
BAMDIR=/proj/uppmax2026-1-61/nobackup/vaith_GA/GA/analyses/06_mapping/sorted_bam

# Output directory
OUTDIR=/proj/uppmax2026-1-61/nobackup/vaith_GA/GA/analyses/07_counts

# Create output directory
mkdir -p $OUTDIR

# Loop through BAM files
for BAM in $BAMDIR/*.sorted.bam
do

SAMPLE=$(basename $BAM .sorted.bam)

htseq-count \
-f bam \
-r pos \
-s no \
-t CDS \
-i ID \
$BAM \
$GFF \
> $OUTDIR/${SAMPLE}_counts.txt

done
