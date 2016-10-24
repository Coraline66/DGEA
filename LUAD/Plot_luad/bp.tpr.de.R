# Load Data
library(ggplot2)
library(grid)
library(gridExtra)
library(plotly)
library(cowplot)
library(ggthemes)
library(scales)
setwd("/Users/qux1/Documents/R/Rcode/LUAD_TvsN/FT_54_100_100")
fy1 <- as.numeric(readRDS("sen54_de.RData"))
setwd("/Users/qux1/Documents/R/Rcode/LUAD_TvsN/FT_54_100_90")
fy2 <- as.numeric(readRDS("sen54.de.RData"))
setwd("/Users/qux1/Documents/R/Rcode/LUAD_TvsN/FT_54_1000_1000")
fy3 <- as.numeric(readRDS("sen_54.de.RData"))
setwd("/Users/qux1/Documents/R/Rcode/LUAD_TvsN/FT_54_1000_900")
fy4 <- as.numeric(readRDS("sen.54.de.RData"))
setwd("/Users/qux1/Documents/R/Rcode/LUAD_TvsN/FT_51_100_100")
fy5 <- as.numeric(readRDS("sen51_de.RData"))
setwd("/Users/qux1/Documents/R/Rcode/LUAD_TvsN/FT_51_100_90")
fy6 <- as.numeric(readRDS("sen51.de.RData"))
setwd("/Users/qux1/Documents/R/Rcode/LUAD_TvsN/FT_51_1000_1000")
fy7 <- as.numeric(readRDS("sen_51.de.RData"))
setwd("/Users/qux1/Documents/R/Rcode/LUAD_TvsN/FT_51_1000_900")
fy8 <- as.numeric(readRDS("sen.51.de.RData"))
setwd("/Users/qux1/Documents/R/Rcode/LUAD_TvsN/FT_48_100_100")
fy9 <- as.numeric(readRDS("sen48_de.RData"))
setwd("/Users/qux1/Documents/R/Rcode/LUAD_TvsN/FT_48_100_90")
fy10 <- as.numeric(readRDS("sen48.de.RData"))
setwd("/Users/qux1/Documents/R/Rcode/LUAD_TvsN/FT_48_1000_1000")
fy11 <- as.numeric(readRDS("sen_48.de.RData"))
setwd("/Users/qux1/Documents/R/Rcode/LUAD_TvsN/FT_48_1000_900")
fy12 <- as.numeric(readRDS("sen.48.de.RData"))

setwd("/Users/qux1/Documents/R/Rcode/LUAD_TvsN")
va <- rep(c("n=03", "n=04", "n=05", "n=06", "n=07", "n=08", "n=10",
            "n=17", "n=23", "n=28", "n=45"), each=100)
names(fy1) <- va
names(fy2) <- va
names(fy3) <- va
names(fy4) <- va
names(fy5) <- va
names(fy6) <- va
names(fy7) <- va
names(fy8) <- va
names(fy9) <- va
names(fy10) <- va
names(fy11) <- va
names(fy12) <- va

# Boxplot
fy1.1 <- c(fy1[1:600], rep(NA, 100), fy1[601:700], rep(NA, 600),
           fy1[701:800], rep(NA, 500), fy1[801:900], rep(NA, 400),
           fy1[901:1000], rep(NA, 1600), fy1[1001:1100])
fy2.1 <- c(fy2[1:600], rep(NA, 100), fy2[601:700], rep(NA, 600),
           fy2[701:800], rep(NA, 500), fy2[801:900], rep(NA, 400),
           fy2[901:1000], rep(NA, 1600), fy2[1001:1100])
fy3.1 <- c(fy3[1:600], rep(NA, 100), fy3[601:700], rep(NA, 600),
           fy3[701:800], rep(NA, 500), fy3[801:900], rep(NA, 400),
           fy3[901:1000], rep(NA, 1600), fy3[1001:1100])
fy4.1 <- c(fy4[1:600], rep(NA, 100), fy4[601:700], rep(NA, 600),
           fy4[701:800], rep(NA, 500), fy4[801:900], rep(NA, 400),
           fy4[901:1000], rep(NA, 1600), fy4[1001:1100])
fy5.1 <- c(fy5[1:600], rep(NA, 100), fy5[601:700], rep(NA, 600),
           fy5[701:800], rep(NA, 500), fy5[801:900], rep(NA, 400),
           fy5[901:1000], rep(NA, 1600), fy5[1001:1100])
