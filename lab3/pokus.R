x <- 1:10
y <- x*x*x
lo <- loess(y~x)
plot(x, y)
xl <- seq(min(x), max(x), (max(x) - (min(x))) / 1000)
lines(xl, predict(lo, xl), col="red", lwd=2)
