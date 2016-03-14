# Hypothesis Test 
 

# Problem
# An airline claims that on average 5% of its flights are delayed each day. On
# a given day, of 25 flights, 3 are delayed. Test the hypothesis that the average
# proportion of delayed flights is 5% at the 0.01 significance level.

# The null hypothesis of the upper tail test about population proportion can be expressed as follows:
# P<= P0
# where p0 is a hypothesized upper bound of the true population proportion p.
# --------------------------------------------------------------------------------
# Solution
# The null hypothesis is that p <= 0.05. We begin with computing the test statistic
# --------------------------------------------------------------------------------
pbar = 3/25             # sample proportion 
p0 = .05                # hypothesized value 
n = 25                  # sample size 
z = (pbar-p0)/sqrt(p0*(1-p0)/n) 
z 
# We then compute the critical value at .01 significance level.
alpha = .01 
z.alpha = qnorm(1-alpha) 
z.alpha 

# Answer

# The test statistic 1.60591 is not greater than the critical value of  2.326348. 
# Hence, at .01 significance level, we do not reject the null hypothesis that the 
# proportion of delayed flights 5% this day.
# --------------------------------------------------------------------------------


# Alternative Solution 1

# Instead of using the critical value, we apply the pnorm function to compute the upper
# tail p-value of the test statistic. As it turns out to be greater than the .01
# significance level, we do not reject the null hypothesis that p ≤ 0.05.
# --------------------------------------------------------------------------------
pval = pnorm(z, lower.tail=FALSE) 
pval
# [1] 0.05414683
# --------------------------------------------------------------------------------

# Alternative Solution 2

#We apply the prop.test function to compute the p-value directly. 
#The Yates continuity correction is disabled for pedagogical reasons.

prop.test(3, 25, p=.05, alt="greater", correct=FALSE) 

# 1-sample proportions test without continuity correction
# data:  3 out of 25, null probability 0.05
# X-squared = 2.5789, df = 1, p-value = 0.05415
# alternative hypothesis: true p is greater than 0.05
# 95 percent confidence interval:
#   0.04899155 1.00000000
# sample estimates:
#   p 
# 0.12 


