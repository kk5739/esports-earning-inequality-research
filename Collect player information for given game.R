#Collect Players from a given game

#This will collect information including esports
#earnings PlayerIDs for all players in a given game

#Before starting make sure the necessary packages
#are installed and loaded:

install.packages('httr') #If do not already have
install.packages('dplyr') #If do not already have
library(httr)
library(dplyr)
library(jsonlite)

#Before starting update the the GameID in each of
#the API calls and change the name of the file to
#the correct game. For example, the baseline
#code below will scrape the information for
#StarcraftII (GameID: 151)
#DotaII (GameID: 231)
#Counter-Strike: Global Offensive (GameID: 245)
#Fortnite (GameID: 534)
#League of Legends (GameID: 164)
#Rainbow Six Siege (GameID: 439)
#Heroes of the Storm (GameID: 371)
#Rocket League (GameID: 409)
#Counter-Strike (GameID: 162)
#Apex Legends (GameID: 566)


#Also search the API call to see how many players:

APILINK <- 'http://api.esportsearnings.com/v0/LookupGameById?apikey=a9abe33e39059a81b2fa1a9648bfbd38572205890f9bdfa50ceca7208a9da065&gameid=566'
gamefeaturesGET <- APILINK %>% 
  httr::GET(config = httr::config(ssl_verifypeer = FALSE)) %>% 
  content(as = "text") %>%
  fromJSON()
gamefeaturesGET

#Divide the total players by 100 to find
#the approximate number of for loops for the game
#e.g. StarCraftII 2115/100 =212
#e.g. DotaII 4176/100 = 418 
#e.g. Counter-Strike 14698/100 = 1470
#e.g. Fortnite 4931/100 = 494
#e.g. LOL 8018/100 = 802


#The following will call and collect all the players
#and make a dataset. Each loop collects 100 players
#up until the number of loops ends.
#The call will give a notice every second of the default

APILINK <- 'http://api.esportsearnings.com/v0/LookupHighestEarningPlayersByGame?apikey=a9abe33e39059a81b2fa1a9648bfbd38572205890f9bdfa50ceca7208a9da065&gameid=566&offset=0'
topgameplayersGET <- APILINK %>% 
  httr::GET(config = httr::config(ssl_verifypeer = FALSE)) %>% 
  content(as = "text") %>%
  fromJSON()

for (i in 1:16) {
  offset <- i*100
  APILINK <- paste0("http://api.esportsearnings.com/v0/LookupHighestEarningPlayersByGame?apikey=b0e0da7e58c715f8618fbf2bb0f01920395531a048ccc4857274c6ccd7c157f9&gameid=566&offset=", offset)
  jsonplayers <- APILINK %>% 
    httr::GET(config = httr::config(ssl_verifypeer = FALSE)) %>% 
    content(as = "text") %>%
    fromJSON()
  topgameplayersGET <- rbind(topgameplayersGET, jsonplayers)
  #I was getting an error because it was going to quick
  #so I aded this to slow down
  Sys.sleep(1)
}

#set your working directory to where you want the file
setwd("~/Desktop/R/Esport Study/OneDrive_2022-01-15/Kyeongmo_data")

#this will write the file as a csv in the location
#you have selected
write.csv(topgameplayersGET, "allplayersApexLegends.csv")
