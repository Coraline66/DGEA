# Set Seed for Random Generation
SEED = 20160915
N <- 100
n <- 10

# Load the Library
library(DESeq2)
library(Biobase)
library(edgeR)
library(parallel)

# Generate Sample Matrix and Load Results 
source("deseq2.R")
source("edger.R")
source("rangen.R")
samp <- readRDS("samp10.RData")
en_de <- readRDS("TSde_48_1000_900.RData")
en_ed <- readRDS("TSed_48_1000_900.RData")
in_de <- readRDS("in_de10.RData")
in_ed <- readRDS("in_ed10.RData")

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
saveRDS(fil_des, file="fil48.de.10.RData")
saveRDS(fil_edg, file="fil48.ed.10.RData")
saveRDS(sen_de, file="sen48.de.10.RData")
saveRDS(sen_ed, file="sen48.ed.10.RData")
saveRDS(fdr_de, file="fdr48.de.10.RData")
saveRDS(fdr_ed, file="fdr48.ed.10.RData")