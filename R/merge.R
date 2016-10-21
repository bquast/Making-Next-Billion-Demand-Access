# merge.R
# --------------------------------------------
# instructions for merging data
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(plm)
library(magrittr)
library(dplyr)


# load data
load('data/imported-w1-4.RData')


# now subset all to the important variables and merge

## create a list of variables for each type of data.frame
vars_adult <- c('hhid',         # household ID
                'pid',          # person ID
                'a_gen',        # gender
                'a_popgrp',  # b3 - Population group
                'a_lng',        # b4 - Home Language
                'a_owncom',     # g8 - Ownership of a Computer
                #'a_owncom_v',   # g8a - Current resale value of Computer
                'a_owncel',     # g10 - Ownership of Cellphone
                #'a_owncel_v',   # g10a - Current resale value of Cellphone
                'a_edlitrdhm',  # h36 - Respondent's reading level in home language
                'a_edlitwrthm', # h37 - Respondent's writing level in home language
                'a_edlitrden',  # h38 - Respondent's reading level in English
                'a_edlitwrten', # h39 - Respondent's writing level in English
                #'a_numlv',      # p3 - Numeracy test level
                #'a_decd',       # l1_1 - Main decision-maker about day-to-day household expenditure
                #'a_decdpid',    # l1_1 - Main decision-maker about day-to-day household expenditure
                #'a_decd2',      # l2_1 - Joint decision-maker about day-to-day household expenditure
                #'a_decdpid2',   # l2_1 - Joint decision-maker about day-to-day household expenditure
                #'a_declrg',     # l1_2 - Main decision-maker about large unusual purchases
                #'a_declrgpid',  # l1_2 - Main decision-maker about large unusual purchases
                #'a_declrg2',    # l2_2 - Joint decision-maker about large unusual large purchases
                #'a_declrg2',    # l2_2 - Joint decision-maker about large unusual large purchases
                #'a_declrgpid2', # l2_2 - Joint decision-maker about large unusual large purchases
                'a_intlng1',    # s1_1 - Languages used during interview
                'a_intlng2',    # s1_2 - Languages used during interview
                'a_intlng3',    # s1_3 - Languages used during interview
                'a_intlng4',    # s1_4 - Languages used during interview
                'a_intlng5',    # s1_5 - Languages used during interview
                'a_intlng6')    # s1_6 - Languages used during interview
                
                
vars_child <- c('hhid',       # household ID
                'pid',        # person ID
                'c_intrv_y',  # interview year
                'c_intrv_m',  # interview month
                'c_intrv_d',  # interview day
                'c_gen',      # gender
                'c_dob_m',    # date-of-birth month
                'c_dob_y'    # date-of-birth year
                # 'c_mthhh',    # mother in household
                # 'c_fthhh',    # father in household
                # 'c_mthtrt',   # mother secondary school
                # 'c_fthtrt'   # father secondary school
)

vars_hhder <- c('hhid',       # household ID
                'hhincome',   # household income
                'expf',       # expenditure food?
                'expnf',      # expenditure non-food?
                'expenditure',# expenditure
                'geo2011',  # geo location for 2011
                'rentexpend', # rent expenditure
                'hhimprent',  # imputed rent expenditure
                'hhagric')    # agricultural household

vars_inder <- c('hhid',       # household ID
                'pid',        # person ID
                'best_age_yrs',# best age years
                'best_race',  # race
                'best_gen',   # gender 
                'best_dob_m', # date of birth: month
                'best_dob_y', # date of brith: year
                'best_edu',   # best education
                'best_mthpid',# mother person ID
                'best_fthpid',# father person ID
                'fwag',       # monthly income primary and secondary job
                'cwag',       # monthly income casual work
                'swag',       # monthly income self-employment
                'chld',       # child support grant
                'fost',       # foster care grant
                'spen',       # old age state pension (RSA)
                'spen_flg',   # data old age state pension (RSA)
                'ppen',       # month income private / foreign pension
                'ppen_flg',   # data monthly income private / foreign pension
                'uif',        # montly income UIF payments (unemployment)
                'remt')       # monthly income remittances

