# Set Seed for Random Generation
SEED = 20160915
N <- 100
n <- 7

# Load the Library
library(DESeq2)
library(Biobase)
library(edgeR)
library(parallel)

# Generate Sample Matrix and Load Results 
source("deseq2.R")
source("edger.R")
source("rangen.R")
samp <- rangen(SEED, N, n)
en_de <- readRDS("TSde_51_100_90.RData")
en_ed <- readRDS("TSed_51_100_90.RData")

# Perform Deseq2 and edgeR Differential Analysis to a Randomly Generated Group 
# Consisted of n Normal-Tumor Pairs N Times Including Filtering
no_cores <- detectCores() - 1
cl <- makeCluster(no_cores)
clusterExport(cl=cl, c("N", "n", "samp", "deseq2", "edger"),
              envir=environment())
k <- 1:N
in_de <- parLapply(cl, k,
                   function(k) {
                       library(DESeq2)
                       deseq2(n, k, N, n, samp)
                   })
in_ed <- parLapply(cl, k,
                   function(k) {
                       library(edgeR)
                       edger(n, k, N, n, samp)
                   })
stopCluster(cl)

# "fil" is a Self-Defined Function which Finds out Each Filtered 
# Gene List and Calculate the Numbers of "FP", "TP", "FN" for them.
source("fil.R")
no_cores <- detectCores() - 1
cl <- makeCluster(no_cores)
clusterExport(cl=cl, c("N", "n", "samp", "en_de", "in_de", "en_ed", 
                       "in_ed", "fil"),
              envir=environment())
k <- 1:N
fil_des <- parLapply(cl, k,
                     function(k) {
                         fil(N, n, k, "d", samp, en_de, in_de, 
                             en_ed, in_ed)
                     })
fil_edg <- parLapply(cl, k,
                     function(k) {
                         fil(N, n, k, "e", samp, en_de, in_de, 
                             en_ed, in_ed)
                     })
stopCluster(cl)

# Compute Sensitivity(true positive rate)
sen_de <- lapply(1:N, function(i) {
    round(fil_des[[i]]$Ntp / length(en_de), digits=3)
})
sen_ed <- lapply(1:N, function(i) {
    round(fil_edg[[i]]$Ntp / length(en_ed), digits=3)
})

# Compute FDR = 1 - PPV, PPV = TP / (TP + FP)
fdr_de <- lapply(1:N, function(i) {
    round(fil_des[[i]]$Nfp / in_de[[i]]$number, digits=3)
})
fdr_ed <- lapply(1:N, function(i) {
    round(fil_edg[[i]]$Nfp / in_ed[[i]]$number, digits=3)
})

# Save Data
saveRDS(fil_des, file="fil51.de7.RData")
saveRDS(fil_edg, file="fil51.ed7.RData")
saveRDS(sen_de, file="sen51.de7.RData")
saveRDS(sen_ed, file="sen51.ed7.RData")
saveRDS(fdr_de, file="fdr51.de7.RData")
saveRDS(fdr_ed, file="fdr51.ed7.RData")