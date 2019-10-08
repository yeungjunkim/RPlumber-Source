#install.packages("plumber")
library(plumber)
r <- plumb("./makerestapi.R")  # Where 'plumber.R' is the location of the file shown above
r$run(port=8000)
