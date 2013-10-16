######################################################################
# Figure 6rev: before and after
######################################################################

set.seed(12201970)
bgcolor <- rgb(0, 0, 98, maxColorValue=255)

x <- 1:8
ilogit <- function(x) exp(x)/(1+exp(x))
y1 <- 0.9 - x/80 + rnorm(length(x), 0, 0.02)
y2 <- 0.9 - x/40 + rnorm(length(x), 0, 0.02)
y3 <- 0.85 - x/30 + rnorm(length(x), 0, 0.02)
y <- cbind(y1, y2, y3)

z1 <- 0.95 - x/40 + rnorm(length(x), 0, 0.02)
z2 <- ilogit(-0.4*(x-4.5) + rnorm(length(x), 0, 0.04))
z3 <- ilogit(-0.5*(x-4.5) + rnorm(length(x), 0, 0.04))
z1[6:8] <- z1[6:8] - 0.18*3
z <- cbind(z1, z2, z3)
ym <- apply(y, 1, mean)
zm <- apply(z, 1, mean)

mygreen <- rgb(173/255, 221/255, 142/255) #rgb(194/255, 230/255, 153/255)
mylgreen <- rgb(49/255, 163/255, 84/255, alpha=0.5) #rgb(49/255, 163/255, 84/255)
myred <- rgb(250/255, 159/255, 181/255)
mylred <- rgb(197/255, 27/255, 138/255, alpha=0.5)

#bitmap(file="../Figs/fig9a.bmp", width=6, height=5, res=512,
#       pointsize=12)
png(file="../Figs/fig9a.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,4.1,0.1,0.1))
plot(x, y1, ylim=c(0,1), type="n", xlab="Dose", ylab="Response") 
for(i in 1:3) lines(x, z[,i], col=mylred, lwd=2, lty=2)
for(i in 1:3) lines(x, y[,i], col=mylgreen, lwd=2, lty=2)
lines(x, ym, col=mygreen, lwd=2)
lines(x, zm, col=myred, lwd=2)
legend("bottomleft", lwd=2, col=c(mygreen, myred), c("Control", "Treated"))
dev.off()

#bitmap(file="../Figs/fig9b.bmp", width=6, height=5, res=512,
#       pointsize=12)
png(file="../Figs/fig9b.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,4.1,0.1,0.1))
plot(x, y1, ylim=c(0,1), type="n", xlab="Dose", ylab="Response") 
lines(x, ym, col=mygreen, lwd=2)
lines(x, zm, col=myred, lwd=2)
legend("bottomleft", lwd=2, col=c(mygreen, myred), c("Control", "Treated"))
dev.off()

#bitmap(file="../Figs/fig9c.bmp", width=6, height=5, res=512,
#       pointsize=12)
png(file="../Figs/fig9c.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,4.1,0.1,0.1))
zz <- rep(c(0,1), rep(3,2))
before <- y[8,]
after <- z[8,]
plot(zz, c(before, after),
     xaxt="n", ylab="Response at dose=8",
     xlab="", xlim=c(-0.5, 1.5), ylim=c(0,1))
axis(side=1, at=c(0,1), c("Control","Treated"))
me <- c(mean(before), mean(after))
ci <- cbind(t.test(before)$conf.int,
            t.test(after)$conf.int)
segments(0:1+0.1, me, 0:1+0.2, me, col="cyan")
segments(0:1+0.15, ci[1,], 0:1+0.15, ci[2,], col="cyan")
segments(0:1+0.125, ci[1,], 0:1+0.175, ci[1,], col="cyan")
segments(0:1+0.125, ci[2,], 0:1+0.175, ci[2,], col="cyan")
dev.off()

dat <- cbind(control=before, treated=after)
write.table(dat, file="fig9.csv", sep=",", col.names=TRUE, row.names=FALSE, quote=FALSE)
