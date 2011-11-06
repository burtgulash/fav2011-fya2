data       <- read.csv("intenzita.csv", header=T)

U          <- data[["U"]]
citlivost  <- 48.4e-3
E          <- U / citlivost

# print Es'
cat(E, sep="\n")


# plot 1
postscript(file="graf1.eps", encoding="CP1250")
plot(x=E, y=data[["U_0"]], col="blue", lty=1, pch=15, xlab="", ylab="")
title(main=expression("Závislost U"[0]~" na E"), cex.main=1.5)
title(xlab=expression("E [Wm"^-2~"]", cex.lab=2), cex.lab=1.5) 
title(ylab=expression("U"[0]), cex.lab=2)
dev.off()

postscript(file="graf2.eps", encoding="CP1250")
plot(x=E, y=data[["I_f"]], xlab="", ylab="", col="green", lty=1, pch=15)
title(main=expression("Závislost I"[f]~" na E"), cex.main=1.5)
title(xlab=expression("E [Wm"^-2~"]", cex.lab=2), cex.lab=1.5) 
title(ylab=expression("I"[f]), cex.lab=2)
dev.off()

print(lm(data[["I_f"]] ~ E - 1))
