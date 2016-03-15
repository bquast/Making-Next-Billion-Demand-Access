# import_HRS.R
# --------------------------------------------
# instructions for importing data from RHS
#
# Bastiaan Quast
# bquast@gmail.com

# load libraries
library(foreign)
library(haven)


# read STATA source file
stata_rhs <- read.dta(file = 'data/rhsbaus-2011-2012/rhsbaus-2011-2012.dta')


# load data
rhs <- read_sas(b7dat = 'data/rhsbaus-2011-2012/rhsbaus2011_2012.sas7bdat')
stata_rhs <- read.dta(file = 'data/rhsbaus-2011-2012/rhsbaus-2011-2012.dta')


# Does this household have a working Internet connection?
table(rhs$HI_1)

# What is the main reason why the household does not have a working Internet Connection?
table(rhs$HI_12)

# I dont know what the Internet is: What are the reasons why you do not use the Internet?
table(rhs$B_56)

# No interest / not useful: What are the reasons why you do not use the Internet?
table(rhs$B_57)

# I dont know how to use it: What are the reasons why you do not use the Internet?
table(rhs$B_58)

# No computer / internet connection: What are the reasons why you do not use the Internet?
table(rhs$B_59)

# Too expensive: What are the reasons why you do not use the Internet?
table(rhs$B_60)

# No time, too busy: What are the reasons why you do not use the Internet?
table(rhs$B_61)

# None of my friends use it: What are the reasons why you do not use the Internet?
table(rhs$B_62)

# Is too slow, limited bandwidth: What are the reasons why you do not use the Internet?
table(rhs$B_63)

# Other, please specify:  What are the reasons why you do not use the Internet?
table(rhs$B_64)

