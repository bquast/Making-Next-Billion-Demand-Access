# googletrends.R
# -------------------
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(gtrendsR)
library(ggplot2)


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


# plot
ggplot(data = thuso) + geom_line(aes(x = start, y = thuso))


# save results
save(thuso, list = 'data/googletrends.RData')

