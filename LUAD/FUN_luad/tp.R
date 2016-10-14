tp <- function(M, N, p, Nts_des, Nts_edg, en_de, in_de, en_ed, in_ed) {
  counts <- list()
  int_tp <- list()
  if (p == "d") {
    for (i in 1:Nts_des) {
      count <- 0
      for (j in 1:N) {
        if (en_de$genes[i] %in% in_de[[j]]$genes) {
          count <- count + 1
        }
      }  
      if (count > (M-1)) {
        int_tp <- append(int_tp, en_de$genes[i])
      }
      counts <- append(counts, count)
    }
  }
  if (p == "e") {
    for (i in 1:Nts_edg) {
      count <- 0
      for (j in 1:N) {
        if (en_ed$genes[i] %in% in_ed[[j]]$genes) {
          count <- count + 1
        }
      }  
      if (count > (M-1)) {
        int_tp <- append(int_tp, en_ed$genes[i])
      }
      counts <- append(counts, count)
    }
  }
  Nint_tp <- length(int_tp) 
  
  ls <- list("int_tp"=int_tp, "Nint_tp"=Nint_tp)
  return(ls)
}
