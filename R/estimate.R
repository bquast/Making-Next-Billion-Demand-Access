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


# estimate models

## define models
m1   <- formula(a_owncel ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m2   <- formula(a_owncom ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m3   <- formula(h_nfcel  ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m4   <- formula(h_nfnet  ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m2_1 <- formula(a_owncom ~ post_event*tsonga + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome)
m2_4 <- formula(a_owncom  ~ post_event*tsonga + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome + best_edu)
m4_1 <- formula(h_nfnet  ~ post_event*tsonga + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m4_2 <- formula(h_nfnet  ~ post_event*tsonga + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman + hhincome)
m4_3 <- formula(h_nfnet  ~ post_event*tsonga + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome)
m4_4 <- formula(h_nfnet  ~ post_event*tsonga + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome + best_edu)

## estimate models
lm1 <- lm(m1, data = adulthh)
lm2 <- lm(m2, data = adulthh)
lm3 <- lm(m3, data = adulthh)
lm4 <- lm(m4, data = adulthh)
lm2_1 <- lm(m2_1, data = adulthh)
lm2_4 <- lm(m2_4, data = adulthh)
lm4_1 <- lm(m4_1, data = adulthh)
lm4_2 <- lm(m4_2, data = adulthh)
lm4_3 <- lm(m4_3, data = adulthh)
lm4_4 <- lm(m4_4, data = adulthh)


## view results
summary(lm1)
summary(lm2)
summary(lm3)
summary(lm4)
summary(lm2_1)
summary(lm2_4)
summary(lm4_1)
summary(lm4_2)
summary(lm4_3)
summary(lm4_4)

m_test <- formula(a_owncel  ~ post_event*tsonga + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome)
summary(lm(m_test, adulthh))
