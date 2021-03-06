# Set Seed for Random Generation
SEED = 20161011
N <- 1000
n <- 48

# Load the Library
library(DESeq2)
library(Biobase)
library(edgeR)
library(parallel)

# Generate Sample Matrix and Perform Deseq Differential Gene Expression Analysis 
# for the Whole Sample Group
source("deseq2.R")
source("edger.R")
source("rangen.R")
samp <- rangen(SEED, N, n)
en_de <- readRDS("en_de.RData") 
en_ed <- readRDS("en_ed.RData")
ts_des <- en_de$genes
ts_edg <- en_ed$genes

# Perform Deseq2 and edgeR Analysis for Each Group in the Generated Matrix above
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

# "filter" is a Self-Defined Function which Finds out Each Filtered 
# Gene List and Calculate the Numbers of "FP", "TP", "FN" for them.
# Find out the Intersections of the Original "Truth Set" and 
# Each Filtered Gene Lists.
source("filter.R")
no_cores <- detectCores() - 1
cl <- makeCluster(no_cores)
clusterExport(cl=cl, c("N", "n", "samp", "en_de", "in_de", "en_ed", 
                       "in_ed", "filter"),
              envir=environment())
k <- 1:N
fil_des <- parLapply(cl, k,
                     function(k) {
                         filter(N, n, k, "d", samp, en_de, in_de, 
                                en_ed, in_ed)
                     })
fil_edg <- parLapply(cl, k,
                     function(k) {
                         filter(N, n, k, "e", samp, en_de, in_de, 
                                en_ed, in_ed)
                     })
stopCluster(cl)

# Calculate the size of "Truth Set" No.2, which is the intersection of 
# all gene lists and the original "Truth Set"
for (i in 1:N) {
    ts_des <- intersect(ts_des,in_de[[i]]$genes)
    ts_edg <- intersect(ts_edg,in_ed[[i]]$genes)
}
Nts_des <- length(ts_des)
Nts_edg <- length(ts_edg)

# Calculate the number of genes in the intersection of at least 90 gene 
# lists and the original "Truth Set"
source("tp.R")
Ndes <- en_de$number
Nedg <- en_ed$number
Nde_900 <- tp(900, N, "d", Ndes, Nedg, en_de, in_de, en_ed, in_ed)
Ned_900 <- tp(900, N, "e", Ndes, Nedg, en_de, in_de, en_ed, in_ed)

# Save Data
saveRDS(samp, file="samp_48.RData")
saveRDS(in_de, file="in_de.48.RData")
saveRDS(in_ed, file="in_ed.48.RData")
saveRDS(fil_des, file="fi.de48.RData")
saveRDS(fil_edg, file="fi.ed48.RData")
saveRDS(ts_des, file="TSde_48_1000_1000.RData")
saveRDS(ts_edg, file="TSed_48_1000_1000.RData")
saveRDS(Nde_900$int_tp, file="TSde_48_1000_900.RData")
saveRDS(Ned_900$int_tp, file="TSed_48_1000_900.RData")
