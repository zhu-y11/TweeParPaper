library("ggplot2")

lines1 <- "alpha,las
1.0,76.81
0.9,76.85
0.8,76.24
0.7,76.28
0.6,76.03
0.5,76.37
0.4,76.15
0.3,76.00
0.2,74.98
0.1,75.11
0.0,74.74"

result1 <- read.table(text=lines1, sep=",", header=TRUE)
names(result1) <- c("alpha", "las")

#result1 <- melt(result1, id=c("alpha"))
#print(result1$alpha)
#print(result1$las)

# two plots
p1 <- ggplot(result1, aes(x=alpha, y=las, label=las)) +
    geom_line() +
    geom_point() +
    geom_text(vjust=-1) +
    scale_x_continuous(breaks=result1$alpha) + 
    ylim(NA, 77.5) +
    theme_bw()

# extract gtable
#g1 <- ggplot_gtable(ggplot_build(p1))

ggsave("alpha.pdf", height=4, width = 8)