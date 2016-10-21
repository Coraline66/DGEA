# Combine data
file1 = c("fdr90_de3.RData", "fdr90_de4.RData", "fdr90_de5.RData",
          "fdr90_de6.RData", "fdr90_de7.RData", "fdr90_de8.RData",
          "fdr90_de10.RData", "fdr90_de17.RData", "fdr90_de23.RData",
          "fdr90_de28.RData", "fdr90_de45.RData")
file2 = c("fdr90_ed3.RData", "fdr90_ed4.RData", "fdr90_ed5.RData",
          "fdr90_ed6.RData", "fdr90_ed7.RData", "fdr90_ed8.RData",
          "fdr90_ed10.RData", "fdr90_ed17.RData", "fdr90_ed23.RData",
          "fdr90_ed28.RData", "fdr90_ed45.RData")
file3 = c("sen90_de3.RData", "sen90_de4.RData", "sen90_de5.RData",
          "sen90_de6.RData", "sen90_de7.RData", "sen90_de8.RData",
          "sen90_de10.RData", "sen90_de17.RData", "sen90_de23.RData",
          "sen90_de28.RData", "sen90_de45.RData")
file4 = c("sen90_ed3.RData", "sen90_ed4.RData", "sen90_ed5.RData",
          "sen90_ed6.RData", "sen90_ed7.RData", "sen90_ed8.RData",
          "sen90_ed10.RData", "sen90_ed17.RData", "sen90_ed23.RData",
          "sen90_ed28.RData", "sen90_ed45.RData")
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
saveRDS(fdr_de, file="fdr90_de.RData")
saveRDS(fdr_ed, file="fdr90_ed.RData")
saveRDS(sen_de, file="sen90_de.RData")
saveRDS(sen_ed, file="sen90_ed.RData")
