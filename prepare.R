# prepare.R
# Bastiaan Quast
# bquast@gmail.com

# check if source file exists
# output should be: TRUE
file.exists("rhsbaus-2011-2012-v1.zip")

# unzip source file
# to subdirectory data
unzip(zipfile = "rhsbaus-2011-2012-v1.zip", exdir = "data")
