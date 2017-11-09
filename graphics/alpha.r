library("ggplot2")

lines1 <- "alpha,las
1.0,78.0
0.9,78.1
0.8,77.6
0.7,77.4
0.6,77.4
0.5,76.6
0.4,77.1
0.3,76.3
0.2,76.2
0.1,75.7
0.0,75.8"

result1 <- read.table(text=lines1, sep=",", header=TRUE)
print(result1)
names(result1) <- c("alpha", "las")

#result1 <- melt(result1, id=c("alpha"))
#print(result1$alpha)
#print(result1$las)

# two plots
p1 <- ggplot(result1, aes(x=alpha, y=las, label=las)) +
    geom_line() +
    geom_point() +
    geom_text(vjust=-1, size=5) +
    scale_x_continuous(breaks=result1$alpha) + 
    ylim(NA, 78.3) +
    theme_bw(base_size=18)

# extract gtable
#g1 <- ggplot_gtable(ggplot_build(p1))

ggsave("alpha.pdf", height=4, width = 8)
