######################################################################
# Figure 6rev: before and after
######################################################################

set.seed(12201970)
before <- runif(6, 5, 8)
after <- rnorm(6, before*1.05, 2)

bgcolor <- rgb(0, 0, 98, maxColorValue=255)


#bitmap(file="../Figs/fig6r_a.bmp", width=6, height=5, res=512,
#       pointsize=12)
png(file="../Figs/fig6r_a.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,4.1,0.1,0.1))
li <- range(c(before, after))
ymx <- max(abs(after-before))
plot(before, after-before, xlab="Before", ylim=c(-ymx, ymx),
     ylab="Change (After - Before)", lwd=2)
abline(h=0, lty=2, col="cyan")
dev.off()

#bitmap(file="../Figs/fig6r_b.bmp", width=6, height=5, res=512,
#       pointsize=12)
png(file="../Figs/fig6r_b.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,4.1,0.1,0.1))
plot(before, after, xlab="Before", ylab="After",
     ylim=li, xlim=li)
abline(0,1, lty=2, col="cyan")
dev.off()

#bitmap(file="../Figs/fig6r_c.bmp", width=6, height=5, res=512,
#       pointsize=12)
png(file="../Figs/fig6r_c.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,4.1,0.1,0.1))
z <- rep(c(0,1), rep(6,2))
plot(z, c(before, after),
     xaxt="n", ylab="Response",
     xlab="", xlim=c(-0.5, 1.5))
axis(side=1, at=c(0,1), c("Before","After"))
segments(rep(0,6), before, rep(1,6), after, col="cyan")     
dev.off()

#bitmap(file="../Figs/fig6r_d.bmp", width=6, height=5, res=512,
#       pointsize=12)
png(file="../Figs/fig6r_d.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,4.1,0.1,0.1))
z <- rep(c(0,1), rep(6,2))
plot(z, c(before, after),
     xaxt="n", ylab="Response",
     xlab="", xlim=c(-0.5, 1.5))
axis(side=1, at=c(0,1), c("Before","After"))
me <- c(mean(before), mean(after))
ci <- cbind(t.test(before)$conf.int,
            t.test(after)$conf.int)
segments(0:1+0.1, me, 0:1+0.2, me, col="cyan")
segments(0:1+0.15, ci[1,], 0:1+0.15, ci[2,], col="cyan")
segments(0:1+0.125, ci[1,], 0:1+0.175, ci[1,], col="cyan")
segments(0:1+0.125, ci[2,], 0:1+0.175, ci[2,], col="cyan")
dev.off()

dat <- cbind(before=before, after=after)
write.table(dat, file="fig6rev.csv", sep=",", col.names=TRUE, row.names=FALSE, quote=FALSE)
