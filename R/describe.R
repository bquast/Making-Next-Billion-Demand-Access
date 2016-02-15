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
means <- adulthh %>%
  group_by(a_lng, wave) %>%
  summarise(a_owncel = mean(a_owncel,   na.rm = TRUE),
            a_owncom = mean(a_owncom,   na.rm = TRUE),
            h_nfcel    = mean(h_nfcel,    na.rm = TRUE),
            h_nfnet    = mean(h_nfnet,    na.rm = TRUE),
            h_nfcelspn = mean(h_nfcelspn, na.rm = TRUE),
            h_nfnetspn = mean(h_nfnetspn, na.rm = TRUE))

