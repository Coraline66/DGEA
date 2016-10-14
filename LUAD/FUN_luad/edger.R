edger <- function(m, i, N, n, samp) {
  # Prepare the Files and Variables
  directory = "/Users/qux1/Documents/R/Rcode/LUAD_TvsN/data"
  if (m == N) {
    myfiles <- grep("luad", list.files(directory), value=TRUE)
    myclass <- rep(c("Normal", "Tumor"), each = 57)
    mylabel <- vector()
    for (j in 01:57) {
      mylabel <- append(mylabel, paste("normal_", j, sep=""))
    }
    for (j in 01:57) {
      mylabel <- append(mylabel, paste("tumor_", j, sep=""))
    }
  }
  if (m == n) {
    myfiles = list()
    for (j in 1:m) {
      myfiles <- append(myfiles, grep(as.character(samp[i,j]), 
                                      list.files(directory), 
                                      value=TRUE))
    }
    myclass <- rep(c("Normal", "Tumor"), n)
    mylabel <- as.character(myfiles)
  }
  
  datos <- readDGE (files = myfiles, path = directory,
                    group = myclass, labels = mylabel, header = FALSE)
  
  # Remove the Undesirable Rows at the End
  tails <- grepl ("_", rownames (datos$counts) )
  datos <- datos[!tails,]
  
  # Prefiltering
  datos_fil <- datos[rowSums(datos$counts) > 1,]
  
  # Apply Differential Gene Expression Analysis
  # First We Create a "DGEList" Object:
  dgeL <- DGEList (counts = datos_fil, group = datos_fil$samples$group)
  
  # Compute Normalization Factors
  dgeN <- calcNormFactors(dgeL)
  
  # Estimate Negative Binomial Dispersion 
  dgeD <- estimateDisp (dgeN)
  
  # Perform the Statistical Test
  result <- exactTest (dgeD)
  
  # Find out the DEGs with an Absolute Log2-Fold Change > 1
  # and an Adjusted P-value < 0.05
  p_adj <- p.adjust (result$table$PValue, "BH")
  result_padj <- p_adj < 0.05
  result_PADJ <- result[result_padj, ]
  result_padj_ordered <- topTags(result_PADJ, n = dim(result_PADJ)[1],
                                 "BH", sort.by = "p.value")
  genes_padj <- rownames(result_padj_ordered)      
  result_fc <- abs(result$table$logFC) > 1 
  result_FC <- result[result_fc,]
  result_fc_ordered <- result_FC[order(abs(result_FC$table$logFC), 
                                       decreasing = TRUE), ]
  genes_fc <- rownames(result_fc_ordered)
  result_ts <- result[result_fc & result_padj, ]
  dim(result_ts)
  ts_edg <- rownames(result_ts)
  Nts_edg <- length(ts_edg)
  
  # Return Results
  ls <- list("result"=result, "genes"=ts_edg, "number"=Nts_edg)
  return(ls)
}