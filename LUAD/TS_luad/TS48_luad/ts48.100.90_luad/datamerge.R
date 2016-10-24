# Combine data
file1 = c("fdr48.de3.RData", "fdr48.de4.RData", "fdr48.de5.RData",
          "fdr48.de6.RData", "fdr48.de7.RData", "fdr48.de8.RData",
          "fdr48.de10.RData", "fdr48.de17.RData", "fdr48.de23.RData",
          "fdr48.de28.RData", "fdr48.de45.RData")
file2 = c("fdr48.ed3.RData", "fdr48.ed4.RData", "fdr48.ed5.RData",
          "fdr48.ed6.RData", "fdr48.ed7.RData", "fdr48.ed8.RData",
          "fdr48.ed10.RData", "fdr48.ed17.RData", "fdr48.ed23.RData",
          "fdr48.ed28.RData", "fdr48.ed45.RData")
file3 = c("sen48.de3.RData", "sen48.de4.RData", "sen48.de5.RData",
          "sen48.de6.RData", "sen48.de7.RData", "sen48.de8.RData",
          "sen48.de10.RData", "sen48.de17.RData", "sen48.de23.RData",
          "sen48.de28.RData", "sen48.de45.RData")
file4 = c("sen48.ed3.RData", "sen48.ed4.RData", "sen48.ed5.RData",
          "sen48.ed6.RData", "sen48.ed7.RData", "sen48.ed8.RData",
          "sen48.ed10.RData", "sen48.ed17.RData", "sen48.ed23.RData",
          "sen48.ed28.RData", "sen48.ed45.RData")
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
saveRDS(fdr_de, file="fdr48.de.RData")
saveRDS(fdr_ed, file="fdr48.ed.RData")
saveRDS(sen_de, file="sen48.de.RData")
saveRDS(sen_ed, file="sen48.ed.RData")
