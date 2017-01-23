######################################################################
# Figure 5: affy data (replicates)
######################################################################

bgcolor <- rgb(0.135, 0.135, 0.135, maxColorValue=1)

load("affydata.RData")
library(broman)
pink <- brocolors("crayons")["Tickle Me Pink"]
blue <- brocolors("crayons")["Cornflower"]

#bitmap(file="../Figs/fig5a.bmp", width=6, height=5, res=288,
#       pointsize=12)
png(file="../Figs/fig5a.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,5.1,0.1,1.1))
r <- x[,1]
g <- x[,2]
plot((r+g)/2,(r-g),lwd=2,cex=0.2,pch=16,
     xlab=expression(paste("Ave{ ",log[2], " ", R[1],", ",log[2], " ", R[2]," }")),
     ylab=expression(paste(log[2]," { ",R[1]," / ",R[2]," }")),
     ylim=c(-1,1))
abline(h=0,col=pink,lwd=2)
dev.off()

#bitmap(file="../Figs/fig5b.bmp", width=6, height=5, res=288,
#       pointsize=12)
png(file="../Figs/fig5b.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,5.1,0.1,1.1))
plot(r,g,lwd=2,cex=0.2,pch=16,
     xlab=expression(paste(log[2], " ", R[1])),
     ylab=expression(paste(log[2], " ", R[2])))
abline(0,1,col=pink,lwd=2)
dev.off()

#bitmap(file="../Figs/fig5c.bmp", width=6, height=5, res=288,
#       pointsize=12)
png(file="../Figs/fig5c.png", width=1200, height=1000, res=288,
    pointsize=12)
r <- 2^r
g <- 2^g
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,5.1,0.1,1.1))
plot(r,g,lwd=2,cex=0.2,pch=16,
     xlab=expression(R[1]),ylab="")
mtext(side=2,expression(R[2]),line=4)
abline(0,1,col=pink,lwd=2)
dev.off()

#bitmap(file="../Figs/fig5d.bmp", width=6, height=5, res=288,
#       pointsize=12)
png(file="../Figs/fig5d.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,5.1,0.1,1.1))
plot(r,g,lwd=2,cex=0.2,pch=16,
     xlab=expression(R[1]),ylab="")
mtext(side=2,expression(R[2]),line=4)
dev.off()

f <- function(a,x,y,p=0.5) mean(x<=a & y<=a)-p
a50 <- uniroot(f,lower=40,upper=42,x=r,y=g,p=0.5)$root
a95 <- uniroot(f,lower=336,upper=337,x=r,y=g,p=0.95)$root

#bitmap(file="../Figs/fig5e.bmp", width=6, height=5, res=288,
#       pointsize=12)
png(file="../Figs/fig5e.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,5.1,0.1,1.1))
plot(r,g,lwd=2,cex=0.2,pch=16,
     xlab=expression(R[1]),ylab="")
mtext(side=2,expression(R[2]),line=4)
abline(a50,-1,lwd=2,col=pink)
text(1800,0,"50%",col=pink,cex=1.2,adj=c(0,0))
dev.off()

#bitmap(file="../Figs/fig5f.bmp", width=6, height=5, res=288,
#       pointsize=12)
png(file="../Figs/fig5f.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,5.1,0.1,1.1))
plot(r,g,lwd=2,cex=0.2,pch=16,
     xlab=expression(R[1]),ylab="")
mtext(side=2,expression(R[2]),line=4)
abline(a50,-1,lwd=2,col=pink)
abline(a99,-1,lwd=2,col=blue)
text(1800,0,"99%",col=blue,cex=1.2,adj=c(0,0))
dev.off()
