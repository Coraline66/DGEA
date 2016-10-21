# Set Seed for Random Generation
SEED = 20160915
N <- 100
n <- 5

# Load the Library
library(DESeq2)
library(Biobase)
library(edgeR)
library(parallel)

# Generate Sample Matrix and Load Results 
en_de <- readRDS("TSde_51_1000_1000.RData")
en_ed <- readRDS("TSed_51_1000_1000.RData")
in_de <- readRDS("in_de5.RData")
in_ed <- readRDS("in_ed5.RData")
fil_des <- readRDS("fil51_de.5.RData")
fil_edg <- readRDS("fil51_ed.5.RData")

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
saveRDS(sen_de, file="sen51_de.5.RData")
saveRDS(sen_ed, file="sen51_ed.5.RData")
saveRDS(fdr_de, file="fdr51_de.5.RData")
saveRDS(fdr_ed, file="fdr51_ed.5.RData")