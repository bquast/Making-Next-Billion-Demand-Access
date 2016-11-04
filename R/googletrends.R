# googletrends.R
# -------------------
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(gtrendsR)
library(lubridate)
library(ggplot2)
library(dplyr)
library(magrittr)


# connect to the API
usr <- 'user@email.com'
pwd <- 'password'
gconnect(usr, pwd)
rm(usr)
rm(pwd)


# download trend data
thuso <- gtrends('thuso', geo='ZA')


# extract trend data.frame
thuso <- thuso$trend


# add starting date of month
thuso$date <- floor_date(thuso$start, unit = 'month')

# group by month
thuso %<>%
  group_by(date) %>%
  summarise(thuso = sum(hits))


# plot data
ggplot(thuso) + geom_line(aes(x = date, y = thuso))


# save results
save(thuso, file = 'data/googletrends.RData')