vars_hhque <- c('hhid',           # household identification
                'h_enrgelec',     # d22 - Household has electricity
                'h_telcel',       # Household has a cellphone available for regular use
                'h_expnd',        # d31 - Household expenditiure in last 30 days
                # 'h_nfent',        # e2_1_3 - Household spent on entertainment  in the last 30 days
                'h_nfentspn',     # e2_2_3 - Amount spent on entertainment  in last 30 days
                # 'h_nfpap',        # e2_1_7 - Household spent on literary materials in the last 30 days
                'h_nfpapspn',     # e2_2_7 - Amount spent on literary materials in last 30 day
                'h_nfcel',        # e2_1_8 - Household spent on cellphone experiences in the last 30 days
                'h_nfcelspn',     # e2_2_8 - Amount spent on cellphone expenses in last 30 days
                'h_nftel',        # e2_1_9 - Household spent on  telephone expenses in the last 30 days
                'h_nftelspn',     # e2_2_9 - Amount spent on telephone expenses in last 30 days
                'h_nfnet',        # e2_1_11 - Household spent on internet in the last 30 days
                'h_nfnetspn',     # e2_2_11 - Amount spent on internet in last 30 days
                'h_owncom',       # f1_6 - The household owns a computer
                'h_owncel')       # f1_8 - The household owns a cellphone


## remove wave indicator from variable names
names(adult1) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(adult2) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(adult3) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(adult4) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(child1) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(child2) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(child3) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(child4) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(hhder1) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(hhder2) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(hhder3) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(hhder4) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(inder1) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(inder2) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(inder3) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(inder4) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(hhque1) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(hhque2) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(hhque3) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )
names(hhque4) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-4].', "" )

## homogenise some variables across waves
hhder4$hhgeo2011  <- hhder4$geo2011

hhque1$h_nftelspn <- ifelse(hhque1$h_nftel == 2, 0, hhque1$h_nftelspn)
# hhque2$h_nftelspn <- ifelse(hhque2$h_nftel == 2, 0, hhque2$h_nftelspn) # not needed, already contains zero expenditure
hhque3$h_nftelspn <- ifelse(hhque3$h_nftel == 2, 0, hhque3$h_nftelspn)
hhque4$h_nftelspn <- ifelse(hhque4$h_nftel == 2, 0, hhque4$h_nftelspn)

hhque1$h_nftel    <- ifelse(hhque1$h_nftel == 1, TRUE, ifelse(hhque1$h_nftel == 2, FALSE, NA))
hhque2$h_nftel    <- ifelse(hhque2$h_nftelspn < 0, NA, ifelse(hhque2$h_nftelspn == 0, FALSE, TRUE))
hhque3$h_nftel    <- ifelse(hhque3$h_nftel == 1, TRUE, ifelse(hhque3$h_nftel == 2, FALSE, NA))
hhque4$h_nftel    <- ifelse(hhque4$h_nftel == 1, TRUE, ifelse(hhque4$h_nftel == 2, FALSE, NA))

# hhque2$h_nfcelspn <- hhque2$h_nfcel
# hhque2$h_nfcel    <- ifelse(hhque2$h_nfcel > 0, TRUE, ifelse(hhque2$h_nfcel < 0, NA, FALSE))

hhque1$h_nfcelspn <- ifelse(hhque1$h_nfcel == 2, 0, hhque1$h_nfcelspn)
hhque3$h_nfcelspn <- ifelse(hhque3$h_nfcel == 2, 0, hhque3$h_nfcelspn)
hhque4$h_nfcelspn <- ifelse(hhque4$h_nfcel == 2, 0, hhque4$h_nfcelspn)