fy6.1 <- c(fy6[1:600], rep(NA, 100), fy6[601:700], rep(NA, 600),
           fy6[701:800], rep(NA, 500), fy6[801:900], rep(NA, 400),
           fy6[901:1000], rep(NA, 1600), fy6[1001:1100])
fy7.1 <- c(fy7[1:600], rep(NA, 100), fy7[601:700], rep(NA, 600),
           fy7[701:800], rep(NA, 500), fy7[801:900], rep(NA, 400),
           fy7[901:1000], rep(NA, 1600), fy7[1001:1100])
fy8.1 <- c(fy8[1:600], rep(NA, 100), fy8[601:700], rep(NA, 600),
           fy8[701:800], rep(NA, 500), fy8[801:900], rep(NA, 400),
           fy8[901:1000], rep(NA, 1600), fy8[1001:1100])
fy9.1 <- c(fy9[1:600], rep(NA, 100), fy9[601:700], rep(NA, 600),
           fy9[701:800], rep(NA, 500), fy9[801:900], rep(NA, 400),
           fy9[901:1000], rep(NA, 1600), fy9[1001:1100])
fy10.1 <- c(fy10[1:600], rep(NA, 100), fy10[601:700], rep(NA, 600),
           fy10[701:800], rep(NA, 500), fy10[801:900], rep(NA, 400),
           fy10[901:1000], rep(NA, 1600), fy10[1001:1100])
fy11.1 <- c(fy11[1:600], rep(NA, 100), fy11[601:700], rep(NA, 600),
           fy11[701:800], rep(NA, 500), fy11[801:900], rep(NA, 400),
           fy11[901:1000], rep(NA, 1600), fy11[1001:1100])
fy12.1 <- c(fy12[1:600], rep(NA, 100), fy12[601:700], rep(NA, 600),
           fy12[701:800], rep(NA, 500), fy12[801:900], rep(NA, 400),
           fy12[901:1000], rep(NA, 1600), fy12[1001:1100])
case <- rep(seq(3, 45, 1), each = 100)
f1 <- data.frame(Case = case, TPR = fy1.1)
f2 <- data.frame(Case = case, TPR = fy2.1)
f3 <- data.frame(Case = case, TPR = fy3.1)
f4 <- data.frame(Case = case, TPR = fy4.1)
f5 <- data.frame(Case = case, TPR = fy5.1)
f6 <- data.frame(Case = case, TPR = fy6.1)
f7 <- data.frame(Case = case, TPR = fy7.1)
f8 <- data.frame(Case = case, TPR = fy8.1)
f9 <- data.frame(Case = case, TPR = fy9.1)
f10 <- data.frame(Case = case, TPR = fy10.1)
f11 <- data.frame(Case = case, TPR = fy11.1)
f12 <- data.frame(Case = case, TPR = fy12.1)
a <- aggregate(fy1, by=list(case=names(fy1)), FUN="mean")
b <- aggregate(fy2, by=list(case=names(fy2)), FUN="mean")
c <- aggregate(fy3, by=list(case=names(fy3)), FUN="mean")
d <- aggregate(fy4, by=list(case=names(fy4)), FUN="mean")
e <- aggregate(fy5, by=list(case=names(fy5)), FUN="mean")
f <- aggregate(fy6, by=list(case=names(fy6)), FUN="mean")
g <- aggregate(fy7, by=list(case=names(fy7)), FUN="mean")
h <- aggregate(fy8, by=list(case=names(fy8)), FUN="mean")
i <- aggregate(fy9, by=list(case=names(fy9)), FUN="mean")
j <- aggregate(fy10, by=list(case=names(fy10)), FUN="mean")
k <- aggregate(fy11, by=list(case=names(fy11)), FUN="mean")
l <- aggregate(fy12, by=list(case=names(fy12)), FUN="mean")
f1.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = a)
f2.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = b)
f3.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = c)
f4.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = d)
f5.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = e)
f6.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = f)
f7.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = g)
f8.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = h)
f9.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = i)
f10.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = j)
f11.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = k)
f12.1 <- data.frame(Case = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 
                            45), Mean = l)

