# import.R
# Bastiaan Quast
# bquast@gmail.com

# load required libraries
library(haven)

# import the data
rhs <- read_dta("data/rhsbaus-2011-2012/rhsbaus-2011-2012.dta")

# save the data
save(file = "data/rhs.RData", rhs)
