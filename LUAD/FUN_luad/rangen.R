rangen <- function(SEED, N, n) {
  # Use Random Generator to Generate 100 Groups of Sample Indices
  set.seed(SEED)
  samp <- list()
  for (i in 1:N) {
    sam <- sample(1:57, n)
    samp <- rbind(samp, sam)
  }
  for (i in 1:N) {
    for (j in 1:n) {
      if (samp[i, j] < 10) {
        samp[i, j] <- paste(0, samp[i, j], sep="")
      }
    }
  }
  return(samp)
}