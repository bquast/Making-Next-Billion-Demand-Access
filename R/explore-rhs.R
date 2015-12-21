# explore.R
# Bastiaan Quast
# bquast@gmail.com

# load libraries
library(haven)

# load the data
load(file = "data/rhs.RData")

# basic info
str(rhs)
names(rhs)

# create explore function
explore <- function(data) {
  chr <- sapply(data,  attr, "label")
  ids <- names(chr)
  names(chr) <- NULL
  data.frame(description = chr, id = ids)
}

# write variable names to data.frame
vars <- explore(rhs)

# view output
View(vars)

# country
table(as_factor(rhs$A_5))

# computer?
table(as_factor(rhs$H_9))

# internet?
table(as_factor(rhs$HI_1))

# how many people use internet
table(rhs$HI_10)

# why no internet?
table(as_factor(rhs$HI_12))

# read a letter / newspaper
table(as_factor(rhs$N_4))

# main household language
table(as_factor(rhs$N_7))

# read/write english?
table(as_factor(rhs$N_8))

# other languages?
table(as_factor(rhs$N_9))

# own mobile phone
table(as_factor(rhs$M_1))

# mobile phone capable browsing internet
table(as_factor(rhs$M_8))

# mobile phone use Facebook,Twitter, Mixit or other social networking
table(as_factor(rhs$M_29))

# mobile phone use browsing internet
table(as_factor(rhs$M_30))

# use Internet (Gmail, Google, Facebook, MXit, email)
table(as_factor(rhs$B_1))

# how often on average used internet past 3 months
table(as_factor(rhs$B_5))

# have email address
table(as_factor(rhs$B_6))

# main language emailing
table(as_factor(rhs$B_7))

# other language emailing
table(as_factor(rhs$B_8))

# browsing internet what language
table(as_factor(rhs$B_9))

# what language like to see more content?
table(as_factor(rhs$B_10))

# limits use; no interesting content for me
table(as_factor(rhs$B_20))

# limits use; lack local language content
table(as_factor(rhs$B_21))

# limits use; very slow
table(as_factor(rhs$B_22))

# limits use; very expensive
table(as_factor(rhs$B_23))

# limits use; few people communicate with
table(as_factor(rhs$B_24))

# limits use; other
table(as_factor(rhs$B_25))

# social network?
table(as_factor(rhs$B_26))

# which social network?
table(as_factor(rhs$B_27))

# how access social network?
table(as_factor(rhs$B_28))

# dont know what internet is; reason not use
table(as_factor(rhs$B_56))

# no interest / not useful; reason not use
table(as_factor(rhs$B_57))

# dont know how use; reason not use
table(as_factor(rhs$B_58))

# no computer / internet; reason not use
table(as_factor(rhs$B_59))

# too expensive; reason not use
table(as_factor(rhs$B_60))

# no time / busy; reason not use
table(as_factor(rhs$B_61))

# no friends use it; reason not use
table(as_factor(rhs$B_62))

# too slow; reason not use
table(as_factor(rhs$B_63))

# other; reason not use
table(as_factor(rhs$B_64))

# interested if close?
table(as_factor(rhs$B_65))

# willing to spend how much?
table(as_factor(rhs$B_66))
