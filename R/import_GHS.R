# import_GHS.R
# ------------------
# import data from the 2014 General Household Survey
#
# Bastiaan Quast
# bquast@gmail.com


# load library
library(haven)


# import data
house14 <- read_sas(b7dat = 'data/ghs-2014-v1-sas/ghs_2014_house_v1_20150630.sas7bdat')
person14 <- read_sas(b7dat = 'data/ghs-2014-v1-sas/ghs_2014_person_v1_20150630.sas7bdat')


# save data
save.image(file = 'data/imported_GHS.RData')
