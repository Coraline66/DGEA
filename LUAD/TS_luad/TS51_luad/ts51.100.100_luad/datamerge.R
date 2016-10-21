# Combine data
file1 = c("fdr51_de3.RData", "fdr51_de4.RData", "fdr51_de5.RData",
          "fdr51_de6.RData", "fdr51_de7.RData", "fdr51_de8.RData",
          "fdr51_de10.RData", "fdr51_de17.RData", "fdr51_de23.RData",
          "fdr51_de28.RData", "fdr51_de45.RData")
file2 = c("fdr51_ed3.RData", "fdr51_ed4.RData", "fdr51_ed5.RData",
          "fdr51_ed6.RData", "fdr51_ed7.RData", "fdr51_ed8.RData",
          "fdr51_ed10.RData", "fdr51_ed17.RData", "fdr51_ed23.RData",
          "fdr51_ed28.RData", "fdr51_ed45.RData")
file3 = c("sen51_de3.RData", "sen51_de4.RData", "sen51_de5.RData",
          "sen51_de6.RData", "sen51_de7.RData", "sen51_de8.RData",
          "sen51_de10.RData", "sen51_de17.RData", "sen51_de23.RData",
          "sen51_de28.RData", "sen51_de45.RData")
file4 = c("sen51_ed3.RData", "sen51_ed4.RData", "sen51_ed5.RData",
          "sen51_ed6.RData", "sen51_ed7.RData", "sen51_ed8.RData",
          "sen51_ed10.RData", "sen51_ed17.RData", "sen51_ed23.RData",
          "sen51_ed28.RData", "sen51_ed45.RData")
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
saveRDS(fdr_de, file="fdr51_de.RData")
saveRDS(fdr_ed, file="fdr51_ed.RData")
saveRDS(sen_de, file="sen51_de.RData")
saveRDS(sen_ed, file="sen51_ed.RData")
