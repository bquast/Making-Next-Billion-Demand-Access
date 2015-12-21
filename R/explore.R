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


# scan child
explore(child1)

# list of relevant variables

## languages
w1_c_lng # b3 - Home language

## schooling
w1_c_ed08curgrd # c2 - The child currently attends 
w1_c_edatt      # c3 - Has this child ever attended school
w1_c_edcmpgrd   # c6 - Highest school grade completed 
w1_c_ed07spnfee # c13_1 - Amount spent on School fees 
w1_c_ed07spnuni # c13_2 - Amount spent Uniform
w1_c_ed07spnbks # c13_3 - Amount spent on Books and Stationery 
w1_c_ed07spntrn # c13_4 - Amount spent on Transport to school
w1_c_ed07spno   # c13_5 - Amount spent on other school related expenses
w1_c_ed08cur    # c17 - The child is currently enrolled in school

w1_c_numlv  # h4 - Numeracy test level
w1_c_numq1  # h_q1 - Num Test
w1_c_numq2  # h_q2 - Num Test
w1_c_numq3  # h_q3 - Num Test 
w1_c_numq4  # h_q4 - Num Test 
w1_c_numq5  # h_q5 - Num Test 
w1_c_numq6  # h_q6 - Num Test
w1_c_numq7  # h_q7 - Num Test
w1_c_numq8  # h_q8 - Num Test
w1_c_numq9  # h_q9 - Num Test
w1_c_numq10 # h_q10 - Num Test
w1_c_numq11 # h_q11 - Num Test
w1_c_numq12 # h_q12 - Num Test 
w1_c_numq13 # h_q13 - Num Test
w1_c_numq14 # h_q14 - Num Test 
w1_c_numq15 # h_q15 - Num Test 

## health
w1_c_hlvistst # d18 - Child has had their eyes tested
w1_c_hlvisaid # d19 - Child wears glasses/contact lenses


# scan household derived
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


# scan individual derived
explore(inder1)


# list of relevant variables

w1_best_age_yrs # Best age in years
w1_best_edu # Best education
w1_numzscore # Standard numeracy score

w1_empl_stat # Employment status - Adult only


# scan household questionaire


# list of relevant variables
w1_h_rntpot # d12 - Amount of rent willing to pay
# d22 - Household has electricity     w1_h_enrgelec
# Household has a cellphone available for regular use       w1_h_telcel
# d31 - Household expenditiure in last 30 days        w1_h_expnd
# e2_1_3 - Household spent on entertainment  in the last 30 days        w1_h_nfent
# e2_2_3 - Amount spent on entertainment  in last 30 days     w1_h_nfentspn
# e2_1_9 - Household spent on  telephone expenses in the last 30 days        w1_h_nftel
# e2_2_9 - Amount spent on telephone expenses in last 30 days     w1_h_nftelspn
# e2_1_11 - Household spent on internet in the last 30 days        w1_h_nfnet
# e2_2_11 - Amount spent on internet in last 30 days     w1_h_nfnetspn
# e2_1_24 - Household spent on educational policies in the last 30 days     w1_h_nfinsedu
# e2_2_24 - Amount spent on educational policies in last 30 days  w1_h_nfinseduspn
# e2_2_41 - Amount spent on school fees and tuition in last 30 days  w1_h_nfschfeespn
# e2_1_42 - Household spent on school books and stationary in the last 30 days    w1_h_nfschstat
# e2_2_42 - Amount spent on school books and stationary in last 30 days w1_h_nfschstatspn
# f1_6 - The household owns a computer       w1_h_owncom
# f1_8 - The household owns a cellphone       w1_h_owncel
# j1_1 - Languages used during interview      w1_h_intlng1
# j1_2 - Languages used during interview      w1_h_intlng2
# j1_3 - Languages used during interview      w1_h_intlng3
# j1_4 - Languages used during interview      w1_h_intlng4
# j1_o - Other languages used during interview     w1_h_intlng_o
