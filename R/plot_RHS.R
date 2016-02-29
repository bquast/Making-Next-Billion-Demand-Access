# plot_RHS.R
# 
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(ggplot2)


# load data
load(file = 'data/rhs.RData')


# explore data

## No interest / not useful: What are the reasons why you do not use the Internet?
table(focuscountries$B_57)
summary(focuscountries$B_57)


# plot data
ggplot(stata_rhs, aes(x=B_57, fill=A_5)) + geom_bar()


# subset to relevant countries
focuscountries <- subset(stata_rhs, A_5 == c('Ghana', 'Kenya', 'Nigeria', 'Rwanda', 'Tanzania'))


# recode variables
focuscountries$NoInterest <- ifelse(focuscountries$B_57 == 'Yes', TRUE, ifelse(focuscountries$B_57 == 'No', FALSE, NA))


# clean plot
ggplot(focuscountries, aes(x=NoInterest, fill=A_5)) + geom_bar()

# now by country?
ggplot(focuscountries, aes(x=NoInterest, fill=A_5)) + stat_count(position='dodge')
