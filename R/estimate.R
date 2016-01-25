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


# inspect data
summary(adulthh$a_lng)
summary(adulthh$h_nftelspn)
summary(adulthh$h_nfcelspn)
summary(adulthh$h_nfnetspn)


# remove missing value codes
adulthh$a_lng <- ifelse(adulthh$a_lng < 0, NA, adulthh$a_lng)
adulthh$h_nftelspn <- ifelse(adulthh$h_nftelspn < 0, NA, adulthh$h_nftelspn)
adulthh$h_nfcelspn <- ifelse(adulthh$h_nfcelspn < 0, NA, adulthh$h_nfcelspn)
adulthh$h_nfnetspn <- ifelse(adulthh$h_nfnetspn < 0, NA, adulthh$h_nfnetspn)
adulthh2 <- adulthh[!is.na(adulthh$h_nfcelspn),]
adulthh3 <- adulthh2[adulthh2$h_nfcelspn != 0,]


# exploratory

## compute and phone ownership by group and year
sumtable <- adulthh %>%
  group_by(a_lng, wave) %>%
  summarise(mean(a_owncel), mean(a_owncom))

sumtable2 <- adulthh2 %>%
  group_by(a_lng, wave) %>%
  summarise(mean(h_nfcelspn), mean(h_nfnetspn))

sumtable3 <- adulthh3 %>%
  group_by(a_lng, wave) %>%
  summarise(mean(h_nfcelspn), mean(h_nfnetspn))

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
