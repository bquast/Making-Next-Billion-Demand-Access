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

## date
w1_a_intrv_d    # a14_1 - Interview _day
w1_a_intrv_m    # a14_m - Interview month
w1_a_intrv_y    # a14_y - Interview year

## language and ethnicity
w1_a_popgrp     # b3 - Population group
w1_a_lng        # b4 - Home Language
w1_a_edlitrdhm  # h36 - Respondent's reading level in home language
w1_a_edlitwrthm # h37 - Respondent's writing level in home language
w1_a_edlitrden  # h38 - Respondent's reading level in English
w1_a_edlitwrten # h39 - Respondent's writing level in English
w1_a_numlv      # p3 - Numeracy test level

## computer / phone
w1_a_owncom   # g8 - Ownership of a Computer
w1_a_owncom_v # g8a - Current resale value of Computer
w1_a_owncel   # g10 - Ownership of Cellphone
w1_a_owncel_v # g10a - Current resale value of Cellphone

## education
w1_a_asfin      # g24 - Has Unit trusts, stocks and shares
w1_a_edschgrd   # h1  - Highest school grade completed
w1_a_edschyr    # h2_1  - Year in which respondent completed highest grade
w1_a_edschage   # h2_2  - Age at which respondent completed highest grade
w1_a_edschstrt  # h5  - Year in which respondent first attended Grade 1/Sub A
w1_a_edschmth   # h6  - Highest school grade in mathematics completed
w1_a_edter      # h7  - Respondent has successfully completed some from of tertiary studies
w1_a_edterlev   # h8 - Highest level of tertiary education completed
w1_a_edterlev_o # h8_o -  Other highest level of tertiary education completed

## decisions expenses
w1_a_decd       # l1_1 - Main decision-maker about day-to-day household expenditure
w1_a_decdpid    # l1_1 - Main decision-maker about day-to-day household expenditure
w1_a_decd2      # l2_1 - Joint decision-maker about day-to-day household expenditure
w1_a_decdpid2   # l2_1 - Joint decision-maker about day-to-day household expenditure
w1_a_declrg     # l1_2 - Main decision-maker about large unusual purchases
w1_a_declrgpid  # l1_2 - Main decision-maker about large unusual purchases
w1_a_declrg2    # l2_2 - Joint decision-maker about large unusual large purchases
w1_a_declrgpid2 # l2_2 - Joint decision-maker about large unusual large purchases


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
w1_best_edu     # Best education
w1_numzscore    # Standard numeracy score

w1_empl_stat    # Employment status - Adult only


# scan household questionaire
explore(hhque1)


# list of relevant variables
w1_h_rntpot       # d12 - Amount of rent willing to pay
w1_h_enrgelec     # d22 - Household has electricity
w1_h_telcel       # Household has a cellphone available for regular use
w1_h_expnd        # d31 - Household expenditiure in last 30 days
w1_h_nfent        # e2_1_3 - Household spent on entertainment  in the last 30 days
w1_h_nfentspn     # e2_2_3 - Amount spent on entertainment  in last 30 days
w1_h_nfpap        # e2_1_7 - Household spent on literary materials in the last 30 days
w1_h_nfpapspn     # e2_2_7 - Amount spent on literary materials in last 30 day
w1_h_nfcel        # e2_1_8 - Household spent on cellphone experiences in the last 30 days
w1_h_nfcelspn     # e2_2_8 - Amount spent on cellphone expenses in last 30 days
w1_h_nftel        # e2_1_9 - Household spent on  telephone expenses in the last 30 days
w1_h_nftelspn     # e2_2_9 - Amount spent on telephone expenses in last 30 days
w1_h_nfnet        # e2_1_11 - Household spent on internet in the last 30 days
w1_h_nfnetspn     # e2_2_11 - Amount spent on internet in last 30 days
w1_h_nfinsedu     # e2_1_24 - Household spent on educational policies in the last 30 days
w1_h_nfinseduspn  # e2_2_24 - Amount spent on educational policies in last 30 days
w1_h_nfschfeespn  # e2_2_41 - Amount spent on school fees and tuition in last 30 days
w1_h_nfschstat    # e2_1_42 - Household spent on school books and stationary in the last 30 days
w1_h_nfschstatspn # e2_2_42 - Amount spent on school books and stationary in last 30 days
w1_h_owncom       # f1_6 - The household owns a computer
w1_h_owncel       # f1_8 - The household owns a cellphone
w1_h_intlng1      # j1_1 - Languages used during interview
w1_h_intlng2      # j1_2 - Languages used during interview
w1_h_intlng3      # j1_3 - Languages used during interview
w1_h_intlng4      # j1_4 - Languages used during interview
w1_h_intlng_o     # j1_o - Other languages used during interview
