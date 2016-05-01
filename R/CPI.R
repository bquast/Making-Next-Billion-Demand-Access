# CPI.R
# 
# Consumer Price Index for South Afica
# Bastiaan Quast
# bquast@gmail.com

# load packages
library(readxl)

# import data
cpi <- read_excel("~/Making-Next-Billion-Demand-Access/data/SouthAfricaCPI2008-2016.xlsx")

# subset to relevant
cpi <- cpi[which(cpi$H04 == 'All Items' | 
                cpi$H04 == 'Communication' | 
                cpi$H04 == 'Telecommunication equipment'),]

