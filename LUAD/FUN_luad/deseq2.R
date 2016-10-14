deseq2 <- function(m, i, N, n, samp) {
  # Load Data 
  sampleFiles = list()
  directory = "/Users/qux1/Documents/R/Rcode/LUAD_TvsN/data"
  if (m == N) {
    sampleFiles <- grep("luad", list.files(directory), value=TRUE)
  }
  if (m == n) {
    for (j in 1:m) {
      sampleFiles <- append(sampleFiles, 
                            grep(as.character(samp[i,j]), 
                                 list.files(directory), 
                                 value=TRUE))
    }
  }
  
  # Construct sample counts matrix
  if (m == N) {
    sampleCondition <- factor(rep(c("Normal", "Tumor"), each = 57))
    sampleTable <- data.frame(sampleName = sampleFiles,
                              filename = sampleFiles,
                              condition = sampleCondition)  
  }
  if (m == n) {
    sampleFiles <- as.character(sampleFiles)
    sampleFiles <- sort(sampleFiles)
    sampleCondition <- factor(rep(c("Normal", "Tumor"), each = n))
    sampleTable <- data.frame(sampleName = sampleFiles,
                              filename = sampleFiles,
                              condition = sampleCondition)
  }
  
  # Construct DESeq Dataset from the Matrix
  ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                         directory = directory,
                                         design = ~ condition)
  
  # Pre-filtering
  ddsHTSeq_fil <- ddsHTSeq[rowSums(counts(ddsHTSeq)) > 1,]
  
  # Differential Gene Expression Test
  ddsHTSeq_fil <- DESeq(ddsHTSeq_fil)
  res <- results(ddsHTSeq_fil)
  
  # Find out the DEGs with an Absolute Log2-Fold Change > 1
  # and an Adjusted P-value < 0.05
  # First We Remove the Rows with "NA" Adjusted P-values
  res_rmna <- res[!is.na(res$padj), ]
  dim(res_rmna)
  res_padj <- res_rmna$padj < 0.05
  res_PADJ <- res_rmna[res_padj, ]
  res_padj_ordered <- res_PADJ[order(res_PADJ$padj), ]
  gene_padj <- rownames(res_padj_ordered)
  res_fc <- abs(res_rmna$log2FoldChange) > 1
  res_FC <- res_rmna[res_fc,]
  res_fc_ordered <- res_FC[order(abs(res_FC$log2FoldChange),
                                 decreasing = TRUE), ]
  gene_fc <- rownames(res_fc_ordered)
  res_ts <- res_rmna[res_fc & res_padj, ]
  dim(res_ts)
  ts_des <- rownames(res_ts)
  Nts_des <- length(ts_des)
  
  # Return Results
  ls <- list("result"=res, "genes"=ts_des, "number"=Nts_des)
  return(ls)
}