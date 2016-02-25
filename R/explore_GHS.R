# explore_GHS.R
# ---------------
# explore the 2014 General Household Survey
#
# Bastiaan Quast
# bquast@gmail.com


# load data
load(file = 'data/GeneralHouseholdSurvey2014.pdf')


# relevant variables from household data set (house14)
Q61Phon   #Telephone	
Q62aCell	# Cellular telephone	
Q62bNrCell	# Total number of cellular telephone in the household	
Q63Ntel	# Distance to the telephone	
Q64Int1	# Internet connection in the household	
Q64Int2	# Internet in a library or community hall/Thusong centre	
Q64Int3	# Internet for students at a school/university/college	
Q64Int4	# At place of work	
Q64Int5	# Internet Café 2 km or less from the household	
Q64Int6	# Internet Café more than 2 km from the household	
Q64Int7	# Any place via a mobile cellular phone	
Q64Int8	# Any place via any other mobile access services	
Q64Int9	# Other (members of this household)	
Q65Narrow	# Narrowband	
Q65Fixed	# Fixed broadband	
Q65Mobile	# Mobile broadband	
Q66RSNINT	# Reasons for not having internet access at home

Q821Comp	# Computer/Desktop/Laptop

Q812 # Netincome	Net household income per month in Rand	
Q813 # Mincome	Monthly income of your household higher	
Q814 # Exp	Household expenditure
totmhinc	# Household income


# relevant variables from person data set (person14)
# NONE