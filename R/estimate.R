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


# basic model

## define models
m1  <- formula(a_owncel ~ a_edlitrden + a_edlitwrten + a_edlitwrthm + a_woman)
m2  <- formula(a_owncom ~ a_edlitrden + a_edlitwrten + a_edlitwrthm + a_woman)

## estimate models
lm1 <- lm(m1, data = adult)
lm2 <- lm(m2, data = adult)

## view results
summary(lm1)
summary(lm2)