bp1 <- ggplot(f1, aes(Case, TPR)) +
    geom_boxplot(aes(x=factor(Case), y=TPR), fill="red", alpha=0.6) +
    theme_economist() +
    ggtitle("Boxplot_TPR_LUAD (Deseq2)") +
    labs(x="Case {TS(54/100/100)}", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_discrete(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f1.1, aes(x=(f1.1$Case-2), y=f1.1$Mean.x), colour="black")

bp2 <- ggplot(f2, aes(Case, TPR)) +
    geom_boxplot(aes(x=factor(Case), y=TPR), fill="red", alpha=0.6) +
    theme_economist() +
    ggtitle("Boxplot_TPR_LUAD (Deseq2)") +
    labs(x="Case {TS(54/100/90)}", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_discrete(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f2.1, aes(x=(f2.1$Case-2), y=f2.1$Mean.x), colour="black")

bp3 <- ggplot(f3, aes(Case, TPR)) +
    geom_boxplot(aes(x=factor(Case), y=TPR), fill="red", alpha=0.6) +
    theme_economist() +
    ggtitle("Boxplot_TPR_LUAD (Deseq2)") +
    labs(x="Case {TS(54/1000/100)}", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_discrete(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f3.1, aes(x=(f3.1$Case-2), y=f3.1$Mean.x), colour="black")

bp4 <- ggplot(f4, aes(Case, TPR)) +
    geom_boxplot(aes(x=factor(Case), y=TPR), fill="red", alpha=0.6) +
    theme_economist() +
    ggtitle("Boxplot_TPR_LUAD (Deseq2)") +
    labs(x="Case {TS(54/1000/90)}", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_discrete(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f4.1, aes(x=(f4.1$Case-2), y=f4.1$Mean.x), colour="black")

bp5 <- ggplot(f5, aes(Case, TPR)) +
    geom_boxplot(aes(x=factor(Case), y=TPR), fill="red", alpha=0.6) +
    theme_economist() +
    ggtitle("Boxplot_TPR_LUAD (Deseq2)") +
    labs(x="Case {TS(51/100/100)}", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_discrete(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f5.1, aes(x=(f5.1$Case-2), y=f5.1$Mean.x), colour="black")

bp6 <- ggplot(f6, aes(Case, TPR)) +
    geom_boxplot(aes(x=factor(Case), y=TPR), fill="red", alpha=0.6) +
    theme_economist() +
    ggtitle("Boxplot_TPR_LUAD (Deseq2)") +
    labs(x="Case {TS(51/100/90)}", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_discrete(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f6.1, aes(x=(f6.1$Case-2), y=f6.1$Mean.x), colour="black")

bp7 <- ggplot(f7, aes(Case, TPR)) +
    geom_boxplot(aes(x=factor(Case), y=TPR), fill="red", alpha=0.6) +
    theme_economist() +
    ggtitle("Boxplot_TPR_LUAD (Deseq2)") +
    labs(x="Case {TS(51/1000/100)}", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_discrete(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f7.1, aes(x=(f7.1$Case-2), y=f7.1$Mean.x), colour="black")

bp8 <- ggplot(f8, aes(Case, TPR)) +
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
    geom_line(data=f8.1, aes(x=(f8.1$Case-2), y=f8.1$Mean.x), colour="black")

bp9 <- ggplot(f9, aes(Case, TPR)) +
    geom_boxplot(aes(x=factor(Case), y=TPR), fill="red", alpha=0.6) +
    theme_economist() +
    ggtitle("Boxplot_TPR_LUAD (Deseq2)") +
    labs(x="Case {TS(48/100/100)}", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_discrete(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f9.1, aes(x=(f9.1$Case-2), y=f9.1$Mean.x), colour="black")

bp10 <- ggplot(f10, aes(Case, TPR)) +
    geom_boxplot(aes(x=factor(Case), y=TPR), fill="red", alpha=0.6) +
    theme_economist() +
    ggtitle("Boxplot_TPR_LUAD (Deseq2)") +
    labs(x="Case {TS(48/100/90)}", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_discrete(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f10.1, aes(x=(f10.1$Case-2), y=f10.1$Mean.x), colour="black")

bp11 <- ggplot(f11, aes(Case, TPR)) +
    geom_boxplot(aes(x=factor(Case), y=TPR), fill="red", alpha=0.6) +
    theme_economist() +
    ggtitle("Boxplot_TPR_LUAD (Deseq2)") +
    labs(x="Case {TS(48/1000/100)}", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_discrete(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f11.1, aes(x=(f11.1$Case-2), y=f11.1$Mean.x), colour="black")

bp12 <- ggplot(f12, aes(Case, TPR)) +
    geom_boxplot(aes(x=factor(Case), y=TPR), fill="red", alpha=0.6) +
    theme_economist() +
    ggtitle("Boxplot_TPR_LUAD (Deseq2)") +
    labs(x="Case {TS(48/1000/90)}", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_discrete(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f12.1, aes(x=(f12.1$Case-2), y=f12.1$Mean.x), colour="black")

grid.arrange(bp1, bp2, bp3, bp4, ncol = 2, nrow = 2)
grid.arrange(bp5, bp6, bp7, bp8, ncol = 2, nrow = 2)
grid.arrange(bp9, bp10, bp11, bp12, ncol = 2, nrow = 2)
grid.arrange(bp1, bp3, bp5, bp7, bp9, bp11, ncol = 2, nrow = 3)
grid.arrange(bp2, bp4, bp6, bp8, bp10, bp12, ncol = 2, nrow = 3)
grid.arrange(bp1, bp2, bp5, bp6, bp9, bp10, ncol = 2, nrow = 3)
grid.arrange(bp3, bp4, bp7, bp8, bp11, bp12, ncol = 2, nrow = 3)
g1 <- arrangeGrob(bp1, bp2, bp3, bp4, ncol = 2, nrow = 2)
g2 <- arrangeGrob(bp5, bp6, bp7, bp8, ncol = 2, nrow = 2)
g3 <- arrangeGrob(bp9, bp10, bp11, bp12, ncol = 2, nrow = 2)
g4 <- arrangeGrob(bp1, bp3, bp5, bp7, bp9, bp11, ncol = 2, nrow = 3)
g5 <- arrangeGrob(bp2, bp4, bp6, bp8, bp10, bp12, ncol = 2, nrow = 3)
g6 <- arrangeGrob(bp1, bp2, bp5, bp6, bp9, bp10, ncol = 2, nrow = 3)
g7 <- arrangeGrob(bp3, bp4, bp7, bp8, bp11, bp12, ncol = 2, nrow = 3)
ggsave(g1, file="bp1.54.tpr.de_luad.png", width=24, height=12)
ggsave(g2, file="bp1.51.tpr.de_luad.png", width=24, height=12)
ggsave(g3, file="bp1.48.tpr.de_luad.png", width=24, height=12)
ggsave(g4, file="bp2.100.tpr.de_luad.png", width=24, height=18)
ggsave(g5, file="bp2.90.tpr.de_luad.png", width=24, height=18)
ggsave(g6, file="bp3.100.tpr.de_luad.png", width=24, height=18)
ggsave(g7, file="bp3.1000.tpr.de_luad.png", width=24, height=18)


# Plot Mean of TPR for Different Combinations of Truth Sets
col <- c("red", "blue", "purple", "green")
colo <- c("red", "blue", "purple", "green", "turquoise1", "yellow")
leg1 <- c("TS(54/100/100)", "TS(54/100/90)", "TS(54/1000/100)", "TS(54/1000/90)")
leg2 <- c("TS(51/100/100)", "TS(51/100/90)", "TS(51/1000/100)", "TS(51/1000/90)")
leg3 <- c("TS(48/100/100)", "TS(48/100/90)", "TS(48/1000/100)", "TS(48/1000/90)")
leg4 <- c("TS(54/100/100)", "TS(54/1000/100)", "TS(51/100/100)", 
          "TS(51/1000/100)", "TS(48/100/100)", "TS(48/1000/100)")
leg5 <- c("TS(54/100/90)", "TS(54/1000/90)", "TS(51/100/90)", 
          "TS(51/1000/90)", "TS(48/100/90)", "TS(48/1000/90)")
leg6 <- c("TS(54/100/100)", "TS(54/100/90)", "TS(51/100/100)", 
          "TS(51/100/90)", "TS(48/100/100)", "TS(48/100/90)")
leg7 <- c("TS(54/1000/100)", "TS(54/1000/90)", "TS(51/1000/100)", 
          "TS(51/1000/90)", "TS(48/1000/100)", "TS(48/1000/90)")

tpr1 <- ggplot(f1, aes(Case, TPR)) +
    theme_economist() +
    ggtitle("TPR(Mean)_LUAD (Deseq2)") +
    labs(x="Case", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_continuous(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                     labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f1.1, aes(x=(f1.1$Case), y=f1.1$Mean.x, colour=leg1[1])) +
    geom_line(data=f2.1, aes(x=(f2.1$Case), y=f2.1$Mean.x, colour=leg1[2])) +
    geom_line(data=f3.1, aes(x=(f3.1$Case), y=f3.1$Mean.x, colour=leg1[3])) +
    geom_line(data=f4.1, aes(x=(f4.1$Case), y=f4.1$Mean.x, colour=leg1[4])) +
    scale_color_manual(name="Truth Set Combination", breaks=leg1, values=col) 

tpr1 + theme(plot.title=element_text(size=18, face="bold", 
                                     margin=margin(10, 0, 10, 0)),
             legend.position="right", legend.direction="vertical") +
    guides(colour = guide_legend(title.position = "top"))
ggsave("tpr1.54.de_luad.png", width=15, height=10)

tpr2 <- ggplot(f5, aes(Case, TPR)) +
    theme_economist() +
    ggtitle("TPR(Mean)_LUAD (Deseq2)") +
    labs(x="Case", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_continuous(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                       labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                  "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f5.1, aes(x=(f5.1$Case), y=f5.1$Mean.x, colour=leg2[1])) +
    geom_line(data=f6.1, aes(x=(f6.1$Case), y=f6.1$Mean.x, colour=leg2[2])) +
    geom_line(data=f7.1, aes(x=(f7.1$Case), y=f7.1$Mean.x, colour=leg2[3])) +
    geom_line(data=f8.1, aes(x=(f8.1$Case), y=f8.1$Mean.x, colour=leg2[4])) +
    scale_color_manual(name="Truth Set Combination", breaks=leg2, values=col) 

tpr2 + theme(plot.title=element_text(size=18, face="bold", 
                                     margin=margin(10, 0, 10, 0)),
             legend.position="right", legend.direction="vertical") +
    guides(colour = guide_legend(title.position = "top"))
ggsave("tpr1.51.de_luad.png", width=15, height=10)

tpr3 <- ggplot(f9, aes(Case, TPR)) +
    theme_economist() +
    ggtitle("TPR(Mean)_LUAD (Deseq2)") +
    labs(x="Case", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_continuous(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                       labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                  "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f9.1, aes(x=(f9.1$Case), y=f9.1$Mean.x, colour=leg3[1])) +
    geom_line(data=f10.1, aes(x=(f10.1$Case), y=f10.1$Mean.x, colour=leg3[2])) +
    geom_line(data=f11.1, aes(x=(f11.1$Case), y=f11.1$Mean.x, colour=leg3[3])) +
    geom_line(data=f12.1, aes(x=(f12.1$Case), y=f12.1$Mean.x, colour=leg3[4])) +
    scale_color_manual(name="Truth Set Combination", breaks=leg3, values=col) 

tpr3 + theme(plot.title=element_text(size=18, face="bold", 
                                     margin=margin(10, 0, 10, 0)),
             legend.position="right", legend.direction="vertical") +
    guides(colour = guide_legend(title.position = "top"))
ggsave("tpr1.48.de_luad.png", width=15, height=10)

tpr4 <- ggplot(f1, aes(Case, TPR)) +
    theme_economist() +
    ggtitle("TPR(Mean)_LUAD (Deseq2)") +
    labs(x="Case", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_continuous(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                       labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                  "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f1.1, aes(x=(f1.1$Case), y=f1.1$Mean.x, colour=leg4[1])) +
    geom_line(data=f3.1, aes(x=(f3.1$Case), y=f3.1$Mean.x, colour=leg4[2])) +
    geom_line(data=f5.1, aes(x=(f5.1$Case), y=f5.1$Mean.x, colour=leg4[3])) +
    geom_line(data=f7.1, aes(x=(f7.1$Case), y=f7.1$Mean.x, colour=leg4[4])) +
    geom_line(data=f9.1, aes(x=(f9.1$Case), y=f9.1$Mean.x, colour=leg4[5])) +
    geom_line(data=f11.1, aes(x=(f11.1$Case), y=f11.1$Mean.x, colour=leg4[6])) +
    scale_color_manual(name="Truth Set Combination", breaks=leg4, values=colo) 

tpr4 + theme(plot.title=element_text(size=18, face="bold", 
                                     margin=margin(10, 0, 10, 0)),
             legend.position="right", legend.direction="vertical") +
    guides(colour = guide_legend(title.position = "top"))
ggsave("tpr2.100.de_luad.png", width=15, height=10)

tpr5 <- ggplot(f2, aes(Case, TPR)) +
    theme_economist() +
    ggtitle("TPR(Mean)_LUAD (Deseq2)") +
    labs(x="Case", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_continuous(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                       labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                  "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f2.1, aes(x=(f2.1$Case), y=f2.1$Mean.x, colour=leg5[1])) +
    geom_line(data=f4.1, aes(x=(f4.1$Case), y=f4.1$Mean.x, colour=leg5[2])) +
    geom_line(data=f6.1, aes(x=(f6.1$Case), y=f6.1$Mean.x, colour=leg5[3])) +
    geom_line(data=f8.1, aes(x=(f8.1$Case), y=f8.1$Mean.x, colour=leg5[4])) +
    geom_line(data=f10.1, aes(x=(f10.1$Case), y=f10.1$Mean.x, colour=leg5[5])) +
    geom_line(data=f12.1, aes(x=(f12.1$Case), y=f12.1$Mean.x, colour=leg5[6])) +
    scale_color_manual(name="Truth Set Combination", breaks=leg5, values=colo) 

tpr5 + theme(plot.title=element_text(size=18, face="bold", 
                                     margin=margin(10, 0, 10, 0)),
             legend.position="right", legend.direction="vertical") +
    guides(colour = guide_legend(title.position = "top"))
ggsave("tpr2.90.de_luad.png", width=15, height=10)

tpr6 <- ggplot(f1, aes(Case, TPR)) +
    theme_economist() +
    ggtitle("TPR(Mean)_LUAD (Deseq2)") +
    labs(x="Case", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_continuous(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                       labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                  "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f1.1, aes(x=(f1.1$Case), y=f1.1$Mean.x, colour=leg6[1])) +
    geom_line(data=f2.1, aes(x=(f2.1$Case), y=f2.1$Mean.x, colour=leg6[2])) +
    geom_line(data=f5.1, aes(x=(f5.1$Case), y=f5.1$Mean.x, colour=leg6[3])) +
    geom_line(data=f6.1, aes(x=(f6.1$Case), y=f6.1$Mean.x, colour=leg6[4])) +
    geom_line(data=f9.1, aes(x=(f9.1$Case), y=f9.1$Mean.x, colour=leg6[5])) +
    geom_line(data=f10.1, aes(x=(f10.1$Case), y=f10.1$Mean.x, colour=leg6[6])) +
    scale_color_manual(name="Truth Set Combination", breaks=leg6, values=colo) 

tpr6 + theme(plot.title=element_text(size=18, face="bold", 
                                     margin=margin(10, 0, 10, 0)),
             legend.position="right", legend.direction="vertical") +
    guides(colour = guide_legend(title.position = "top"))
ggsave("tpr3.100.de_luad.png", width=15, height=10)

tpr7 <- ggplot(f3, aes(Case, TPR)) +
    theme_economist() +
    ggtitle("TPR(Mean)_LUAD (Deseq2)") +
    labs(x="Case", y="TPR") +
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1)) +
    scale_x_continuous(breaks = c(3, 4, 5, 6, 7, 8, 10, 17, 23, 28, 45),
                       labels = c("n=3", "n=4", "n=5", "n=6", "n=7", "n=8",
                                  "n=10", "n=17", "n=23", "n=28", "n=45")) +
    theme(plot.title=element_text(size=16, face="bold",
                                  margin=margin(10, 0, 10, 0)),
          axis.title=element_text(size=13)) +
    geom_line(data=f3.1, aes(x=(f3.1$Case), y=f3.1$Mean.x, colour=leg7[1])) +
    geom_line(data=f4.1, aes(x=(f4.1$Case), y=f4.1$Mean.x, colour=leg7[2])) +
    geom_line(data=f7.1, aes(x=(f7.1$Case), y=f7.1$Mean.x, colour=leg7[3])) +
    geom_line(data=f8.1, aes(x=(f8.1$Case), y=f8.1$Mean.x, colour=leg7[4])) +
    geom_line(data=f11.1, aes(x=(f11.1$Case), y=f11.1$Mean.x, colour=leg7[5])) +
    geom_line(data=f12.1, aes(x=(f12.1$Case), y=f12.1$Mean.x, colour=leg7[6])) +
    scale_color_manual(name="Truth Set Combination", breaks=leg7, values=colo) 

tpr7 + theme(plot.title=element_text(size=18, face="bold", 
                                     margin=margin(10, 0, 10, 0)),
             legend.position="right", legend.direction="vertical") +
    guides(colour = guide_legend(title.position = "top"))
ggsave("tpr3.1000.de_luad.png", width=15, height=10)
