# Combine data
file1 = c("fdr51.de.3.RData", "fdr51.de.4.RData", "fdr51.de.5.RData",
          "fdr51.de.6.RData", "fdr51.de.7.RData", "fdr51.de.8.RData",
          "fdr51.de.10.RData", "fdr51.de.17.RData", "fdr51.de.23.RData",
          "fdr51.de.28.RData", "fdr51.de.45.RData")
file2 = c("fdr51.ed.3.RData", "fdr51.ed.4.RData", "fdr51.ed.5.RData",
          "fdr51.ed.6.RData", "fdr51.ed.7.RData", "fdr51.ed.8.RData",
          "fdr51.ed.10.RData", "fdr51.ed.17.RData", "fdr51.ed.23.RData",
          "fdr51.ed.28.RData", "fdr51.ed.45.RData")
file3 = c("sen51.de.3.RData", "sen51.de.4.RData", "sen51.de.5.RData",
          "sen51.de.6.RData", "sen51.de.7.RData", "sen51.de.8.RData",
          "sen51.de.10.RData", "sen51.de.17.RData", "sen51.de.23.RData",
          "sen51.de.28.RData", "sen51.de.45.RData")
file4 = c("sen51.ed.3.RData", "sen51.ed.4.RData", "sen51.ed.5.RData",
          "sen51.ed.6.RData", "sen51.ed.7.RData", "sen51.ed.8.RData",
          "sen51.ed.10.RData", "sen51.ed.17.RData", "sen51.ed.23.RData",
          "sen51.ed.28.RData", "sen51.ed.45.RData")
fdr_des <- vector(mode = "list")
fdr_edg <- vector(mode = "list")
sen_des <- vector(mode = "list")
sen_edg <- vector(mode = "list")
for (i in 1:11) {
    fdr_des[[i]] <- readRDS(file1[i]) 
    fdr_edg[[i]] <- readRDS(file2[i])
    sen_des[[i]] <- readRDS(file3[i])
    sen_edg[[i]] <- readRDS(file4[i])
}
fdr_de <- vector(mode = "list")
fdr_ed <- vector(mode = "list")
sen_de <- vector(mode = "list")
sen_ed <- vector(mode = "list")
for (i in 1:11) {
    for (j in 1:100) {
        fdr_de[[(100*(i-1) + j)]] <- fdr_des[[i]][[j]]
        fdr_ed[[(100*(i-1) + j)]] <- fdr_edg[[i]][[j]]
        sen_de[[(100*(i-1) + j)]] <- sen_des[[i]][[j]]
        sen_ed[[(100*(i-1) + j)]] <- sen_edg[[i]][[j]]
    }
}
saveRDS(fdr_de, file="fdr.51.de.RData")
saveRDS(fdr_ed, file="fdr.51.ed.RData")
saveRDS(sen_de, file="sen.51.de.RData")
saveRDS(sen_ed, file="sen.51.ed.RData")
