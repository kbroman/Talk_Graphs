######################################################################
# Figure 8 (ribbons)
######################################################################
bgcolor <- rgb(0, 0, 98, maxColorValue=255)

x <- read.table("fig8dat.csv", sep=",", header=TRUE)
#bitmap(file="../Figs/fig8a.bmp", width=6, height=5, res=288,
#       pointsize=12)
png(file="../Figs/fig8a.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,4.1,0.1,0.1))
par(las=1)
plot(x[,1],x[,2],xlab="log Dose",ylab="Proportion survived",ylim=c(0,1),
     type="l",lwd=2,col="green")
lines(x[,1],x[,3],lwd=2,col="hotpink")
lines(x[,1],x[,4],lwd=2,col="yellow1")
legend(1,0.4,c("Drug A","Drug B","Drug C"),lwd=2, col=c("green","hotpink","yellow1"))
dev.off()
