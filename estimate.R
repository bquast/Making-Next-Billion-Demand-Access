# estimate.R
# Bastiaan Quast
# bquast@gmail.com

# load libraries
library(haven)

# load data
load(file = "data/rhs.RData")

# encode
rhs$internet <- ifelse(rhs$HI_1 == 1, TRUE, FALSE)
rhs$language <- as_factor(rhs$N_7)

# basic model
m1 <- formula(HI_1 ~ N_7 + A_5)

lm(m1, data = rhs)
