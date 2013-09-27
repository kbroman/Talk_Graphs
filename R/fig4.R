######################################################################
# Figure 4: just the line
######################################################################

#x <- rnorm(100,100,10)
#y <- 100+10*sqrt(2*(x-min(x)))+rnorm(100,0,10)
#save(x,y,file="fig4.RData",compress=TRUE)
load("fig4.RData")

bgcolor <- rgb(0, 0, 98, maxColorValue=255)

#bitmap(file="../Figs/fig4a.bmp", width=6, height=5, res=288,
#       pointsize=12)
png(file="../Figs/fig4a.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,4.1,0.1,0.1))
plot(x,y,lwd=2)
abline(lm(y~x)$coef,lwd=2,col="hotpink")
dev.off()

#bitmap(file="../Figs/fig4b.bmp", width=6, height=5, res=288,
#       pointsize=12)
png(file="../Figs/fig4b.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,4.1,0.1,0.1))
plot(x,y,lwd=2,type="n")
abline(lm(y~x)$coef,lwd=2,col="hotpink")
dev.off()

#bitmap(file="../Figs/fig4c.bmp", width=6, height=5, res=288,
#       pointsize=12)
png(file="../Figs/fig4c.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(5.1,4.1,0.1,0.1))
plot(x,y,lwd=2,type="n")
abline(lm(y~x)$coef,lwd=2,col="hotpink")
b <- round(lm(y~x)$coef,4)
text(78, 200, paste("y =", b[1], "+", b[2], "x"), adj=c(0,0.5))
rho <- round(cor(x,y),4) # 0.8567
text(78, 187,expression(paste(rho," = 0.8567")),adj=c(0,0.5))
dev.off()

