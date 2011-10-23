#! /usr/bin/python3

import math

alpha_1 = [14.4, 15.2, 17.0, 21.9, 23.3, float("nan"), 31.7, 36.0, 48.1, \
		52.5, float("nan"), 61.9]
beta  = [345.6, 344.6, 342.8, 338.0, 336.5, float("nan"), 328.3, 324.0, \
		float("nan"), 307.5, float("nan"), float("nan")]

alpha_2 = [360.0 - b for b in beta]

##  for x in alpha_2:
##  	print (round(x, 1))

#correct NaNs
alpha = [(alpha_1[i] + alpha_2[i]) / 2 for i in range(len(alpha_1))]
for i in range(len(alpha)):
	if math.isnan(alpha[i]):
		alpha[i] = alpha_1[i]
		

## for x in alpha:
## 	print (round(x, 1))

sin_a = [math.sin(math.radians(a)) for a in alpha]
## for x in sin_a:
## 	print ("{0:.2f}".format(round(x, 2)))

d = 1648.5
k = [1,1,1,1,1, 2,2,2,2,2, 3,3]
lam = [d * sin_a[i] / k[i] for i in range(len(k))]
## for x in lam:
## 	print("{0:.2f}".format(round(x, 2)))

n = [6, 5, 4, float("nan"), 3, 6, 5, 4, float("nan"), 3, 5, 4]
## for x in n:
## 	print(x)

R = [4 * n[i]**2 / ((n[i]**2 - 4) * lam[i]) for i in range(len(lam))]
R = [x * 10**7 for x in R] # nm to cm
## for x in R:
##  	print("{0:.4f}".format(x))


def mean(v):
	return sum(v) / len(v)

R_wo_NaN = [x for x in R if not math.isnan(x)]
# print (mean(R_wo_NaN)


def sd(v):
	u = mean(v)
	squares = [(x - u)**2 for x in v]
	return math.sqrt(mean(squares))

expected_R = mean(R_wo_NaN)
tabulkova_hodnota = 109737.3143
print(round(expected_R, 4), "+/-", round(sd(R_wo_NaN), 4))

#if abs(expected_R - tabulkova_hodnota) <= sd(R_wo_NaN):
# 	print("hodnota je v 1nom sd od tabulkovy")
#else:
# 	print("hodnota neni v sd")
