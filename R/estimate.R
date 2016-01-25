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


# remove some missing value codes
adulthh$a_edlitrdhm <- ifelse(adulthh$a_edlitrdhm < 0, NA, adulthh$a_edlitrdhm)
adulthh$a_edlitrden <- ifelse(adulthh$a_edlitrden < 0, NA, adulthh$a_edlitrden)


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


# create event dummy
adulthh$post_event <- ifelse(adulthh$wave == 3, TRUE, FALSE)


# estimate models

## define models
m1  <- formula(a_owncel ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m2  <- formula(a_owncom ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m3  <- formula(h_nfcel  ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m4  <- formula(h_nfnet  ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)

## variations of m4
m4_1  <- formula(h_nfnet  ~ factor(a_edlitrdhm)*post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m4_2  <- formula(h_nfnet  ~ factor(a_edlitrden)*post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)

## estimate models
lm1 <- lm(m1, data = adulthh)
lm2 <- lm(m2, data = adulthh)
lm3 <- lm(m3, data = adulthh)
lm4 <- lm(m4, data = adulthh)
lm4_1 <- lm(m4_1, data=adulthh)
lm4_2 <- lm(m4_2, data=adulthh)

## view results
summary(lm1)
summary(lm2)
summary(lm3)
summary(lm4)
summary(lm4_1)
summary(lm4_2)

