######################################################################
# Figure 2: bar chart -> pie chart
######################################################################
dat <- c("Opera"=1, "Safari"=9, "Firefox"=20, "IE"=26, "Chrome"=44)

bgcolor <- rgb(0.135, 0.135, 0.135, maxColorValue=1)
png(file="../Figs/fig2a_rev.png", width=1200, height=1000, res=288,
    pointsize=12)
par(las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,mar=c(4.1,4.1,1.1,0.1))

library(broman)
blue <- brocolors("crayons")["Cornflower"]
z <- barplot(dat, las=1, col=blue, border="white",
             ylim=c(0, 50), ylab="Usage (percent)", space=0.5)
abline(h=seq(10,40, by=10), col="gray30")
rect(z-0.5, 0, z+0.5, dat, col=blue, border="white")
u <- par("usr"); rect(u[1], u[3], u[2], u[4], xpd=TRUE)
dev.off()
