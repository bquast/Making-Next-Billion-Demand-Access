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
focuscountries$DontKnowWhatIs <- ifelse(focuscountries$B_56 == 'Yes', TRUE, ifelse(focuscountries$B_56 == 'No', FALSE, NA))
focuscountries$NoInterest <- ifelse(focuscountries$B_57 == 'Yes', TRUE, ifelse(focuscountries$B_57 == 'No', FALSE, NA))
focuscountries$TooExpensive <- ifelse(focuscountries$B_60 == 'Yes', TRUE, ifelse(focuscountries$B_60 == 'No', FALSE, NA))
focuscountries$country <- focuscountries$A_5


# clean plot
ggplot(focuscountries, aes(x=NoInterest, fill=A_5)) + geom_bar()

# now by country?
ggplot(focuscountries, aes(x=NoInterest, fill=country)) + stat_count(position='dodge')
ggplot(focuscountries, aes(x=country, fill=DontKnowWhatIs)) + stat_count(position='fill') + theme(legend.position = "bottom")
ggplot(focuscountries[!is.na(focuscountries$DontKnowWhatIs),], aes(x=country, fill=DontKnowWhatIs)) + stat_count(position='fill') + facet_grid(~A_6) + theme(legend.position = "bottom")
ggplot(focuscountries[!is.na(focuscountries$NoInterest),], aes(x=country, fill=NoInterest)) + stat_count(position='fill') + facet_grid(~A_6) + theme(legend.position = "bottom")
ggplot(focuscountries[!is.na(focuscountries$TooExpensive),], aes(x=country, fill=TooExpensive)) + stat_count(position='fill') + facet_grid(~A_6) + theme(legend.position = "bottom")
