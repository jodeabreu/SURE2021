library(rinat)
library(rgbif)
library(ggplot2)
library(dplyr)
library(rphylopic)
stonehill <- get_inat_obs(place_id=91152, maxresults = 4000)
head(stonehill) 
keys <- lapply(stonehill$scientific_name, function(x) name_backbone(name=x))
taxonomy <- bind_rows(keys)
stonehill_tax = bind_cols(stonehill, taxonomy)

 ggplot(stonehill_tax %>% filter(quality_grade != 'needs_id') %>% filter(phylum== "Arthropoda"))+
  geom_bar(aes(x=order)) +
  facet_wrap(~kingdom, scales='free_x') +
 theme(axis.text.x= element_text(angle=50, vjust= 1, hjust=1.2 )) +
 add_phylopic(Lepidoptera, alpha= 1, x=10, y=105, ysize=10, color = "black") +
add_phylopic(CommonEasternBumbleBee, alpha= 1, x=7, y=37, ysize=15, color = "black") +
add_phylopic(Odonata, alpha= 1, x=12, y=40, ysize=15, color = "black") +
add_phylopic(Diptera, alpha= 1, x=4, y=20, ysize=20, color = "black") + 
add_phylopic(Coleoptera, alpha= 1, x=3, y=30, ysize=20, color = "black")+
add_phylopic(Hemiptera, alpha= 1, x=6, y=20, ysize=15, color = "black")+  
   ylab("Number of Observations") + 
   ylim(0,110)
  ggtitle("Arthropods")+
  theme(plot.title= element_text(hjust = .5))

ggsave("Arthropod_Orders.png", height= 5, width= 8, dpi = 400)

Diptera <- image_data("f538aa99-5c08-4f96-97d9-2e094ef5d84f", size= 64) [[1]]
Lepidoptera <- image_data("c224abfd-ee39-4923-98e5-c2606dcc56cb", size= 64)[[1]]
CommonEasternBumbleBee <- image_data ("2bd1e8b6-d616-4c50-a352-7a6e61271c61", size= 64)[[1]]
Odonata <- image_data ("ce57b692-e1e0-468e-a025-8c10ceebca22", size = 64) [[1]]
Coleoptera <- image_data ("984448b7-2ada-4e49-aaf1-3dcb7b056532", size= 64) [[1]]
Hemiptera <- image_data ("408b5725-338f-48b6-b57f-2317797752cb", size= 64)[[1]]
