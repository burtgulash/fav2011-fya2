library(gplots)

voltaz <- c(340, 360, 400, 440, 480, 520, 560, 600, 640, 680, 720, 760)
n <- c(0.1, 158, 167, 152, 162, 165, 149, 165, 178, 161, 198, 229)
cetnost <- n * 60 / 100
conf_interval <- sqrt(n) * 60 / 100

plato <- lm(n[2:9] ~ voltaz[2:9]) 

postscript(file="charakteristika.eps", encoding="CP1250")
plotCI(voltaz, cetnost, uiw=conf_interval, gap=0, xlim=c(200, 780)
      , xlab="napětí [V]", ylab="četnost [imp/min]"
      , main="Charakteristika G-M počítače")
lines(c(520, 520), c(-100, 300), lty=2)
text(540, 0, expression("U"[P]))
text(320, 12 * 60 / 100, "P")
text(360, 132 * 60 / 100, expression("G"[P]))
text(660, 132 * 60 / 100, "S")
dev.off()

print(plato)

x_coef <- 0.0369
print ("Sklon plata:")
print (x_coef * 100 / n[2] * 100)
