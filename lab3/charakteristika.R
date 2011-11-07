DATA <- read.csv("charakteristiky.csv", header=TRUE)

print("maximalni vykony pro max E:")
print(max(DATA$U_1 * DATA$I_1))
print(max(DATA$U_2 * DATA$I_2))
print(max(DATA$U_3 * DATA$I_3, na.rm=TRUE))

P <- data.frame(P1=DATA$U_1 * DATA$I_1, 
                P2=DATA$U_2 * DATA$I_2, 
                P3=DATA$U_3 * DATA$I_3)

max_indices <- data.frame(max_1=P[,1] == max(P[,1], na.rm=TRUE), 
                          max_2=P[,2] == max(P[,2], na.rm=TRUE), 
                          max_3=P[,3] == max(P[,3], na.rm=TRUE))

max_Us <- c(DATA[max_indices[[1]], "U_1"],
            DATA[max_indices[[2]], "U_2"],
            DATA[max_indices[[3]], "U_3"])

max_Is <- c(DATA[max_indices[[1]], "I_1"],
            DATA[max_indices[[2]], "I_2"],
            DATA[max_indices[[3]], "I_3"])

max_Us <- max_Us[!is.na(max_Us)]
max_Is <- max_Is[!is.na(max_Is)]


max_Us <- c(1.48, 1.54,1.57,1.69,1.72, 1.73)
max_Is <- c(44.2, 44.4, 45.1, 58.5, 80.3, 95.0)

postscript(file="graf3.eps", encoding="CP1250")

plot(x=DATA$U_1, y=DATA$I_1, col="red", pch=18, type="o", xlab="", ylab="")
text(0.5, 86, labels=expression("E = 801 W/m"^2))

points(x=DATA$U_2, y=DATA$I_2, col="orange", pch=18, type="o")
text(0.5, 63, labels=expression("E = 539 W/m"^2))

points(x=DATA$U_3, y=DATA$I_3, col="green", pch=18, type="o")
text(0.5, 48, labels=expression("E = 444 W/m"^2))


lo <- loess(max_Is ~ max_Us)
xx <- seq(min(max_Us), max(max_Us), (max(max_Us) - min(max_Us))/100)
lines(xx, predict(lo, xx), col="gray", lty=2)


text(1.81, 90, labels=expression("P"[max]))

title(main="Voltampérmetrová charakteristika solární baterie")
title(xlab="I [mA]", ylab="U [V]")

dev.off()
