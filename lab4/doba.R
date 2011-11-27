R0 = 302 / 200
R01 = 9288 / 200
R02 = 8865 / 200
R012 = 17670 / 200

t = (R01 + R02 - R012 - R0) / (2 * (R01 - R0) * (R02 - R0))
tR = t * (1 + t/2 * (R012 - R0))

D012 = R012 / (1 - R012 * tR) - R012

print ("Rozlišovací doba:")
print (tR)

print ("Ztráta impulzů pro oba zářiče:")
print (D012)

print ("Relativní ztráta:")
print (D012 / R012)
