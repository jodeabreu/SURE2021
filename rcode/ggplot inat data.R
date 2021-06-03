#install.packages('rinat')
library(rinat)
library(ggplot2)
#install.packages("dplyr")
library(dplyr)
#install.packages("taxize")
stonehill <- get_inat_obs(place_id=91152, maxresults = 4000)
head(stonehill)
ggplot(stonehill) + geom_bar(aes(x= scientific_name))
toplot= (stonehill) %>% 
  group_by(scientific_name) %>% 
  summarise(count=n()) %>% 
  arrange(desc(count)) %>%
  filter(count>= 10)
ggplot(toplot) + 
  geom_col (aes(x=scientific_name, y=count)) +
  theme(axis.text.x  = element_text(angle=50, vjust= 1, hjust=1.2 ))
counts <- get_inat_taxon_stats(place=91152)