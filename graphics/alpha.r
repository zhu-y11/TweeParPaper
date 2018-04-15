library("ggplot2")

lines1 <- "alpha,las
1.0,77.4
0.9,77.6
0.8,77.3
0.7,77.3
0.6,77.0
0.5,76.7
0.4,76.4
0.3,76.1
0.2,75.8
0.1,75.1
0.0,74.9"

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
