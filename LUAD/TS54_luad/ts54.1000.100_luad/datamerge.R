# Combine data
file1 = c("fdr54_de.3.RData", "fdr54_de.4.RData", "fdr54_de.5.RData",
          "fdr54_de.6.RData", "fdr54_de.7.RData", "fdr54_de.8.RData",
          "fdr54_de.10.RData", "fdr54_de.17.RData", "fdr54_de.23.RData",
          "fdr54_de.28.RData", "fdr54_de.45.RData")
file2 = c("fdr54_ed.3.RData", "fdr54_ed.4.RData", "fdr54_ed.5.RData",
          "fdr54_ed.6.RData", "fdr54_ed.7.RData", "fdr54_ed.8.RData",
          "fdr54_ed.10.RData", "fdr54_ed.17.RData", "fdr54_ed.23.RData",
          "fdr54_ed.28.RData", "fdr54_ed.45.RData")
file3 = c("sen54_de.3.RData", "sen54_de.4.RData", "sen54_de.5.RData",
          "sen54_de.6.RData", "sen54_de.7.RData", "sen54_de.8.RData",
          "sen54_de.10.RData", "sen54_de.17.RData", "sen54_de.23.RData",
          "sen54_de.28.RData", "sen54_de.45.RData")
file4 = c("sen54_ed.3.RData", "sen54_ed.4.RData", "sen54_ed.5.RData",
          "sen54_ed.6.RData", "sen54_ed.7.RData", "sen54_ed.8.RData",
          "sen54_ed.10.RData", "sen54_ed.17.RData", "sen54_ed.23.RData",
          "sen54_ed.28.RData", "sen54_ed.45.RData")
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
saveRDS(fdr_de, file="fdr_54.de.RData")
saveRDS(fdr_ed, file="fdr_54.ed.RData")
saveRDS(sen_de, file="sen_54.de.RData")
saveRDS(sen_ed, file="sen_54.ed.RData")
