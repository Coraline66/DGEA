# Combine data
file1 = c("fdr51.de3.RData", "fdr51.de4.RData", "fdr51.de5.RData",
          "fdr51.de6.RData", "fdr51.de7.RData", "fdr51.de8.RData",
          "fdr51.de10.RData", "fdr51.de17.RData", "fdr51.de23.RData",
          "fdr51.de28.RData", "fdr51.de45.RData")
file2 = c("fdr51.ed3.RData", "fdr51.ed4.RData", "fdr51.ed5.RData",
          "fdr51.ed6.RData", "fdr51.ed7.RData", "fdr51.ed8.RData",
          "fdr51.ed10.RData", "fdr51.ed17.RData", "fdr51.ed23.RData",
          "fdr51.ed28.RData", "fdr51.ed45.RData")
file3 = c("sen51.de3.RData", "sen51.de4.RData", "sen51.de5.RData",
          "sen51.de6.RData", "sen51.de7.RData", "sen51.de8.RData",
          "sen51.de10.RData", "sen51.de17.RData", "sen51.de23.RData",
          "sen51.de28.RData", "sen51.de45.RData")
file4 = c("sen51.ed3.RData", "sen51.ed4.RData", "sen51.ed5.RData",
          "sen51.ed6.RData", "sen51.ed7.RData", "sen51.ed8.RData",
          "sen51.ed10.RData", "sen51.ed17.RData", "sen51.ed23.RData",
          "sen51.ed28.RData", "sen51.ed45.RData")
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
saveRDS(fdr_de, file="fdr51.de.RData")
saveRDS(fdr_ed, file="fdr51.ed.RData")
saveRDS(sen_de, file="sen51.de.RData")
saveRDS(sen_ed, file="sen51.ed.RData")
