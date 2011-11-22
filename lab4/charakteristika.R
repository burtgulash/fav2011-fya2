library(gplots)

voltaz <- c(340, 360, 400, 440, 480, 520, 560, 600, 640, 680, 720, 760)
n <- c(0.1, 158, 167, 152, 162, 165, 149, 165, 178, 161, 198, 229)
cetnost <- n * 60 / 100
conf_interval <- sqrt(n) * 60 / 100

postscript(file="charakteristika.eps", encoding="CP1250")
plotCI(voltaz, cetnost, uiw=conf_interval, gap=0, xlim=c(200, 780)
      , xlab="napětí [V]", ylab="četnost [imp/min]"
      , main="Charakteristika GM počítače")
dev.off()
