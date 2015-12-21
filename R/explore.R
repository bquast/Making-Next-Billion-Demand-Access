# explore.R
#
# instructions for exploring data sets
# -------------------------------------
# Bastiaan Quast
# bquast@gmail.com


# import data
load(file = 'data/imported.RData')


# use explore function (own package)
library(explore)


# scan (possible new name for function) adult
explore(adult1)


# list of relevant variables

## computer / phone
w1_a_owncom   # g8 - Ownership of a Computer
w1_a_owncom_v # g8a - Current resale value of Computer
w1_a_owncel   # g10 - Ownership of Cellphone
w1_a_owncel_v # g10a - Current resale value of Cellphone


## reading / writing home language and English
w1_a_edlitrdhm  # h36  - Respondent's reading level in home language
w1_a_edlitwrthm # h37 - Respondent's writing level in home language
w1_a_edlitrden  # h38 - Respondent's reading level in English
w1_a_edlitwrten # h39 - Respondent's writing level in English
w1_a_numlv      # p3 - Numeracy test level

## decisions expenses
w1_a_decd       # l1_1 - Main decision-maker about day-to-day household expenditure
w1_a_decdpid    # l1_1 - Main decision-maker about day-to-day household expenditure
w1_a_decd2      # l2_1 - Joint decision-maker about day-to-day household expenditure
w1_a_decdpid2   # l2_1 - Joint decision-maker about day-to-day household expenditure
w1_a_declrg     # l1_2 - Main decision-maker about large unusual purchases
w1_a_declrgpid  # l1_2 - Main decision-maker about large unusual purchases
w1_a_declrg2    # l2_2 - Joint decision-maker about large unusual large purchases
w1_a_declrgpid2 # l2_2 - Joint decision-maker about large unusual large purchases


## languages during interview
w1_a_intlng1 # s1_1 - Languages used during interview
w1_a_intlng2 # s1_2 - Languages used during interview
w1_a_intlng3 # s1_3 - Languages used during interview
w1_a_intlng4 # s1_4 - Languages used during interview
w1_a_intlng5 # s1_5 - Languages used during interview
w1_a_intlng6 # s1_6 - Languages used during interview


# scan hh derived
explore(hhder1)


# list of relevant variables

## Geo type
w1_hhgeo2011 # GeoType (2011 Census)      
w1_hhgeo2001 # GeoType (2001 Census)

## household income
w1_hhquint  # Per capita household income quintiles
w1_hhq_inc  # Household income as per household questionnaire
w1_hhq_incb # Household income as per household questionnaire incl brackets and imputations
w1_hhincome # Household monthly income - full imputations
w1_hhremitt # Household monthly income from remittances
