#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 4
#SBATCH -t 08:00:00
#SBATCH -J bwa_mapping
#SBATCH --output=bwa_mapping.%j.out

# Load modules
module load BWA/0.7.19-GCCcore-13.3.0
module load SAMtools/1.22.1-GCC-13.3.0

# Reference genome
REF=/proj/uppmax2026-1-61/nobackup/vaith_GA/GA/analyses/01_assembly/canu/assembly_output/e_faecium.contigs.fasta

# Output folders
SAMDIR=/proj/uppmax2026-1-61/nobackup/vaith_GA/GA/analyses/06_mapping/sam
BAMDIR=/proj/uppmax2026-1-61/nobackup/vaith_GA/GA/analyses/06_mapping/bam
SORTDIR=/proj/uppmax2026-1-61/nobackup/vaith_GA/GA/analyses/06_mapping/sorted_bam

# BH samples
for SAMPLE in ERR1797972 ERR1797973 ERR1797974
do

bwa mem $REF \
/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/trimmed/trim_paired_${SAMPLE}_pass_1.fastq.gz \
/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/trimmed/trim_paired_${SAMPLE}_pass_2.fastq.gz \
> $SAMDIR/${SAMPLE}.sam

samtools view -bS \
$SAMDIR/${SAMPLE}.sam \
> $BAMDIR/${SAMPLE}.bam

samtools sort \
$BAMDIR/${SAMPLE}.bam \
-o $SORTDIR/${SAMPLE}.sorted.bam

samtools index \
$SORTDIR/${SAMPLE}.sorted.bam

done

# SERUM samples
for SAMPLE in ERR1797969 ERR1797970 ERR1797971
do

bwa mem $REF \
/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trimmed/trim_paired_${SAMPLE}_pass_1.fastq.gz \
/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trimmed/trim_paired_${SAMPLE}_pass_2.fastq.gz \
> $SAMDIR/${SAMPLE}.sam

samtools view -bS \
$SAMDIR/${SAMPLE}.sam \
> $BAMDIR/${SAMPLE}.bam

samtools sort \
$BAMDIR/${SAMPLE}.bam \
-o $SORTDIR/${SAMPLE}.sorted.bam

samtools index \
$SORTDIR/${SAMPLE}.sorted.bam

done