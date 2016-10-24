# Combine data
file1 = c("fdr48.de.3.RData", "fdr48.de.4.RData", "fdr48.de.5.RData",
          "fdr48.de.6.RData", "fdr48.de.7.RData", "fdr48.de.8.RData",
          "fdr48.de.10.RData", "fdr48.de.17.RData", "fdr48.de.23.RData",
          "fdr48.de.28.RData", "fdr48.de.45.RData")
file2 = c("fdr48.ed.3.RData", "fdr48.ed.4.RData", "fdr48.ed.5.RData",
          "fdr48.ed.6.RData", "fdr48.ed.7.RData", "fdr48.ed.8.RData",
          "fdr48.ed.10.RData", "fdr48.ed.17.RData", "fdr48.ed.23.RData",
          "fdr48.ed.28.RData", "fdr48.ed.45.RData")
file3 = c("sen48.de.3.RData", "sen48.de.4.RData", "sen48.de.5.RData",
          "sen48.de.6.RData", "sen48.de.7.RData", "sen48.de.8.RData",
          "sen48.de.10.RData", "sen48.de.17.RData", "sen48.de.23.RData",
          "sen48.de.28.RData", "sen48.de.45.RData")
file4 = c("sen48.ed.3.RData", "sen48.ed.4.RData", "sen48.ed.5.RData",
          "sen48.ed.6.RData", "sen48.ed.7.RData", "sen48.ed.8.RData",
          "sen48.ed.10.RData", "sen48.ed.17.RData", "sen48.ed.23.RData",
          "sen48.ed.28.RData", "sen48.ed.45.RData")
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
saveRDS(fdr_de, file="fdr.48.de.RData")
saveRDS(fdr_ed, file="fdr.48.ed.RData")
saveRDS(sen_de, file="sen.48.de.RData")
saveRDS(sen_ed, file="sen.48.ed.RData")
