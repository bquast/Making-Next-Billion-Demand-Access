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


# basic model
m1 <- formula(a_owncel ~ a_edlitrden)
m2 <- formula(a_owncom ~ a_edlitrden)

lm(m1, data = adult)
