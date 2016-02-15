# describe.R
# ------------------------
# descriptive statistics
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(ggplot2)
library(dplyr)
library(magrittr)


# load data
load(file = 'data/merged.RData')


# computer and phone ownership by group and year
dep_vars <- adulthh %>%
  group_by(a_lng, wave) %>%
  summarise(a_owncel   = mean(a_owncel,   na.rm = TRUE),
            a_owncom   = mean(a_owncom,   na.rm = TRUE),
            h_nfcel    = mean(h_nfcel,    na.rm = TRUE),
            h_nfnet    = mean(h_nfnet,    na.rm = TRUE),
            h_nfcelspn = mean(h_nfcelspn, na.rm = TRUE),
            h_nfnetspn = mean(h_nfnetspn, na.rm = TRUE))


# plot age distribution by group
ggplot(adulthh, aes(x = best_age_yrs, fill = a_lng) ) + geom_bar(position = 'fill')


# speakers of each language by sex

## table
lng <- adulthh %>%
  group_by(a_lng, a_woman) %>%
  summarise(n())

## plot
ggplot(adulthh, aes(x=a_lng, fill=a_woman)) + geom_bar()


# income

## plot income
ggplot(adulthh, aes(x=hhincome, colour=a_lng )) + geom_freqpoly()

## table income
adulthh %>%
  group_by(a_lng) %>%
  summarise(median(hhincome))


# linguistic

## table linguistic
adulthh %>%
  group_by(a_lng, a_edlitrden) %>%
  summarise(n())

## plot linguistic
ggplot(adulthh, aes(x=a_lng, fill=factor(a_edlitrden))) + geom_bar(position='fill')


# education

## plot education
ggplot(adulthh, aes(x=best_edu, fill=a_lng )) + geom_bar(position = 'fill')
