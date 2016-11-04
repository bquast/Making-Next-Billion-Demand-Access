# mobilegrowth.R
# -----------------
# plot mobile growth figure
# 
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(reshape2)
library(ggplot2)

# load data
load(file = 'data/mobilegrowth.RData')

# # import data
# df <- read.csv(file = 'data/MobileGrowth.csv')
# 
# 
# # rename and reshape
# names(df)[1] <- 'region'
# df <- gather(df, region)
# names(df)[2] <- 'year'
# names(df)[3] <- 'adoption'
# df$year <- as.numeric(sub('X', '', df$year))
# ITU2015 <- df

library(readr)
ITU2015 <- read_csv("~/Making-Next-Billion-Demand-Access/data/ITU2015.csv")

# melt
ITU2015 <- melt(ITU2015, id.vars='year')
names(ITU2015) <- c('year', 'region', 'adoption')

# plot
ggplot(ITU2015, aes(x=year, y=adoption, colour=region)) + geom_smooth(se=FALSE)


# save data
save(ITU2015, file = 'data/internetgrowth.RData')
