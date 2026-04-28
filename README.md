Genome Analysis Project – Enterococcus faecium

 Overview

This project performs de novo genome assembly of Enterococcus faecium using PacBio long-read sequencing data.

The goal is to reconstruct the genome from raw sequencing reads and evaluate the quality and completeness of the assembly.

Data
Type: PacBio long-read data
Organism: Enterococcus faecium
Location: UPPMAX (not included in repository)

Tools Used
FastQC → quality control
Canu → genome assembly
QUAST → assembly evaluation
BUSCO → genome completeness
MUMmer → genome comparison

 Workflow
1. Quality Control (FastQC)

Raw reads were checked to evaluate sequencing quality and read length distribution.

2. Genome Assembly (Canu)

Long reads were assembled into contigs to reconstruct the genome.

3. Assembly Evaluation (QUAST)

Assembly statistics such as genome size and contig length were calculated.

4. Genome Completeness (BUSCO)

The completeness of the genome was assessed using conserved bacterial genes.

5. Genome Comparison (MUMmer)

The assembled genome was compared with a reference genome using a dot plot.

Results
The assembly produced large contigs, indicating good assembly quality
BUSCO results suggest the genome is mostly complete
MUMmer plot shows strong similarity with the reference genome
Some fragmentation is present, meaning the genome is not fully continuous

Scripts
code/fastqc.sh
analyses/01_assembly/canu/canu.sh
analyses/02_quast/quast.sh
analyses/03_busco/busco.sh
analyses/04_mummer/mummer.sh

How to Run
sbatch code/fastqc.sh
sbatch analyses/01_assembly/canu/canu.sh
sbatch analyses/02_quast/quast.sh
sbatch analyses/03_busco/busco.sh
sbatch analyses/04_mummer/mummer.sh

Notes
Raw data and large output files are not included
Only scripts and selected results are provided
All analyses were performed on UPPMAX
