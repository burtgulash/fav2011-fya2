data <- read.csv("mereni.csv", header=T)

postscript(file="graf.eps", encoding="CP1250")

plot(data[5:6], col="red", type="o", lty=1, pch=18,
	xlab="f [Hz]", ylab=expression(U[c]~"[mV]"), 
	main="Rezonanční křivky")
points(data[3:4], col="orange", type="o", lty=1, pch=18)
points(data[1:2], col="green", type="o", lty=1, pch=18)

dev.off()
