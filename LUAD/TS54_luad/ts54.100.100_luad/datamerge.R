# Combine data
file1 = c("fdr_de3.RData", "fdr_de4.RData", "fdr_de5.RData",
          "fdr_de6.RData", "fdr_de7.RData", "fdr_de8.RData",
          "fdr_de10.RData", "fdr_de17.RData", "fdr_de23.RData",
          "fdr_de28.RData", "fdr_de45.RData")
file2 = c("fdr_ed3.RData", "fdr_ed4.RData", "fdr_ed5.RData",
          "fdr_ed6.RData", "fdr_ed7.RData", "fdr_ed8.RData",
          "fdr_ed10.RData", "fdr_ed17.RData", "fdr_ed23.RData",
          "fdr_ed28.RData", "fdr_ed45.RData")
file3 = c("sen_de3.RData", "sen_de4.RData", "sen_de5.RData",
          "sen_de6.RData", "sen_de7.RData", "sen_de8.RData",
          "sen_de10.RData", "sen_de17.RData", "sen_de23.RData",
          "sen_de28.RData", "sen_de45.RData")
file4 = c("sen_ed3.RData", "sen_ed4.RData", "sen_ed5.RData",
          "sen_ed6.RData", "sen_ed7.RData", "sen_ed8.RData",
          "sen_ed10.RData", "sen_ed17.RData", "sen_ed23.RData",
          "sen_ed28.RData", "sen_ed45.RData")
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
saveRDS(fdr_de, file="fdr_de.RData")
saveRDS(fdr_ed, file="fdr_ed.RData")
saveRDS(sen_de, file="sen_de.RData")
saveRDS(sen_ed, file="sen_ed.RData")
