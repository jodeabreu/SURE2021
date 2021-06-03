#install.packages("rgbif")
library(rgbif)
library(rgbif)
dan_ple=occurrencelist(sciname = 'Danaus plexippus', 
                       coordinatestatus = TRUE, maxresults = 1000, 
                       latlongdf = TRUE, removeZeros = TRUE)
library(maps)
library(ggplot2)
world = map_data("usa")
ggplot(world, aes(long, lat)) +
  geom_polygon(aes(group = group), fill = "white", 
               color = "gray40", size = .2) +
  geom_jitter(data = stonehill,
              aes(longitude, latitude), alpha=0.6, 
              size = 4, color = "red")


library(maps)
library(ggplot2)
world = map_data("world")
ggplot(world, aes(long, lat)) +
  geom_polygon(aes(group = group), fill = "white", 
               color = "gray40", size = .2) +
  geom_jitter(data = dan_ple,
              aes(decimalLongitude, decimalLatitude), alpha=0.6, 
              size = 4, color = "red") +
  opts(title = "Danaus plexippus")
