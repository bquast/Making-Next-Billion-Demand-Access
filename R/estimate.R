# estimate.R
# ----------------------
# estimate models
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(plm)
# library(pglm)
library(dplyr)
library(ggplot2)


# load data
load(file = "data/merged-stata12.RData")

# human readable names
adulthh$language <- adulthh$a_lng
adulthh$own_computer <- adulthh$a_owncom
adulthh$employed <- ifelse(adulthh$empl_stat==3, TRUE, FALSE)
adulthh$Internet_expenditure <- adulthh$h_nfnet


# convert to pdata.frame
pNIDS <- pdata.frame(adulthh, index = c('pid','wave') )
pNIDS$a_owncom <- as.numeric(pNIDS$a_owncom)
pNIDS$h_nfnet  <- as.numeric(pNIDS$h_nfnet)


# estimate models

## define models
m1_0 <- formula(a_owncel ~ event*factor(a_lng))
m1_1 <- formula(a_owncel ~ event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m3_0 <- formula(h_nfcel  ~ event*factor(a_lng))
m3_1 <- formula(h_nfcel  ~ event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)

m2_0 <- formula(a_owncom ~ event*factor(a_lng))
m2_1 <- formula(a_owncom ~ event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m2_2 <- formula(a_owncom ~ event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome)
m2_5 <- formula(a_owncom ~ event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome + best_edu)
m4_0 <- formula(h_nfnet  ~ event*factor(a_lng))
m4_1 <- formula(h_nfnet  ~ event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m4_2 <- formula(h_nfnet  ~ event*setswana + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m4_3 <- formula(h_nfnet  ~ event*setswana + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman + hhincome)
m4_4 <- formula(h_nfnet  ~ event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome)
m4_5 <- formula(h_nfnet  ~ event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome + best_edu)

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

m_test <- formula(h_nfnet  ~ event*factor(a_lng))
summary(lm(m_test, adulthh))


# use clustering
# see http://stats.stackexchange.com/questions/10017/standard-error-clustering-in-r-either-manually-or-in-plm

# write about this
# http://stats.stackexchange.com/questions/146434/why-pglm-fails-for-within-model
# http://stats.stackexchange.com/questions/143419/why-are-the-fixed-effects-of-a-panel-probit-regression-inconsistent

# There is a good reason for that. 
# Within model for probit regression suffers from incidental parameters problem. 
# Within model for logit regression can be estimated, but requires quite strong assumptions. 
# This is discussed in J. Wooldridge's "Econometric analysis of cross-section and panel data", chapter 15.
# 
# If you look at the code for pglm, 
# you can see that starting values are calculated with function starting.values. 
# For family binomial the code calculates starting values only for model random and pooling, 
# there is no variant for within. Hence the error. 
# If you supply the starting values, the error is given in the function lnl.binomial. 
# Looking at the code it is clear that model within is not supported.
# 

# NOTE 2_5 DOES NOT NEED CLUSTERING
plm2_5 <- formula(as.numeric(a_owncom) ~ event*setswana + 
                  factor(a_edlitrden) + 
                  factor(a_edlitwrten) + 
                  factor(a_edlitrdhm) + 
                  factor(a_edlitwrthm) + 
                  a_woman + 
                  hhincome)
plm4_3 <- formula(as.numeric(h_nfnet)  ~ event*setswana + 
                    factor(a_edlitrden) + 
                    factor(a_edlitwrten) + 
                    factor(a_edlitrdhm) + 
                    factor(a_edlitwrthm) + 
                    a_woman +
                    hhincome +
                    best_edu)
plm2_5e <- plm(plm2_5, data=pNIDS, model='within')
plm4_3e <- plm(plm4_3, data=pNIDS, model='within')
summary(plm2_5e)
summary(plm4_3e)

# cluster stanard errors
library(lmtest)
library(broom)
tidy( coeftest(plm4_3e, vcov=vcovHC(plm4_3e,type="HC0",cluster="group")) )

# use glm estimation since FE undefined for logit/probit
# binomial
glm2_5e  <- glm(m2_5, data=NIDS, family='binomial')
glm4_1e  <- glm(m4_1, data=NIDS, family='binomial')
pglm2_5e <- pglm(plm2_5, data=pNIDS, model='within', family='binomial') # this will not work
summary(glm2_5e)
summary(glm4_1e)

# Hausman test
fere <- phtest(plm4_1, pNIDS, model=c('within', 'random'))
fepo <- phtest(plm4_1, pNIDS, model=c('within', 'pooling'))


# basic plot of a_owncom
adulthh %>%
  filter(a_lng != 'Afrikaans') %>%
  group_by(setswana, wave) %>%
  summarise(own_computer = mean(own_computer, na.rm=TRUE)) %>%
  ggplot(aes(x=wave, y=own_computer, colour=setswana)) %+%
  geom_line() %+%
  scale_colour_brewer(palette='Set1')

# full plot of a_owncom
adulthh %>%
  group_by(language, wave) %>%
  summarise(own_computer = mean(own_computer, na.rm=TRUE)) %>%
  ggplot(aes(x=wave, y=own_computer, fill=language)) %+%
  geom_bar(stat='identity') %+%
  facet_grid(~language)

# full plot of a_owncel
adulthh %>%
  group_by(a_lng, wave) %>%
  summarise(a_owncel = mean(a_owncel, na.rm=TRUE)) %>%
  ggplot(aes(x=wave, y=a_owncel, fill=a_lng)) %+%
  geom_bar(stat='identity') %+%
  facet_grid(~a_lng)

# basic plot of h_nfnet
adulthh %>%
  group_by(setswana, wave) %>%
  summarise(Internet_expenditure = mean(Internet_expenditure, na.rm=TRUE)) %>%
  ggplot(aes(x=wave, y=Internet_expenditure, colour=setswana)) %+%
  geom_line() %+%
  scale_colour_brewer(palette='Set1')

# employment increase for compute owners in wave 3
pids <- adulthh[which(adulthh$wave==3 & adulthh$a_owncom==TRUE),]$pid
adulthh %>%
  filter(pid %in% pids) %>%
  group_by(setswana, wave) %>%
  summarise(employed = mean(employed, na.rm=TRUE)) %>%
  ggplot(aes(x=wave, y=employed, colour=setswana)) %+%
  geom_line() %+%
  scale_colour_brewer(palette='Set1')

pids <- adulthh[which(adulthh$wave==3 & adulthh$h_nfnet==TRUE),]$pid
adulthh %>%
  filter(pid %in% pids) %>%
  group_by(setswana, wave) %>%
  summarise(employed = mean(employed, na.rm=TRUE)) %>%
  ggplot(aes(x=wave, y=employed, colour=setswana)) %+%
  geom_line() %+%
  scale_colour_brewer(palette='Set1')


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
