library('pheatmap')
data.r <- read.csv("path/hyperlipidemia_age_OR.csv",row.names = 1)  # OR
data.p <- read.csv("path/hyperlipidemia_age_p.csv",row.names = 1)  # p

pheatmap(data.r, scale = "row", cluster_cols = FALSE)

getSig <- function(dc) {
  sc <- ''
  if (dc < 0.001) {sc <- '***'}
  else if (dc < 0.01) {sc <- '**'}
  else if (dc < 0.05) {sc <- '*'}
  return(sc)
}

sig.mat <- data.p
for (ithRow in c(1:nrow(data.p))){
  for (ithcol in c(1:ncol(data.p))){
    sig.mat[ithRow,ithcol] <- getSig(data.p[ithRow,ithcol])
  }
}

# sig.mat <- matrix(sapply(data.p, getSig), nrow=nrow(data.p))
str(sig.mat)

# pheatmap(data.r,cluster_cols = FALSE, display_numbers=sig.mat)
pheatmap(data.r, scale = "row", cluster_cols = FALSE, display_numbers=sig.mat)
