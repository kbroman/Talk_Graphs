######################################################################
# Figure 3: take logs
######################################################################

#x <- 10^rnorm(10,0.2)
#y <- 10^rnorm(10,1.2)
#z <- c(rep(1,length(x)),rep(2,length(y)))
#z <- z+runif(length(z),-0.1,0.1)
#save(x,y,z,file="fig3.RData",compress=TRUE)
load("fig3.RData")

bgcolor <- rgb(0.135, 0.135, 0.135, maxColorValue=1)

#bitmap(file="../Figs/fig3a.bmp", width=6, height=5, res=288,
#       pointsize=12)
png(file="../Figs/fig3a.png", width=1200, height=1000, res=288,
       pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,4.1,0.6,0.6))
plot(z,c(x,y),xlim=c(0.3,2.8),xaxt="n",xlab="Group",ylab="Response",
     lwd=2, log="y",yaxt="n")
u <- par("usr")
axis(side=2,at=c(0.1,1,10,100,1000,10000),
     labels=c("0.1","1","10","100","1000","10000"))
segments(c(1,2),u[3],c(1,2),u[3]-diff(u[3:4])*0.02,xpd=TRUE)
axis(side=1,at=c(1,2),labels=c("Treatment","Control"))
abline(v=c(1,2),lty=2,col="gray70")
dev.off()


#bitmap(file="../Figs/fig3b.bmp", width=6, height=5, res=288,
#       pointsize=12)
png(file="../Figs/fig3b.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,4.1,0.6,0.6))
plot(z,c(x,y),xlim=c(0.3,2.8),xaxt="n",xlab="Group",ylab="Response",lwd=2)
u <- par("usr")
segments(c(1,2),u[3],c(1,2),u[3]-diff(u[3:4])*0.02,xpd=TRUE)
axis(side=1,at=c(1,2),labels=c("Treatment","Control"))
abline(v=c(1,2),lty=2,col="gray70")
dev.off()


