# import.R
# --------------------------------------------
# instructions for importing data
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(haven)


# read SAS source files
adult1 <- read_sas(data_file = 'data/nids-v1-2008-v5.3-20150619-sas/AdultW1AnonV5_3.sas7bdat')
adult2 <- read_sas(data_file = 'data/nids-w2-2010-2012-2.3-20150619-sas/AdultW2AnonV2_3.sas7bdat')
adult3 <- read_sas(data_file = 'data/nids-w3-2012-v1.3-20150619-sas/AdultW3AnonV1_3.sas7bdat')
child1 <- read_sas(data_file = 'data/nids-v1-2008-v5.3-20150619-sas/ChildW1AnonV5_3.sas7bdat')
child2 <- read_sas(data_file = 'data/nids-w2-2010-2012-2.3-20150619-sas/ChildW2AnonV2_3.sas7bdat')
child3 <- read_sas(data_file = 'data/nids-w3-2012-v1.3-20150619-sas/ChildW3AnonV1_3.sas7bdat')
hhder1 <- read_sas(data_file = 'data/nids-v1-2008-v5.3-20150619-sas/hhderivedW1AnonV5_3.sas7bdat')
hhder2 <- read_sas(data_file = 'data/nids-w2-2010-2012-2.3-20150619-sas/hhderivedW2AnonV2_3.sas7bdat')
hhder3 <- read_sas(data_file = 'data/nids-w3-2012-v1.3-20150619-sas/hhderivedW3AnonV1_3.sas7bdat')
hhque1 <- read_sas(data_file = 'data/nids-v1-2008-v5.3-20150619-sas/HHQuestionnaireW1AnonV5_3.sas7bdat')
hhque2 <- read_sas(data_file = 'data/nids-w2-2010-2012-2.3-20150619-sas/HHQuestionnaireW2AnonV2_3.sas7bdat')
hhque3 <- read_sas(data_file = 'data/nids-w3-2012-v1.3-20150619-sas/HHQuestionnaireW3AnonV1_3.sas7bdat')
inder1 <- read_sas(data_file = 'data/nids-v1-2008-v5.3-20150619-sas/indderivedW1AnonV5_3.sas7bdat')
inder2 <- read_sas(data_file = 'data/nids-w2-2010-2012-2.3-20150619-sas/indderivedW2AnonV2_3.sas7bdat')
inder3 <- read_sas(data_file = 'data/nids-w3-2012-v1.3-20150619-sas/indderivedW3AnonV1_3.sas7bdat')

# read stata source files (wave 4)
adult4 <- read_dta(path  = 'data/nids-w4-2014-2015-v1-stata12/Adult_W4_Anon_V1.0.dta')
child4 <- read_dta(path  = 'data/nids-w4-2014-2015-v1-stata12/Child_W4_Anon_V1.0.dta')
hhder4 <- read_dta(path  = 'data/nids-w4-2014-2015-v1-stata12/hhderived_W4_Anon_V1.0.dta')
inder4 <- read_dta(path  = 'data/nids-w4-2014-2015-v1-stata12/indderived_W4_Anon_V1.0.dta')


# save to file
save.image(file = 'data/imported.RData')


# Import data from August 2016 (including wave 4)
# read SAS source files
adult1 <- read_sas(data_file = 'data/nids-w1-2008-v6.1-sas/nids-w1-2008-v6.1-sas/adult_w1_anon_v6.1.sas7bdat')
adult2 <- read_sas(data_file = 'data/nids-w2-2010-2011-v3.1-sas/nids-w2-2010-2011-v3.1-sas/adult_w2_anon_v3.1.sas7bdat')
adult3 <- read_sas(data_file = 'data/nids-w3-2012-v2.1-sas/nids-w3-2012-v2.1-sas/adult_w3_anon_v2.1.sas7bdat')
adult4 <- read_sas(data_file = 'data/nids-w4-2014-2015-v1.1-sas/nids-w4-2014-2015-v1.1-sas/adult_w4_anon_v1.1.sas7bdat')

child1 <- read_sas(data_file = 'data/nids-w1-2008-v6.1-sas/nids-w1-2008-v6.1-sas/child_w1_anon_v6.1.sas7bdat')
child2 <- read_sas(data_file = 'data/nids-w2-2010-2011-v3.1-sas/nids-w2-2010-2011-v3.1-sas/child_w2_anon_v3.1.sas7bdat')
child3 <- read_sas(data_file = 'data/nids-w3-2012-v2.1-sas/nids-w3-2012-v2.1-sas/child_w3_anon_v2.1.sas7bdat')
child4 <- read_sas(data_file = 'data/nids-w4-2014-2015-v1.1-sas/nids-w4-2014-2015-v1.1-sas/child_w4_anon_v1.1.sas7bdat')

hhder1 <- read_sas(data_file = 'data/nids-w1-2008-v6.1-sas/nids-w1-2008-v6.1-sas/hhderived_w1_anon_v6.1.sas7bdat')
hhder2 <- read_sas(data_file = 'data/nids-w2-2010-2011-v3.1-sas/nids-w2-2010-2011-v3.1-sas/hhderived_w2_anon_v3.1.sas7bdat')
hhder3 <- read_sas(data_file = 'data/nids-w3-2012-v2.1-sas/nids-w3-2012-v2.1-sas/hhderived_w3_anon_v2.1.sas7bdat')
hhder4 <- read_sas(data_file = 'data/nids-w4-2014-2015-v1.1-sas/nids-w4-2014-2015-v1.1-sas/hhderived_w4_anon_v1.1.sas7bdat')

hhque1 <- read_sas(data_file = 'data/nids-w1-2008-v6.1-sas/nids-w1-2008-v6.1-sas/hhquestionnaire_w1_anon_v6.1.sas7bdat')
hhque2 <- read_sas(data_file = 'data/nids-w2-2010-2011-v3.1-sas/nids-w2-2010-2011-v3.1-sas/hhquestionnaire_w2_anon_v3.1.sas7bdat')
hhque3 <- read_sas(data_file = 'data/nids-w3-2012-v2.1-sas/nids-w3-2012-v2.1-sas/hhquestionnaire_w3_anon_v2.1.sas7bdat')
hhque4 <- read_sas(data_file = 'data/nids-w4-2014-2015-v1.1-sas/nids-w4-2014-2015-v1.1-sas/hhquestionnaire_w4_anon_v1.1.sas7bdat')

inder1 <- read_sas(data_file = 'data/nids-w1-2008-v6.1-sas/nids-w1-2008-v6.1-sas/indderived_w1_anon_v6.1.sas7bdat')
inder2 <- read_sas(data_file = 'data/nids-w2-2010-2011-v3.1-sas/nids-w2-2010-2011-v3.1-sas/indderived_w2_anon_v3.1.sas7bdat')
inder3 <- read_sas(data_file = 'data/nids-w3-2012-v2.1-sas/nids-w3-2012-v2.1-sas/indderived_w3_anon_v2.1.sas7bdat')
inder4 <- read_sas(data_file = 'data/nids-w4-2014-2015-v1.1-sas/nids-w4-2014-2015-v1.1-sas/indderived_w4_anon_v1.1.sas7bdat')


# save data
save.image(file = 'data/imported-w1-4.RData')
