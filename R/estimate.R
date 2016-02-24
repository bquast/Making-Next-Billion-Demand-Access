# estimate.R
# ----------------------
# estimate models
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(plm)
library(dplyr)


# load data
load(file = "data/merged.RData")


# estimate models

## define models
m1_0 <- formula(a_owncel ~ post_event*factor(a_lng))
m1_1 <- formula(a_owncel ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m3_0 <- formula(h_nfcel  ~ post_event*factor(a_lng))
m3_1 <- formula(h_nfcel  ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)

m2_0 <- formula(a_owncom ~ post_event*factor(a_lng))
m2_1 <- formula(a_owncom ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m2_2 <- formula(a_owncom ~ post_event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome)
m2_5 <- formula(a_owncom ~ post_event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome + best_edu)
m4_0 <- formula(h_nfnet  ~ post_event*factor(a_lng))
m4_1 <- formula(h_nfnet  ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m4_2 <- formula(h_nfnet  ~ post_event*setswana + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m4_3 <- formula(h_nfnet  ~ post_event*setswana + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman + hhincome)
m4_4 <- formula(h_nfnet  ~ post_event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome)
m4_5 <- formula(h_nfnet  ~ post_event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome + best_edu)

## estimate models
lm1_0 <- lm(m1_0, data = adulthh)
lm1_1 <- lm(m1_1, data = adulthh)
lm3_0 <- lm(m3_0, data = adulthh)
lm3_1 <- lm(m3_1, data = adulthh)
lm2_0 <- lm(m2_0, data = adulthh)
lm2_1 <- lm(m2_1, data = adulthh)
lm2_2 <- lm(m2_2, data = adulthh)
lm2_5 <- lm(m2_5, data = adulthh)
lm4_0 <- lm(m4_0, data = adulthh)
lm4_1 <- lm(m4_1, data = adulthh)
lm4_2 <- lm(m4_2, data = adulthh)
lm4_3 <- lm(m4_3, data = adulthh)
lm4_4 <- lm(m4_4, data = adulthh)
lm4_5 <- lm(m4_5, data = adulthh)


## view results
summary(lm1_0)
summary(lm3_0)
summary(lm2_0)
summary(lm2_1)
summary(lm2_5)
summary(lm4_0)
summary(lm4_1)
summary(lm4_2)
summary(lm4_3)
summary(lm4_4)
summary(lm4_5)

m_test <- formula(h_nfnet  ~ post_event*factor(a_lng))
summary(lm(m_test, adulthh))


# use clustering
# see http://stats.stackexchange.com/questions/10017/standard-error-clustering-in-r-either-manually-or-in-plm
NIDS   <- pdata.frame(NIDS, index=c('pid', 'wave'))
plm2_5 <- plm(a_owncom ~ post_event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome, NIDS)


# save results
save(means,
     lm2_5,
     lm4_0,
     lm4_1,
     lm4_2,
     lm4_3,
     lm4_4,
     lm4_5,
     file = 'data/results.RData')
