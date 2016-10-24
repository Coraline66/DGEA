# Load Data
library(ggplot2)
library(grid)
library(gridExtra)
library(plotly)
library(cowplot)
library(ggthemes)
library(scales)
setwd("/Users/qux1/Documents/R/Rcode/LUAD_TvsN/FT_51_1000_900")
fx1 <- as.numeric(readRDS("fdr.51.de.RData"))
fx2 <- as.numeric(readRDS("fdr.51.ed.RData"))
fy1 <- as.numeric(readRDS("sen.51.de.RData"))
fy2 <- as.numeric(readRDS("sen.51.ed.RData"))
setwd("/Users/qux1/Documents/R/Rcode/LUAD_TvsN")
va <- rep(c("n=03", "n=04", "n=05", "n=06", "n=07", "n=08", "n=10",
            "n=17", "n=23", "n=28", "n=45"), each=100)
names(fx1) <- va
names(fy1) <- va
names(fx2) <- va
names(fy2) <- va
ppv1 <- 1 - fx1
ppv2 <- 1 - fx2
ff <- data.frame("n"=va, "FDR"=fx1, "TPR"=fy1)
f1 <- data.frame("FDR"=fx1, "TPR"=fy1)
f2 <- data.frame("FDR"=fx2, "TPR"=fy2)

# Calculate mean points for each case
x1mean <- vector()
y1mean <- vector()
x2mean <- vector()
y2mean <- vector()
x1mean <- lapply(1:11, function(i) {
    mean(fx1[((i-1)*100+1) : (i*100)])
})
y1mean <- lapply(1:11, function(i) {
    mean(fy1[((i-1)*100+1) : (i*100)])
})
x2mean <- lapply(1:11, function(i) {
    mean(fx2[((i-1)*100+1) : (i*100)])
})
y2mean <- lapply(1:11, function(i) {
    mean(fy2[((i-1)*100+1) : (i*100)])
})
x1mean <- as.numeric(rep(x1mean, each=100))
y1mean <- as.numeric(rep(y1mean, each=100))
x2mean <- as.numeric(rep(x2mean, each=100))
y2mean <- as.numeric(rep(y2mean, each=100))
names(x1mean) <- va
names(y1mean) <- va
names(x2mean) <- va
names(y2mean) <- va

# Set up Colors and Legends
col <- c("red", "green", "blue", "purple")
leg <- c("Deseq2", "edgeR", "Mean_deseq2", "Mean_edger")
# Make roc plots in grids
roc.plot <- ggplot(ff, aes(fx1, fy1))  +
    geom_point(aes(x=fx1, y=fy1, color=leg[1]), alpha=0.8) +
    geom_point(aes(x=fx2, y=fy2, color=leg[2]), alpha=0.8) +
    geom_point(aes(x=x1mean, y=y1mean, color=leg[3]), shape=4, size=2) +
    geom_point(aes(x=x2mean, y=y2mean, color=leg[4]), shape=4, size=2) +
    theme_igray() +
    scale_color_manual(name="TS(51/1000/90)", breaks=leg, values=col) +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_continuous(breaks = seq(0, 0.45, 0.1), limits = c(0, 0.45)) +
    facet_grid(~n) + ggtitle("ROC Plot (LUAD)") +
    labs(x="FDR", y="TPR") #+ coord_equal() 
roc.plot + theme(plot.title=element_text(size=18, face="bold", 
                                         margin=margin(10, 0, 10, 0)),
                 legend.position="bottom", legend.direction="horizontal") +
    guides(colour = guide_legend(title.position = "left"))
ggsave("roc.51_1000_90_luad.png", width=20, height=8)

# Make roc plots in one graph
roc <- ggplot(f1, aes(fx1, fy1)) +
    geom_point(aes(x=fx1, y=fy1, color=leg[1]), size=0.5, alpha=1) +
    geom_point(aes(x=fx2, y=fy2, color=leg[2]), size=0.5, alpha=1) +
    theme_igray() + 
    scale_color_manual(name="TS(51/1000/90)", breaks=leg, values=col) +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    ggtitle("ROC Plot (LUAD)") + labs(x="FDR", y="TPR") +
    coord_equal()
roc + theme(plot.title=element_text(size=18, face="bold",
                                    margin=margin(10, 0, 10, 0)),
            legend.position="right", legend.direction="vertical") +
    guides(colour = guide_legend(title.position = "top"))
ggsave("roc.51_1000_90.luad.png", width=10, height=10)


