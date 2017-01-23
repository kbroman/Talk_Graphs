library(broman)
source("proper_data.R")

pdf("crashes_scatter.pdf", height=6.5, width=10, pointsize=14)
par(mfrow=c(2,3), bg="white")

grayplot(crashes$total, crashes$not_distracted, pch=21, bg="slateblue",
         xlab="Total crashes", ylab="Non-distracted crashes",
         xlim=c(0, 25), ylim=c(0, 25), xaxs="i", yaxs="i",
         main="Non-distracted")
grayplot(crashes$total, crashes$speeding, pch=21, bg="slateblue",
         xlab="Total crashes", ylab="Speeding crashes",
         xlim=c(0, 25), ylim=c(0, 10.1), xaxs="i", yaxs="i",
         main="Speeding")
grayplot(crashes$total, crashes$alcohol, pch=21, bg="slateblue",
         xlab="Total crashes", ylab="Alcohol crashes",
         xlim=c(0, 25), ylim=c(0, 10.1), xaxs="i", yaxs="i",
         main="Alcohol")
grayplot(crashes$total, crashes$ins_premium, pch=21, bg="slateblue",
         xlab="Total crashes", ylab="Ave Ins Premium",
         xlim=c(0, 25), xaxs="i", ylim=c(500, 1500),
         yaxs="i", yat=seq(500, 1500, by=250),
         main="Ave Ins Premium")
grayplot(crashes$total, crashes$ins_loss, pch=21, bg="slateblue",
         xlab="Total crashes", ylab="Ave Ins Loss",
         xlim=c(0, 25), xaxs="i", ylim=c(50, 200),
         yaxs="i", yat=seq(50, 200, by=25),
         main="Ave Ins Loss")
grayplot(crashes$ins_premium, crashes$ins_loss, pch=21, bg="slateblue",
         xlab="Ave Ins Premium", ylab="Ave Ins Loss",
         xlim=c(500, 1500), xaxs="i", xat=seq(500, 1500, by=250),
         ylim=c(50, 200), yaxs="i", yat=seq(50, 200, by=25),
         main="Premium vs Loss")



dev.off()
