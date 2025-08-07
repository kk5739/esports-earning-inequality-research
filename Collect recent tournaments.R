#Collect Recent tournaments

#This will collect information including esports

#Before starting make sure the necessary packages
#are installed and loaded:

install.packages('httr') #If do not already have
install.packages('dplyr') #If do not already have
library(httr)
library(dplyr)
library(jsonlite)



#The following will call and collect all the players
#and make a dataset. Each loop collects 100 players
#up until the number of loops ends.
#The call will give a notice every second of the default

APILINK <- 'http://api.esportsearnings.com/v0/LookupRecentTournaments?apikey=a9abe33e39059a81b2fa1a9648bfbd38572205890f9bdfa50ceca7208a9da065&offset=0'
recenttournamentGET <- APILINK %>% 
  httr::GET(config = httr::config(ssl_verifypeer = FALSE)) %>% 
  content(as = "text") %>%
  fromJSON()
recenttournamentGET

for (i in 485:487) {
  offset <- i*100
  APILINK <- paste0("http://api.esportsearnings.com/v0/LookupRecentTournaments?apikey=a9abe33e39059a81b2fa1a9648bfbd38572205890f9bdfa50ceca7208a9da065&offset=", offset)
  jsontournaments <- APILINK %>% 
    httr::GET(config = httr::config(ssl_verifypeer = FALSE)) %>% 
    content(as = "text") %>%
    fromJSON()
  recenttournamentGET <- rbind( recenttournamentGET, jsontournaments)
  #I was getting an error because it was going to quick
  #so I aded this to slow down
  Sys.sleep(1)
}

#set your working directory to where you want the file
setwd("~/Desktop/R/Esport Study/OneDrive_2022-01-15/Kyeongmo_data")

#this will write the file as a csv in the location
#you have selected
write.csv(recenttournamentGET, "recenttournament43501-48700.csv")
