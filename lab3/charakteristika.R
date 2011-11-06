data <- read.csv("charakteristiky.csv", header=T)

print("maximalni vykon:")
print(max(data$U_1 * data$I_1))

postscript(file="graf3.eps", encoding="CP1250")

plot(x=data$U_1, y=data$I_1, col="red", pch=18, type="o", xlab="", ylab="")
text(0.5, 86, labels=expression("E = 801 W/m"^2))

points(x=data$U_2, y=data$I_2, col="orange", pch=18, type="o")
text(0.5, 63, labels=expression("E = 539 W/m"^2))

points(x=data$U_3, y=data$I_3, col="green", pch=18, type="o")
text(0.5, 48, labels=expression("E = 444 W/m"^2))

title(main="Voltampérmetrová charakteristika solární baterie")
title(xlab="I [mA]", ylab="U [V]")

dev.off()
