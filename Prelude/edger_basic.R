# Use edgeR to Do Differential Analysis of Htseq Counts Data 
# from TCGA-BRCA

# Change the Working Directory
setwd("/Users/qux1/Documents/R/edgeR")

# Load the Library
library (edgeR)

# Prepare the Files and Variables
direc = "/Users/qux1/Documents/R/edgeR"
myfiles <- grep("brca", list.files(direc), value=TRUE)
#myfiles <- c ("normal01_brca.txt", "normal02_brca.txt", 
#              "normal03_brca.txt", "normal04_brca.txt"
#              "tumor01_brca.txt",
#              "tumor02_brca.txt", "tumor03_brca.txt")
myclass <- rep(c("Normal", "Tumor"), each = 10)
mylabel <- c("normal_01", "normal_02", "normal_03",
             "normal_04", "normal_05", "normal_06",
             "normal_07", "normal_08", "normal_09",
             "normal_10", "tumor_01", "tumor_02",
             "tumor_03", "tumor_04", "tumor_05",
             "tumor_06", "tumor_07", "tumor_08",
             "tumor_09", "tumor_10")
cbind(myfiles, myclass, mylabel)

datos <- readDGE (files = myfiles, path = direc,
                  group = myclass, labels = mylabel, header = FALSE)
class (datos)
datos
dim (datos)

# Remove the Undesirable Rows at the End
tail (datos$counts)
tails <- grepl ("_", rownames (datos$counts) )
table (tails)
datos <- datos[!tails,]
dim (datos)

# Prefiltering
# datos_fil <- datos[rowSums(cpm(datos)) > 1,]
datos_fil <- datos[rowSums(datos$counts) > 1,]
dim(datos_fil)

# Compute Counts Per Million
cpms <- cpm (datos_fil)
summary (cpms)

# Apply Differential Gene Expression Analysis
# First We Create a "DGEList" Object:
dgeL <- DGEList (counts = datos_fil, group = datos_fil$samples$group)
dgeL
class (dgeL)

# Compute Normalization Factors
dgeN <-  calcNormFactors (dgeL)
dgeN

# Explore the "relationship" between the samples in a PCA wise plot
plotMDS (dgeN)

# Estimate Common Negative Binomial Dispersion 
dgeD <- estimateCommonDisp (dgeN)
dgeD
dgeD <- estimateTagwiseDisp (dgeD)
dgeD

# Perform the Statistical Test
result <- exactTest (dgeD)
class (result)
result
dim(result)

# Find out the DEGs with an Absolute Log2-Fold Change > 1.5
# and an Adjusted FDR < 0.05
p_adj <- p.adjust (result$table$PValue, "BH")
result_padj <- p_adj < 0.05
table (result_padj)
result_PADJ <- result[result_padj, ]
result_padj_ordered <- topTags(result_PADJ, n = dim(result_PADJ)[1],
                               "BH", sort.by = "p.value")
genes_padj <- rownames(result_padj_ordered) 
top20_padj_edg <- genes_padj[1:20]
result_fc <- abs(result$table$logFC) > 1.5 
table(result_fc)
result_FC <- result[result_fc,]
result_fc_ordered <- result_FC[order(abs(result_FC$table$logFC), 
                                     decreasing = TRUE), ]
genes_fc <- rownames(result_fc_ordered)
top20_fc_edg <- genes_fc[1:20]
result_deg <- result[result_fc & result_padj, ]
dim(result_deg)
DEGs_edgeR <- rownames(result_deg)


# Export results to CSV Files
write.csv(as.data.frame(DEGs_edgeR), file="DEGs_edgeR")
write.csv(as.data.frame(genes_padj), file="edgeR_padj")
write.csv(as.data.frame(genes_fc), file="edgeR_fc")