hhque1$h_nfcel    <- ifelse(hhque1$h_nfcel == 1, TRUE, ifelse(hhque1$h_nfcel == 2, FALSE, NA))
hhque2$h_nfcel    <- ifelse(hhque2$h_nfcelspn < 0, NA, ifelse(hhque2$h_nfcelspn == 0, FALSE, TRUE))
hhque3$h_nfcel    <- ifelse(hhque3$h_nfcel == 1, TRUE, ifelse(hhque3$h_nfcel == 2, FALSE, NA))
hhque4$h_nfcel    <- ifelse(hhque4$h_nfcel == 1, TRUE, ifelse(hhque4$h_nfcel == 2, FALSE, NA))

# hhque2$h_nfnetspn <- hhque2$h_nfnet
hhque1$h_nfnetspn <- ifelse(hhque1$h_nfnet == 2, 0, hhque1$h_nfnetspn)
hhque3$h_nfnetspn <- ifelse(hhque3$h_nfnet == 2, 0, hhque3$h_nfnetspn)
hhque4$h_nfnetspn <- ifelse(hhque4$h_nfnet == 2, 0, hhque4$h_nfnetspn)

hhque1$h_nfnet    <- ifelse(hhque1$h_nfnet == 1, TRUE, ifelse(hhque1$h_nfnet == 2, FALSE, NA))
hhque2$h_nfnet    <- ifelse(hhque2$h_nfnetspn < 0, NA, ifelse(hhque2$h_nfnetspn == 0, FALSE, TRUE))
hhque3$h_nfnet    <- ifelse(hhque3$h_nfnet == 1, TRUE, ifelse(hhque3$h_nfnet == 2, FALSE, NA))
hhque4$h_nfnet    <- ifelse(hhque4$h_nfnet == 1, TRUE, ifelse(hhque4$h_nfnet == 2, FALSE, NA))

child3$c_mthhh <- child3$c_mthhh_pid
child3$c_fthhh <- child3$c_fthhh_pid

hhder1$hhimprent <- hhder1$hhimprent_exp

## subset to relevant variables
adult1 %<>% subset(select=vars_adult)
adult2 %<>% subset(select=vars_adult)
adult3 %<>% subset(select=vars_adult)
adult4 %<>% subset(select=vars_adult)
child1 %<>% subset(select=vars_child)
child2 %<>% subset(select=vars_child)
child3 %<>% subset(select=vars_child)
child4 %<>% subset(select=vars_child)
hhder1 %<>% subset(select=vars_hhder)
hhder2 %<>% subset(select=vars_hhder)
hhder3 %<>% subset(select=vars_hhder)
hhder4 %<>% subset(select=vars_hhder)
inder1 %<>% subset(select=vars_inder)
inder2 %<>% subset(select=vars_inder)
inder3 %<>% subset(select=vars_inder)
inder4 %<>% subset(select=vars_inder)
hhque1 %<>% subset(select=vars_hhque)
hhque2 %<>% subset(select=vars_hhque)
hhque3 %<>% subset(select=vars_hhque)
hhque4 %<>% subset(select=vars_hhque)

## add wave indicator
adult1 %<>% cbind(wave = 1)
adult2 %<>% cbind(wave = 2)
adult3 %<>% cbind(wave = 3)
adult4 %<>% cbind(wave = 3)
child1 %<>% cbind(wave = 1)
child2 %<>% cbind(wave = 2)
child3 %<>% cbind(wave = 3)
child4 %<>% cbind(wave = 3)
hhder1 %<>% cbind(wave = 1)
hhder2 %<>% cbind(wave = 2)
hhder3 %<>% cbind(wave = 3)
hhder4 %<>% cbind(wave = 3)
inder1 %<>% cbind(wave = 1)
inder2 %<>% cbind(wave = 2)
inder3 %<>% cbind(wave = 3)
inder4 %<>% cbind(wave = 3)
hhque1 %<>% cbind(wave = 1)
hhque2 %<>% cbind(wave = 2)
hhque3 %<>% cbind(wave = 3)
hhque4 %<>% cbind(wave = 3)

## merge inter-temporal
adult <- rbind(adult1, adult2, adult3)
child <- rbind(child1, child2, child3)
hhder <- rbind(hhder1, hhder2, hhder3)
inder <- rbind(inder1, inder2, inder3)
hhque <- rbind(hhque1, hhque2, hhque3)


