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
thuso <- gtrends('thuso')

# extract trend data.frame
thuso <- thuso$trend
thuso_ww <- thuso_ww$trend

# add starting date of month
thuso$date <- floor_date(thuso$start, unit = 'month')

# group by month
thuso %<>%
  group_by(date) %>%
  summarise(thuso = sum(hits))

# plot data
ggplot(thuso, aes(x = date, y = thuso)) + geom_line()
ggplot(thuso, aes(x = date, y = thuso)) + stat_smooth(span=1)

# save results
save(thuso, file = 'data/googletrends.RData')
