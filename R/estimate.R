# estimate.R
# ----------------------
# estimate models
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(dplyr)


# load data
load(file = "data/merged.RData")


# list variables
ls(adulthh)


# some versions without missing value codes
adulthh2 <- adulthh[!is.na(adulthh$h_nfcelspn),]
adulthh3 <- adulthh2[adulthh2$h_nfcelspn != 0,]


# inspect data
summary(adulthh$a_lng)
summary(adulthh$h_nftelspn)
summary(adulthh$h_nfcelspn)
summary(adulthh$h_nfnetspn)


# exploratory

## compute and phone ownership by group and year
sumtable <- adulthh %>%
  group_by(a_lng, wave) %>%
  summarise(owncel = mean(a_owncel,   na.rm = TRUE),
            owncom = mean(a_owncom,   na.rm = TRUE),
            cel    = mean(h_nfcel,    na.rm = TRUE),
            net    = mean(h_nfnet,    na.rm = TRUE),
            celspn = mean(h_nfcelspn, na.rm = TRUE),
            netspn = mean(h_nfnetspn, na.rm = TRUE))


# basic model

## define models
m1  <- formula(a_owncel ~ a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m2  <- formula(a_owncom ~ a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m3  <- formula(h_nfnetspn ~ a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)

## estimate models
lm1 <- lm(m1, data = adulthh)
lm2 <- lm(m2, data = adulthh)
lm3 <- lm(m3, data = adulthh)

## view results
summary(lm1)
summary(lm2)
summary(lm3)
