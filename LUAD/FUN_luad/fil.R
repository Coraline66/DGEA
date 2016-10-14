fil <- function(N, n, i, p, samp, en_de, in_de, en_ed, in_ed) {
    # Calculate the Numbers of "FP", "TP", "FN" for Each Filtered Gene List
    # "TP" represents the intersection of "Truth Set"(ts_des) and each genelist.
    # "FP" is a resulting genelist subtracted by "TP".
    # "FN" is the "Truth Set" subtracted by "TP".
    if (p == "d") {
        tp <- intersect(in_de[[i]]$genes, en_de)
        fp <- setdiff(in_de[[i]]$genes, en_de) 
        fn <- setdiff(en_de, in_de[[i]]$genes)
    }
    if (p == "e") {
        tp <- intersect(in_ed[[i]]$genes, en_ed)
        fp <- setdiff(in_ed[[i]]$genes, en_ed) 
        fn <- setdiff(en_ed, in_ed[[i]]$genes)
    }
    Ntp <- length(tp)
    Nfp <- length(fp)
    Nfn <- length(fn)
    
    # Return Results
    ls <- list("tp"=tp, "fp"=fp, "fn"=fn, "Ntp"=Ntp, "Nfp"=Nfp, "Nfn"=Nfn)
    return(ls)
} 
