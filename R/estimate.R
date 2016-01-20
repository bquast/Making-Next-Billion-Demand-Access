# estimate.R
# ----------------------
# estimate models
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(dplyr)


# load data
load(file = "data/adult.RData")


# list variables
ls(adult)


# exploratory

## compute and phone ownership by group and year
sumtable <- adult %>%
  group_by(a_lng, wave) %>%
  summarise(mean(a_owncel), mean(a_owncom))


# basic model

## define models
m1  <- formula(a_owncel ~ a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m2  <- formula(a_owncom ~ a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)

## estimate models
lm1 <- lm(m1, data = adult)
lm2 <- lm(m2, data = adult)

## view results
summary(lm1)
summary(lm2)
