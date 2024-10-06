library(plyr)

auto.data <- read.table("auto.txt", header=FALSE, sep="\t")
auto.data

auto.data <- rename(auto.data, c(
  "V1"="MPG",
  "V2"="Cylinders",
  "V3"="Displacement",
  "V4"="Horsepower",
  "V5"="Weight",
  "V6"="Acceleration",
  "V7"="ModelYear",
  "V8"="Origin",
  "V9"="CarName"
  ))

summary( auto.data )

x <- auto.data[[3]]
mean(x)
var(x)
n <- length(x)
n

library(ggplot2)

ggplot(auto.data, aes(x=Displacement)) + geom_histogram()
ggsave("./figures/auto_hist.pdf", width = 6, height = 3)
ggplot(auto.data, aes(x=Displacement)) + geom_density()
ggsave("./figures/auto_dens.pdf", width = 6, height = 3)
ggplot(auto.data, aes(x=Displacement,y=rep(1,n))) + geom_jitter() + ylim(0,2) + ylab("Random Y")
ggsave("./figures/auto_jitter.pdf", width = 6, height = 3)

colMeans(auto.data[,1:7], na.rm = TRUE)
cov(auto.data[,1:7], use = "na.or.complete")
cor(auto.data[,1:7], use = "na.or.complete")

ggplot(auto.data, aes(x=Displacement,y=Weight)) + geom_bin2d()
ggsave("./figures/auto_hist_2d.pdf", width = 4.5, height = 3)
ggplot(auto.data, aes(x=Displacement,y=Weight)) + geom_hex()
ggsave("./figures/auto_hex.pdf", width = 4.5, height = 3)
ggplot(auto.data, aes(x=Displacement,y=Weight)) + geom_density_2d()
ggsave("./figures/auto_dens_2d.pdf", width = 4, height = 3)
ggplot(auto.data, aes(x=Displacement,y=Weight)) + geom_point()
ggsave("./figures/auto_scatter.pdf", width = 4, height = 3)

ggplot(auto.data, aes(x=Displacement,y=Weight)) + geom_point(aes(color=Acceleration),size=auto.data$Horsepower/50)+ ggtitle("Point Size is Proportional to Horsepower")
ggsave("./figures/auto4d.pdf", width = 4.5, height = 3)
