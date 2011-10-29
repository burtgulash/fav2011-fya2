R <- c(11.33, 6.95, 3.47) * 1e3
L <- 4.42                       
C <- 13.2e-9                    

omega <- sqrt(1/(L * C) - R^2 / (2 * L^2))
f     <- omega / (2 * pi)

bez   <- sqrt(1/(L * C))
bez_f <- bez / (2 * pi)


print ("vysledny frekvence:")
print (f)

print ("beze ztrat")
print (bez_f)
