# Deseq2 Analysis of Htseq Counts Data from TCGA-BRCA

# Load the Library
library("DESeq2")
library("Biobase")

# Change the Working Directory
setwd("/Users/qux1/Documents/R/Deseq2")

# Load Data
directory = "/Users/qux1/Documents/R/Deseq2"
sampleFiles <- grep("brca", list.files(directory), value=TRUE)

# Construct sample counts matrix
sampleCondition <- factor(rep(c("Normal", "Tumor"), each = 10))
samplePatient=c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J")
sampleTable <- data.frame(sampleName = sampleFiles,
                          filename = sampleFiles,
                          condition = sampleCondition,
                          patient = samplePatient)

# Construct DESeq Dataset from the Matrix
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = directory,
                                       design = ~ patient + condition)
dim(ddsHTSeq)

# Pre-filtering
ddsHTSeq_fil <- ddsHTSeq[rowSums(counts(ddsHTSeq)) > 1,]
dim(ddsHTSeq_fil)
colData(ddsHTSeq_fil)
ddsHTSeq_fil$condition
ddsHTSeq_fil$patient

# Differential Gene Expression Test
ddsHTSeq_fil <- DESeq(ddsHTSeq_fil)
res <- results(ddsHTSeq_fil)
res
dim(res)

# Find out the DEGs with an Absolute Log2-Fold Change > 1.5
# and an Adjusted P-value < 0.05
# First We Remove the Rows with "NA" Adjusted P-values
res_rmna <- res[!is.na(res$padj), ]
dim(res_rmna)
res_padj <- res_rmna$padj < 0.05
table(res_padj)
res_PADJ <- res_rmna[res_padj, ]
res_padj_ordered <- res_PADJ[order(res_PADJ$padj), ]
gene_padj <- rownames(res_padj_ordered)
top20_padj_des <- gene_padj[1:20]
res_fc <- abs(res_rmna$log2FoldChange) > 1.5 
table(res_fc)
res_FC <- res_rmna[res_fc,]
res_fc_ordered <- res_FC[order(abs(res_FC$log2FoldChange),
                               decreasing = TRUE), ]
gene_fc <- rownames(res_fc_ordered)
top20_fc_des <- gene_fc[1:20]
res_deg <- res_rmna[res_fc & res_padj, ]
dim(res_deg)
DEGs_deseq2 <- rownames(res_deg)


# Export results to CSV Files
write.csv(as.data.frame(DEGs_deseq2), file="DEGs_deseq2")
write.csv(as.data.frame(gene_fc), file="Deseq2_fc")
write.csv(as.data.frame(gene_padj), file="Deseq2_padj")
