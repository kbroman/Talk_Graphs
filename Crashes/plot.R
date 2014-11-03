library(broman)
source("proper_data.R")

pdf("crashes.pdf", height=6.5, width=10, pointsize=14)
layout(t(as.matrix(1:6)), width=c(1.8,rep(1,5)))
par(mar=c(2.9, 8.3, 1.6, 0.8), cex.axis=0.9, bg="white")
o <- order(crashes$total)
n <- nrow(crashes)
col <- rep("gray70", n)
lwd <- rep(1, n)
col[seq(5, n, by=5)] <- "gray70"
lwd[seq(5, n, by=5)] <- 3
grayplot(crashes$total[o], seq(along=o),
         yat=NA, xlab="", ylab="",
         pch=21, bg="slateblue", xlim=c(0,25), xaxs="i",
         xat=seq(0, 25, by=5), ylim=c(0.5, n+0.5),
         yaxs="i", hlines=1:n, mgp.x=c(1.6, 0.3, 0),
         hlines.col=col, hlines.lwd=lwd, main="Total crashes", v_over_h=TRUE)
axis(side=2, at=seq(along=o), rownames(crashes)[o], las=1, tick=FALSE,
     mgp=c(0, 0.2, 0))

par(mar=c(2.9, 0.8, 1.6, 0.8))
grayplot(crashes$not_distracted[o], seq(along=o),
         yat=NA, xlab="", ylab="",
         pch=21, bg="slateblue", xlim=c(0,25), xaxs="i",
         xat=seq(0, 25, by=5), ylim=c(0.5, n+0.5),
         yaxs="i", hlines=1:n, mgp.x=c(1.6, 0.3, 0),
         hlines.col=col, hlines.lwd=lwd, main="Non-distracted", v_over_h=TRUE)

grayplot(crashes$speeding[o], seq(along=o),
         yat=NA, xlab="", ylab="",
         pch=21, bg="slateblue", xlim=c(0,25), xaxs="i",
         xat=seq(0, 25, by=5), ylim=c(0.5, n+0.5),
         yaxs="i", hlines=1:n, mgp.x=c(1.6, 0.3, 0),
         hlines.col=col, hlines.lwd=lwd, main="Speeding", v_over_h=TRUE)

grayplot(crashes$alcohol[o], seq(along=o),
         yat=NA, xlab="", ylab="",
         pch=21, bg="slateblue", xlim=c(0,25), xaxs="i",
         xat=seq(0, 25, by=5), ylim=c(0.5, n+0.5),
         yaxs="i", hlines=1:n, mgp.x=c(1.6, 0.3, 0),
         hlines.col=col, hlines.lwd=lwd, main="Alcohol", v_over_h=TRUE)

grayplot(crashes$ins_premium[o], seq(along=o),
         yat=NA, xlab="Dollars", ylab="",
         pch=21, bg="slateblue", xlim=c(0,1500), xaxs="i",
         xat=seq(0, 1500, by=500), ylim=c(0.5, n+0.5),
         yaxs="i", hlines=1:n, mgp.x=c(1.6, 0.3, 0),
         hlines.col=col, hlines.lwd=lwd, main="Ave ins premium", v_over_h=TRUE)

grayplot(crashes$ins_losses[o], seq(along=o),
         yat=NA, xlab="Dollars", ylab="",
         pch=21, bg="slateblue", xlim=c(0,200), xaxs="i",
         xat=seq(0, 200, by=50), ylim=c(0.5, n+0.5),
         yaxs="i", hlines=1:n, mgp.x=c(1.6, 0.3, 0),
         hlines.col=col, hlines.lwd=lwd, main="Ave ins losses", v_over_h=TRUE)

mtext(outer=TRUE, side=1, at=0.41, "Crashes per billion miles", line=-1.4,
      cex=0.7)

dev.off()
