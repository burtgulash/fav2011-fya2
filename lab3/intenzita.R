data       <- read.csv("intenzita.csv", header=T)

U          <- data[["U"]]
citlivost  <- 48.4e-3
E          <- U / citlivost

# print Es'
cat(E, sep="\n")

postscript(file="graf0.eps", encoding="CP1250")
plot(x=data$a, y=E, col="red", lty=1, pch=15, xlab="", ylab="")
abline(lm(E ~ data$a), col="gray", lty=2, lwd=2)

title(main=expression("Závislost intenzity ozáření na vzdálenosti"), 
                                                      cex.main=1.5)
title(xlab="a [cm]", cex.lab=1.5)
title(ylab=expression("E [Wm"^-2~"]"), cex.lab=1) 

dev.off()


# plot 1
postscript(file="graf1.eps", encoding="CP1250")
plot(x=E, y=data[["U_0"]], col="blue", lty=1, pch=15, xlab="", ylab="")
abline(lm(data$U_0 ~ E), col="gray", lty=2, lwd=2)

title(main=expression("Závislost U"[0]~" na E"), cex.main=1.5)
title(xlab=expression("E [Wm"^-2~"]"), cex.lab=1) 
title(ylab=expression("U"[0]~"[V]"), cex.lab=1)
dev.off()


# plot 2
postscript(file="graf2.eps", encoding="CP1250")
plot(x=E, y=data[["I_f"]], xlab="", ylab="", col="green", lty=1, pch=15)
abline(lm(data$I_f ~ E), col="gray", lty=2, lwd=2)

title(main=expression("Závislost I"[f]~" na E"), cex.main=1.5)
title(xlab=expression("E [Wm"^-2~"]"), cex.lab=1) 
title(ylab=expression("I"[f]~"[mA]"), cex.lab=1)
dev.off()

print(lm(data[["I_f"]] ~ E - 1))