# Boxplot
fy1.1 <- c(fy1[1:600], rep(NA, 100), fy1[601:700], rep(NA, 600),
           fy1[701:800], rep(NA, 500), fy1[801:900], rep(NA, 400),
           fy1[901:1000], rep(NA, 1600), fy1[1001:1100])
fy2.1 <- c(fy2[1:600], rep(NA, 100), fy2[601:700], rep(NA, 600),
           fy2[701:800], rep(NA, 500), fy2[801:900], rep(NA, 400),
           fy2[901:1000], rep(NA, 1600), fy2[1001:1100])
ppv1.1 <- c(ppv1[1:600], rep(NA, 100), ppv1[601:700], rep(NA, 600),
            ppv1[701:800], rep(NA, 500), ppv1[801:900], rep(NA, 400),
            ppv1[901:1000], rep(NA, 1600), ppv1[1001:1100])
ppv2.1 <- c(ppv2[1:600], rep(NA, 100), ppv2[601:700], rep(NA, 600),
            ppv2[701:800], rep(NA, 500), ppv2[801:900], rep(NA, 400),
            ppv2[901:1000], rep(NA, 1600), ppv2[1001:1100])
case <- rep(seq(3, 45, 1), each = 100)
f1.1 <- data.frame(Case = case, TPR = fy1.1)
f2.1 <- data.frame(Case = case, TPR = fy2.1)
f3.1 <- data.frame(Case = case, PPV = ppv1.1)
f4.1 <- data.frame(Case = case, PPV = ppv2.1)
a <- aggregate(fy1, by=list(case=names(fy1)), FUN="mean")
b <- aggregate(fy2, by=list(case=names(fy2)), FUN="mean")
c <- aggregate(ppv1, by=list(case=names(ppv1)), FUN="mean")
d <- aggregate(ppv2, by=list(case=names(ppv2)), FUN="mean")
f5.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = a)
f6.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = b)
f7.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = c)
f8.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = d)

bp.tpr.de <- ggplot(f1.1, aes(Case, TPR)) +
    geom_boxplot(aes(x=factor(Case), y=TPR), fill="red", alpha=0.6) +
    theme_economist() +
    ggtitle("Boxplot_TPR_LUAD (Deseq2)") +
    labs(x="Case {TS(51/1000/90)}", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_discrete(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f5.1, aes(x=(f5.1$Case-2), y=f5.1$Mean.x), colour="black")

bp.tpr.ed <- ggplot(f2.1, aes(Case, TPR)) +
    geom_boxplot(aes(x=factor(Case), y=TPR), fill="green", alpha=0.6) +
    theme_economist() +
    ggtitle("Boxplot_TPR_LUAD (edgeR)") +
    labs(x="Case {TS(51/1000/90)}", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_discrete(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f6.1, aes(x=(f6.1$Case-2), y=f6.1$Mean.x), colour="black")
   
bp.ppv.de <- ggplot(f3.1, aes(Case, PPV)) +
    geom_boxplot(aes(x=factor(Case), y=PPV), fill="yellow", alpha=0.6) +
    theme_economist() +
    ggtitle("Boxplot_PPV_LUAD (Deseq2)") +
    labs(x="Case {TS(51/1000/90)}", y="PPV") +
    scale_y_continuous(breaks = seq(0.55, 1, 0.05), limits = c(0.55, 1)) +
    scale_x_discrete(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f7.1, aes(x=(f7.1$Case-2), y=f7.1$Mean.x), colour="black")

bp.ppv.ed <- ggplot(f4.1, aes(Case, PPV)) +
    geom_boxplot(aes(x=factor(Case), y=PPV), fill="purple", alpha=0.6) +
    theme_economist() +
    ggtitle("Boxplot_PPV_LUAD (edgeR)") +
    labs(x="Case {TS(51/1000/90)}", y="PPV") +
    scale_y_continuous(breaks = seq(0.55, 1, 0.05), limits = c(0.55, 1)) +
    scale_x_discrete(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f8.1, aes(x=(f8.1$Case-2), y=f8.1$Mean.x), colour="black") 
grid.arrange(bp.tpr.de, bp.tpr.ed, bp.ppv.de, bp.ppv.ed, ncol = 2, nrow = 2)
g <- arrangeGrob(bp.tpr.de, bp.tpr.ed, bp.ppv.de, bp.ppv.ed, ncol = 2, nrow = 2)
ggsave(g, file="bp51_1000_90_luad.png", width=24, height=12)
