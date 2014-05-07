######################################################################
# Figure 1: dot plot -> bar plot
######################################################################
#x <- rnorm(8,30,5)
#y <- rnorm(8,38,5)
#z <- rep(c(1,2),rep(length(x),2)) + runif(2*length(x),-0.1,0.1)
#save(x,y,z,file="fig1.RData")
load("fig1.RData")
#postscript("Figs/fig1a.ps",horiz=TRUE,height=7.5,width=7.5)
#bitmap(file="../Figs/fig1a.bmp", width=6, height=5, res=288,
#       pointsize=14)

bgcolor <- rgb(0.135, 0.135, 0.135, maxColorValue=1)

png(file="../Figs/fig1a.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,4.1,0.1,0.1))
plot(z,c(x,y),type="n",
     xlim=c(0.5,2.5),xaxt="n",xlab="Group",ylab="Response",lwd=2)
abline(v=c(1,2),lty=2,col="gray70")
points(z,c(x,y),lwd=2)
u <- par("usr")
segments(c(1,2),u[3],c(1,2),u[3]-diff(u[3:4])*0.02,xpd=TRUE)
#text(c(1,2),u[3]-diff(u[3:4])*0.06,c("Treatment","Control"),xpd=TRUE,font=2)
axis(side=1,at=c(1,2),labels=c("Treatment","Control"))
#sem <- function(a) mean(a)/sqrt(length(a))
#me <- c(mean(x),mean(y))
#se <- c(sem(x),sem(y))
me <- c(mean(x),mean(y))
ci <- cbind(t.test(x)$conf.int, t.test(y)$conf.int)

library(broman)
cicolor <- brocolors("crayons")["Cornflower"]

segments(c(1.2,1.8),me,c(1.3,1.7),me,lwd=2,col=cicolor)
segments(c(1.25,1.75),ci[1,],c(1.25,1.75),ci[2,],lwd=2,col=cicolor)
segments(c(1.225,1.775),ci[1,],c(1.275,1.725),ci[1,],lwd=2,col=cicolor)
segments(c(1.225,1.775),ci[2,],c(1.275,1.725),ci[2,],lwd=2,col=cicolor)
dev.off()

