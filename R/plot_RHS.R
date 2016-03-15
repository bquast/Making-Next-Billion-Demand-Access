# plot_RHS.R
# 
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(foreign)
library(ggplot2)
library(dplyr)


# load data
load(file = 'data/rhs.RData')


# load data from STATA file
stata_rhs <- read.dta(file = 'data/rhsbaus-2011-2012/rhsbaus-2011-2012.dta')


# subset to relevant countries
focuscountries <- subset(stata_rhs, A_5 == c('Ghana', 'Kenya', 'Nigeria', 'Rwanda', 'Tanzania'))


# explore data

## No interest / not useful: What are the reasons why you do not use the Internet?
table(focuscountries$B_57)
summary(focuscountries$B_57)


# plot data
ggplot(stata_rhs, aes(x=B_57, fill=A_5)) + geom_bar()




# recode variables
focuscountries$DontKnowWhatIs <- ifelse(focuscountries$B_56 == 'Yes', TRUE, ifelse(focuscountries$B_56 == 'No', FALSE, NA))
focuscountries$NoInterest <- ifelse(focuscountries$B_57 == 'Yes', TRUE, ifelse(focuscountries$B_57 == 'No', FALSE, NA))
focuscountries$DontKnowHowUse <- ifelse(focuscountries$B_58 == 'Yes', TRUE, ifelse(focuscountries$B_58 == 'No', FALSE, NA))
focuscountries$NoComputerNoInternet <- ifelse(focuscountries$B_59 == 'Yes', TRUE, ifelse(focuscountries$B_59 == 'No', FALSE, NA))
focuscountries$TooExpensive <- ifelse(focuscountries$B_60 == 'Yes', TRUE, ifelse(focuscountries$B_60 == 'No', FALSE, NA))
focuscountries$NoTimeTooBusy <- ifelse(focuscountries$B_61 == 'Yes', TRUE, ifelse(focuscountries$B_61 == 'No', FALSE, NA))
focuscountries$NoneFriendsUse <- ifelse(focuscountries$B_62 == 'Yes', TRUE, ifelse(focuscountries$B_62 == 'No', FALSE, NA))
focuscountries$TooSlow <- ifelse(focuscountries$B_63 == 'Yes', TRUE, ifelse(focuscountries$B_63 == 'No', FALSE, NA))
focuscountries$country <- focuscountries$A_5


# clean plot
ggplot(focuscountries, aes(x=NoInterest, fill=A_5)) + geom_bar()

# now by country?
ggplot(focuscountries, aes(x=NoInterest, fill=country)) + stat_count(position='dodge')
ggplot(focuscountries, aes(x=country, fill=DontKnowWhatIs)) + stat_count(position='fill') + theme(legend.position = "bottom")
ggplot(focuscountries[!is.na(focuscountries$DontKnowWhatIs),], aes(x=country, fill=DontKnowWhatIs)) + stat_count(position='fill') + facet_grid(~A_6) + theme(legend.position = "bottom")
ggplot(focuscountries[!is.na(focuscountries$NoInterest),], aes(x=country, fill=NoInterest)) + stat_count(position='fill') + facet_grid(~A_6) + theme(legend.position = "bottom")
ggplot(focuscountries[!is.na(focuscountries$TooExpensive),], aes(x=country, fill=TooExpensive)) + stat_count(position='fill') + facet_grid(~A_6) + theme(legend.position = "bottom")

# now some tables
focuscountries %>%
  group_by(country) %>%
  summarise( mean(NoInterest, na.rm=TRUE),
             mean(DontKnowWhatIs, na.rm=TRUE),
             mean(NoInterest, na.rm=TRUE),
             mean(TooExpensive, na.rm=TRUE),
             mean(DontKnowHowUse, na.rm=TRUE),
             mean(NoTimeTooBusy, na.rm=TRUE),
             mean(NoneFriendsUse, na.rm=TRUE),
             mean(TooSlow, na.rm=TRUE) ) -> table
