library(rinat)
library(rgbif)
library(ggplot2)
library(dplyr)
library(rphylopic)
stonehill <- get_inat_obs(place_id=91152, maxresults = 4000)
head(stonehill)
 ggplot(stonehill_tax %>% filter(quality_grade != 'needs_id') %>% filter(phylum== "Chordata"))+
  geom_bar(aes(x=order)) +
  facet_wrap(~kingdom, scales='free_x') +
  theme(axis.text.x= element_text(angle=50, vjust= 1, hjust=1.1 )) + 
  add_phylopic(Passeriformes, alpha = 1, x = 15, y = 175, ysize = 20, color = "black") + 
add_phylopic(Anseriforme, alpha = 1, x = 2, y = 90, ysize = 30, color = "black") +
add_phylopic(Perciformes, alpha = 1, x = 17, y = 55, ysize = 15, color = "black") + 
  add_phylopic(Rodentia, alpha = 1, x = 19, y = 45, ysize = 20, color = "black") +
  add_phylopic(Testudines, alpha = 1, x = 22, y = 30, ysize = 20, color = "black") +
  add_phylopic(Anura, alpha= 1, x= 2.8, y= 30, ysize=15, color= "black") + 
  add_phylopic(WhitetailedDeer, alpha= 1, x=4, y=30, ysize=20, color = "black")+
  ylab("Number of Observations") +
   ylim(0,180)+
  ggtitle("Chordates")+
  theme(plot.title= element_text(hjust = .5))
  
ggsave("Chordate_Orders.png", height= 5, width= 8, dpi = 400)

Passeriformes <-image_data("be358482-58c7-4ea8-a5ce-e3ef9f4d0db4", size = 64) [[1]]
Anseriforme <-image_data("b677ec7b-a2ef-46be-9d78-a997a88e1a9c", size= 64)[[1]]
Perciformes <-image_data("9c031447-a620-4b7d-98bb-25dd4133eda7", size= 64) [[1]]
Rodentia <-image_data("9303fc52-3da1-4d42-9e6d-665c21791df8", size= 64) [[1]]
Testudines <- image_data("1a6160a0-c1c0-456a-af04-43bb365b3e87", size= 64) [[1]]
Anura <- image_data("081b3539-a72e-40b3-9102-0e546fadf545", size= 64) [[1]]
WhitetailedDeer <- image_data("56f6fdb2-15d0-43b5-b13f-714f2cb0f5d0", size= 64)[[1]] 
