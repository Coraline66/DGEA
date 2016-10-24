# Combine data
file1 = c("fdr48_de3.RData", "fdr48_de4.RData", "fdr48_de5.RData",
          "fdr48_de6.RData", "fdr48_de7.RData", "fdr48_de8.RData",
          "fdr48_de10.RData", "fdr48_de17.RData", "fdr48_de23.RData",
          "fdr48_de28.RData", "fdr48_de45.RData")
file2 = c("fdr48_ed3.RData", "fdr48_ed4.RData", "fdr48_ed5.RData",
          "fdr48_ed6.RData", "fdr48_ed7.RData", "fdr48_ed8.RData",
          "fdr48_ed10.RData", "fdr48_ed17.RData", "fdr48_ed23.RData",
          "fdr48_ed28.RData", "fdr48_ed45.RData")
file3 = c("sen48_de3.RData", "sen48_de4.RData", "sen48_de5.RData",
          "sen48_de6.RData", "sen48_de7.RData", "sen48_de8.RData",
          "sen48_de10.RData", "sen48_de17.RData", "sen48_de23.RData",
          "sen48_de28.RData", "sen48_de45.RData")
file4 = c("sen48_ed3.RData", "sen48_ed4.RData", "sen48_ed5.RData",
          "sen48_ed6.RData", "sen48_ed7.RData", "sen48_ed8.RData",
          "sen48_ed10.RData", "sen48_ed17.RData", "sen48_ed23.RData",
          "sen48_ed28.RData", "sen48_ed45.RData")
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
saveRDS(fdr_de, file="fdr48_de.RData")
saveRDS(fdr_ed, file="fdr48_ed.RData")
saveRDS(sen_de, file="sen48_de.RData")
saveRDS(sen_ed, file="sen48_ed.RData")
