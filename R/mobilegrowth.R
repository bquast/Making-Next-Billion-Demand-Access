# mobilegrowth.R
# -----------------
# plot mobile growth figure
# 
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(reshape2)
library(ggplot2)


# import data
df <- read.csv(file = 'data/MobileGrowth.csv')


# rename and reshape
names(df)[1] <- 'region'
df <- gather(df, region)
names(df)[2] <- 'year'
names(df)[3] <- 'adoption'
df$year <- as.numeric(sub('X', '', df$year))


# plot
ggplot(df, aes(x=year, y=adoption, colour=region)) + geom_smooth(se=FALSE)


# save data
save(df, file = 'data/mobilegrowth.RData')
