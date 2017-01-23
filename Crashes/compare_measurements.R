# my measurements
source("data.R")

# 538 data
if(!file.exists("bad-drivers.csv"))
    system("wget https://raw.githubusercontent.com/fivethirtyeight/data/master/bad-drivers/bad-drivers.csv")
crashes538 <- read.csv("bad-drivers.csv")

rownames(crashes538) <- crashes538[,1]
crashes538[,3:6] <- crashes538[,3:6]*crashes538[,2]/100
colnames(crashes538)[-1] <- c("total", "speeding", "alcohol", "not_distracted", "no_previous", "ins_premium", "ins_losses")

pdf("crashes_errors.pdf", height=6.5, width=10.5, pointsize=14)
layout(t(as.matrix(1:4)), width=c(1.8,rep(1.2,3)))
par(mar=c(2.9, 8.3, 1.6, 0.8), cex.axis=0.9, bg="white")
n <- nrow(crashes)
o <- 1:nrow(crashes)
col <- rep("gray70", n)
lwd <- rep(1, n)
col[seq(5, n, by=5)] <- "gray70"
lwd[seq(5, n, by=5)] <- 3
grayplot((crashes$total[o] - crashes538$total)/crashes538$total*100, seq(along=o),
         yat=NA, ylab="", xlab="Percent measurement error",
         pch=21, bg="slateblue", xlim=c(-42,10), xaxs="i",
         xat=seq(-40, 10, by=10), vlines=seq(-40, 10, by=10), ylim=c(0.5, n+0.5),
         yaxs="i", hlines=1:n, mgp.x=c(1.6, 0.3, 0),
         hlines.col=col, hlines.lwd=lwd, main="Total crashes")
axis(side=2, at=seq(along=o), rownames(crashes)[o], las=1, tick=FALSE,
     mgp=c(0, 0.2, 0))

par(mar=c(2.9, 0.8, 1.6, 0.8))
grayplot((crashes$not_distracted[o] - crashes538$not_distracted)/crashes538$not_distracted*100, seq(along=o),
         yat=NA, ylab="", xlab="Percent measurement error",
         pch=21, bg="slateblue", xlim=c(-42,10), xaxs="i",
         xat=seq(-40, 10, by=10), vlines=seq(-40, 10, by=10), ylim=c(0.5, n+0.5),
         yaxs="i", hlines=1:n, mgp.x=c(1.6, 0.3, 0),
         hlines.col=col, hlines.lwd=lwd, main="Non-distracted")

grayplot((crashes$speeding[o] - crashes538$speeding)/crashes538$speeding*100, seq(along=o),
         yat=NA, ylab="", xlab="Percent measurement error",
         pch=21, bg="slateblue", xlim=c(-42,10), xaxs="i",
         xat=seq(-40, 10, by=10), vlines=seq(-40, 10, by=10), ylim=c(0.5, n+0.5),
         yaxs="i", hlines=1:n, mgp.x=c(1.6, 0.3, 0),
         hlines.col=col, hlines.lwd=lwd, main="Speeding")

grayplot((crashes$alcohol[o] - crashes538$alcohol)/crashes538$alcohol*100, seq(along=o),
         yat=NA, ylab="", xlab="Percent measurement error",
         pch=21, bg="slateblue", xlim=c(-42,10), xaxs="i",
         xat=seq(-40, 10, by=10), vlines=seq(-40, 10, by=10), ylim=c(0.5, n+0.5),
         yaxs="i", hlines=1:n, mgp.x=c(1.6, 0.3, 0),
         hlines.col=col, hlines.lwd=lwd, main="Alcohol")

dev.off()
