### Problem 5
#a
#number of house-fires a year is 2050. 12 months in a year. So estimated rate per month is
2050/12
##170.833 or171

#b assumes lambda = 171 house fires per month
#EV per year
171*12
#2052
#std dev per year
sqrt(171*12^2)
#156.9204
#range of normal variation in a year = 2052+/-1.96(156.9204)
2052-1.96*(156.9204)
2052+1.96*(156.9204)
#(1744.436,2359.564)

#c find range of lambda such that 2052 lies in normal range
range.lower = 0
range.upper = 0
lambda = seq(0,500)
for (i in 1:length(lambda)){
  EV = 12*i
  std = sqrt(i*12^2)
  range.lower[i] = EV-1.96*std
  range.upper[i] = EV+1.96*std
}
range = data.frame(lower=range.lower,upper=range.upper)
print(range)
##2052 lies in the normal range of lambdas between (148,198)

#d years of data to obtain estimate to the nearest integer
#assume std dev equals 156.92
#std dev of many distributions equals (156.92/sqrt(n))
#want (156.92/sqrt(n))<+/-0.5
(156.92*2)^2
#would need 98496 calls to get within an integer estimate
98496/2052
#98496 calls is about 48 years of data

### Problem 6
# a in emailed pdf

#b 
x = seq(171-18,171+18)
px = dpois(x,171)
sum(px)
##84.30% chance that it deviates by as much as 18 off the mean

#c
r = seq(10,30)
ans = 0
for (i in r){
  x = seq(171-i,171+i)
  px = dpois(x,171)
  ans[i] =sum(px)
}
result = data.frame(percent=ans)
print(result)
# a range of 25 deviation from the mean is the within the normal range

#d
# the approximation got a range of 147-198 while the method in c got 146 and 196
# these results are quite close, but I would recommend using the exact method to aprroximate 
#range in a single day while the normal approximation when finding the range for an entire year of calls

### Problem 11
##a
#low flight bombers probability of not getting hit
p=.9*.8*.05
(1-p)^20 ##0.48
#high flight bombers hprobabiltiy of not getting hit
p=.75*.95*.7
(1-p)^15 ##0.0000316
## taking low flight is the optimal choice

#b
1-(.3)^(16*.52)
##99.99% chance that bombers hit target

#c min number of bombers
b = seq(0,16)
pb = 1-(.3)^(b*.52)
print(pb)
## you need a minimum of 5 bombers to guarantee 95% success rate

#d
p = seq(.2,.4,.01)
pb = 0
for (i in 1:length(p)){
  b = 6
  pb[i] = 1-(p[i])^(b*.52)
}
result = data.frame(missRate = p,percent = pb)
print(result)
##with a hit rate of 61% you will then need at least 6 bombers to guarantee a 95% success rate

#e
p=.9*(.9)*.8*.05
(1-p)^20 ##0.5175
x = 1-.7*.9 ##cahnce of missing
1-(x)^(16*.4825)
##99.95 chance of hitting target with 16 bombers and 90% reduction in Pd and P
##this means that bad weather favors the defenders