# recode certain variables

## gender numeric to woman logical
adult$a_woman <- ifelse(adult$a_gen == 2, TRUE, FALSE)
child$c_woman <- ifelse(child$c_gen == 2, TRUE, FALSE)
inder$woman   <- ifelse(inder$best_gen == 2, TRUE, FALSE)
inder$spen    <- ifelse(is.na(inder$spen), 0, inder$spen)
inder$ppen    <- ifelse(is.na(inder$ppen), 0, inder$ppen)


# save data
save(file = 'data/adult.RData', adult)
save(file = 'data/child.RData', child)
save(file = 'data/hhder.RData', hhder)
save(file = 'data/inder.RData', inder)
save(file = 'data/hhque.RData', hhque)


# merge across data.frame types
adult   <- merge(adult,   inder, by = c('pid', 'hhid', 'wave'), all.x = TRUE)
# adult$hhid <- adult$hhid.x
# adult$hhid.x <- NULL
# adult$hhid.y <- NULL
adulthh <- merge(adult,   hhder, by = c('hhid', 'wave'), all.x = TRUE)
adulthh <- merge(adulthh, hhque, by = c('hhid', 'wave'), all.x = TRUE)


# remove missing value codes
adulthh$a_lng        <- ifelse(adulthh$a_lng < 0, NA, adulthh$a_lng)
adulthh$h_nftelspn   <- ifelse(adulthh$h_nftelspn < 0, NA, adulthh$h_nftelspn)
adulthh$h_nfcelspn   <- ifelse(adulthh$h_nfcelspn < 0, NA, adulthh$h_nfcelspn)
adulthh$h_nfnetspn   <- ifelse(adulthh$h_nfnetspn < 0, NA, adulthh$h_nfnetspn)
adulthh$a_owncom     <- ifelse(adulthh$a_owncom == 1, TRUE, ifelse(adulthh$a_owncom == 2, FALSE, NA))
adulthh$a_owncel     <- ifelse(adulthh$a_owncel == 1, TRUE, ifelse(adulthh$a_owncel == 2, FALSE, NA))
adulthh$a_edlitrdhm  <- ifelse(adulthh$a_edlitrdhm < 0, NA, adulthh$a_edlitrdhm)
adulthh$a_edlitwrthm <- ifelse(adulthh$a_edlitwrthm < 0, NA, adulthh$a_edlitwrthm)
adulthh$a_edlitrden  <- ifelse(adulthh$a_edlitrden < 0, NA, adulthh$a_edlitrden)
adulthh$a_edlitwrten <- ifelse(adulthh$a_edlitwrten < 0, NA, adulthh$a_edlitwrten)


# create event dummy
adulthh$interface_intro <- ifelse(adulthh$wave > 2, TRUE, FALSE)
adulthh$event <- adulthh$interface_intro

# create setswana dummy
adulthh$setswana_logical <- ifelse(adulthh$a_lng == 6, TRUE, FALSE)
adulthh$setswana <- adulthh$setswana_logical

# human readable names
adulthh$language <- adulthh$a_lng
adulthh$own_computer <- adulthh$a_owncom
adulthh$Internet_expenditure <- adulthh$h_nfnet

# remove observations without languages
adulthh <- subset(adulthh, adulthh$a_lng != 12)
adulthh <- subset(adulthh, !is.na(adulthh$a_lng))

# make language labelled factor
adulthh$a_lng <- factor(adulthh$a_lng, labels = c('IsiNdebele',
                                                  'IsiXhosa',
                                                  'IsiZulu',
                                                  'Sepedi',
                                                  'Sesotho',
                                                  'Setswana',
                                                  'SiSwati',
                                                  'Tshivenda',
                                                  'IsiTsonga',
                                                  'Afrikaans',
                                                  'English'))

# rename to NIDS
NIDS <- adulthh

# save to file
save(adulthh, file = 'data/merged.RData')
