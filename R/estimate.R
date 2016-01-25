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


# create event dummy
adulthh$post_event <- ifelse(adulthh$wave == 3, TRUE, FALSE)


# create tsonga dummy
adulthh$tsonga <- ifelse(adulthh$a_lng == 6, TRUE, FALSE)



# remove some missing value codes
adulthh$a_edlitrdhm  <- ifelse(adulthh$a_edlitrdhm < 0, NA, adulthh$a_edlitrdhm)
adulthh$a_edlitwrthm <- ifelse(adulthh$a_edlitwrthm < 0, NA, adulthh$a_edlitwrthm)
adulthh$a_edlitrden  <- ifelse(adulthh$a_edlitrden < 0, NA, adulthh$a_edlitrden)
adulthh$a_edlitwrten  <- ifelse(adulthh$a_edlitwrten < 0, NA, adulthh$a_edlitwrten)


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
m1 <- formula(a_owncel ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman + hhincome)
m2 <- formula(a_owncom ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman + hhincome)
m3 <- formula(h_nfcel  ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman + hhincome)
m4 <- formula(h_nfnet  ~ post_event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m5 <- formula(h_nfnet  ~ post_event*tsonga + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m6 <- formula(h_nfnet  ~ post_event*tsonga + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman + hhincome)
m7 <- formula(h_nfnet  ~ post_event*tsonga + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome)
m8 <- formula(a_owncom ~ post_event*tsonga + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome)

## estimate models
lm1 <- lm(m1, data = adulthh)
lm2 <- lm(m2, data = adulthh)
lm3 <- lm(m3, data = adulthh)
lm4 <- lm(m4, data = adulthh)
lm5 <- lm(m5, data = adulthh)
lm6 <- lm(m6, data = adulthh)
lm7 <- lm(m7, data = adulthh)
lm8 <- lm(m8, data = adulthh)


## view results
summary(lm1)
summary(lm2)
summary(lm3)
summary(lm4)
summary(lm5)
summary(lm6)
summary(lm7)
summary(lm8)

m_test <- formula(a_owncel  ~ post_event*tsonga + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome)
summary(lm(m_test, adulthh))
