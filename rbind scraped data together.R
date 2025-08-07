#Rbind scraped data together

#Step 1: Clear global environment
#Step 2: Set working directory setwd()
#Step 3: Rename files in working directory so that
#they share they are named in order
# e.g. playerearningsStar1csv, playerearningsStar2.csv
#Step 4: alter the following script to have the
#name of the first file
#Step 5: run script

library(dplyr)

df <- read.csv("playerearningsStar1.csv", na.strings = "NA")

for (i in 1:21) {
  no <- i + 1
  filename <- paste0("playerearnigsStar", no, ".csv")
  df1 <- read.csv(filename, na.strings = "NA")
  df <- rbind(df, df1)
}

#Step 6: check df has correct number of observatons
#Step 7: Write new .csv file
write.csv(df, "AllplayerarningsStarCraftII.csv")