library("DESeq2")
library("ggplot2")
library("Cairo")

# Working directory
setwd("/proj/uppmax2026-1-61/nobackup/vaith_GA/GA/analyses/08_de")

# Count files
sampleFiles <- c(
"/proj/uppmax2026-1-61/nobackup/vaith_GA/GA/analyses/07_counts/ERR1797969_counts.txt",
"/proj/uppmax2026-1-61/nobackup/vaith_GA/GA/analyses/07_counts/ERR1797970_counts.txt",
"/proj/uppmax2026-1-61/nobackup/vaith_GA/GA/analyses/07_counts/ERR1797971_counts.txt",
"/proj/uppmax2026-1-61/nobackup/vaith_GA/GA/analyses/07_counts/ERR1797972_counts.txt",
"/proj/uppmax2026-1-61/nobackup/vaith_GA/GA/analyses/07_counts/ERR1797973_counts.txt",
"/proj/uppmax2026-1-61/nobackup/vaith_GA/GA/analyses/07_counts/ERR1797974_counts.txt"
)

# Sample names
sampleNames <- c(
"Serum1",
"Serum2",
"Serum3",
"BH1",
"BH2",
"BH3"
)

# Conditions
sampleCondition <- c(
"Serum",
"Serum",
"Serum",
"BH",
"BH",
"BH"
)

# Read first count file
countData <- read.table(
sampleFiles[1],
header = FALSE,
stringsAsFactors = FALSE
)

# Set gene IDs as row names
rownames(countData) <- countData[,1]

# Keep only count column
countData <- data.frame(countData[,2])

# Read remaining files
for(i in 2:length(sampleFiles)) {

tmp <- read.table(
sampleFiles[i],
header = FALSE,
stringsAsFactors = FALSE
)

countData <- cbind(countData, tmp[,2])

}

# Column names
colnames(countData) <- sampleNames

# Remove HTSeq summary rows
countData <- countData[!grepl("^__", rownames(countData)), ]

# Convert to matrix
countData <- as.matrix(countData)

# Convert counts to integers
storage.mode(countData) <- "integer"

# Metadata
colData <- data.frame(
row.names = sampleNames,
condition = sampleCondition
)

# Create DESeq2 dataset
dds <- DESeqDataSetFromMatrix(
countData = countData,
colData = colData,
design = ~ condition
)

# Run DESeq2
dds <- DESeq(dds)

# Get results
res <- results(dds)

# Order results
resOrdered <- res[order(res$padj), ]

# Save results
write.csv(
as.data.frame(resOrdered),
file = "DESeq2_results.csv"
)

# Variance stabilized data
vsd <- vst(dds, blind = FALSE)

# -----------------------------
# Improved PCA Plot
# -----------------------------

pcaData <- plotPCA(
vsd,
intgroup = "condition",
returnData = TRUE
)

percentVar <- round(
100 * attr(pcaData, "percentVar")
)

CairoPNG(
"PCA_plot.png",
width = 800,
height = 800
)

ggplot(
pcaData,
aes(
PC1,
PC2,
color = condition,
label = name
)
) +

geom_point(size = 4) +

geom_text(vjust = -1) +

xlab(
paste0(
"PC1: ",
percentVar[1],
"% variance"
)
) +

ylab(
paste0(
"PC2: ",
percentVar[2],
"% variance"
)
) +

theme_bw()

dev.off()

# -----------------------------
# Raw Counts Histogram
# -----------------------------

raw_counts <- countData[,1]

CairoPNG(
"raw_counts_hist.png",
width = 800,
height = 800
)

hist(
raw_counts,
breaks = 50,
main = "Raw counts distribution",
xlab = "Read count",
col = "skyblue"
)

dev.off()

# -----------------------------
# log2(count + 1) Histogram
# -----------------------------

log_counts <- log2(raw_counts + 1)

CairoPNG(
"log2_counts_hist.png",
width = 800,
height = 800
)

hist(
log_counts,
breaks = 50,
main = "log2(count + 1)",
xlab = "log2(count + 1)",
col = "skyblue"
)

dev.off()

# -----------------------------
# Volcano Plot
# -----------------------------

res_df <- as.data.frame(res)

res_df$significant <- res_df$padj < 0.05

CairoPNG(
"volcano_plot.png",
width = 800,
height = 800
)

ggplot(
res_df,
aes(
log2FoldChange,
-log10(padj),
color = significant
)
) +

geom_point(size = 1.5) +

xlab("log2 Fold Change") +

ylab("-log10 adjusted p-value") +

theme_bw()

dev.off()

# Summary
summary(res)