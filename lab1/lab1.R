lam <- c(409.97, 434.99, 484.73, 616.20, 654.70, NaN, 
		433.12, 484.48, 613.5, 653.92, NaN, 485.73)
n <- c(6, 5, 4, NaN, 3, 6, 5, 4, NaN, 3, 5, 4)

x <- 1 / 4 - 1 / n^2
y <- 1 / lam

title <- expression("Závislost"~1/~lambda~"na"~(1/4 - 1/n^2))
postscript(file="prvni.eps", encoding="CP1250")

plot(x, y, 
	xlab=expression(1/4 - 1/n^2), 
	ylab=expression(vlnočet~"[nm"^-1~"]"), main=title)
abline(lm(y ~ x), lty=3)
text(0.187, 0.0018, labels="1.092e-02 x + 1.253e-05")

dev.off()
