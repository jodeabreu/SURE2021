#install.packages("patchwork")
library(patchwork)
library(rphylopic)
library(rinat)
library(rgbif)
library(ggplot2)
library(dplyr)
stonehill <- get_inat_obs(place_id=91152, maxresults = 4000)
head(stonehill)
keys <- lapply(stonehill$scientific_name, function(x) name_backbone(name=x))
taxonomy <- bind_rows(keys)
stonehill_tax = bind_cols(stonehill, taxonomy)


#put together with patchwork
#finalplot = animal_phylums/Fungus_phylums

Fungus_phylums= ggplot(stonehill_tax %>% filter(kingdom=="Fungi")) +
  geom_bar(aes(x=phylum, fill=phylum)) +
  facet_wrap(~kingdom, scales='free_x') + 
  theme_light()+
  theme(axis.text.x= element_text(angle=50, vjust= 1, hjust=1.2 )) +
add_phylopic(Ascomycota, alpha = 1, x = 1, y = 150, ysize = 125, color = "orange") +
add_phylopic(Basidomycota, alpha = 1, x = 2, y = 150, ysize = 160, color = "red") +
  ylim(0,1000) +
  ylab("") +
  ggtitle("Observation by Phylum")+
  theme(plot.title= element_text(hjust = .5))+
  scale_fill_manual(values = c("orange", "red"))+
  theme(legend.position='none')

Animal_phylums= ggplot(stonehill_tax %>% filter(kingdom=="Animalia")) +
  geom_bar(aes(x=phylum, fill=phylum)) +
  facet_wrap(~kingdom, scales='free_x') + 
  theme_light()+ 
  theme(axis.text.x= element_text(angle=50, vjust= 1, hjust=1.2 )) +
  add_phylopic(Arthropods, alpha = 1, x = 1.9, y = 401, ysize = 80, color = "yellow") + 
  add_phylopic(Chordata, alpha = 1, x = 3, y = 550, ysize = 35, color = "red") +
  add_phylopic(Mollusca, alpha = 1, x = 4, y = 120, ysize = 75, color = "blue") +
  add_phylopic(Annelida, alpha = 1, x = 1, y = 120, ysize = 120, color = "pink") +
  ylim(0,1000) +
  ylab("Number of Observations") +
  scale_fill_manual(values = c("pink", "yellow", "red", "blue"))+
  theme(legend.position='none')

Plant_phylums= ggplot(stonehill_tax %>% filter(kingdom=="Plantae")) +
  geom_bar(aes(x=phylum, fill=phylum)) +
  scale_fill_manual(values = c("green4", "green"))+
  facet_wrap(~kingdom, scales='free_x') + 
  theme_light()+
  theme(axis.text.x= element_text(angle=50, vjust= 1, hjust=1.2 )) +
  add_phylopic(Bryophyta, alpha = 1, x = 1, y = 200, ysize = 130, color = "green4") +
  add_phylopic(Tracheophyta, alpha = 1, x = 2, y = 880, ysize = 130, color = "green") +
  theme(legend.position='none') +
  ylim(0,1000) +
  ylab("") 
  
  

finalplot = Animal_phylums+Fungus_phylums+Plant_phylums 
finalplot

ggsave("Animal_Fungi_Plant.png", finalplot, height= 5, width= 8, dpi = 400)


Ascomycota <-image_data("a21310f5-2762-495d-b996-bc0bef7203fd", size= 64)[[1]] 
Basidomycota <-image_data("f72ec90f-d008-4908-a7e6-582e04814f95", size= 64)[[1]]
Bryophyta <- image_data("4054a966-b5e1-425d-924e-352593ff9a1d", size= 64)[[1]]
Tracheophyta <- image_data("cbc7382f-cfee-40c5-af05-c528d8e94193", size= 64)[[1]]
Arthropods <-image_data ("99364664-e1d2-4963-942b-b9222de80867", size= 64)[[1]] 
Chordata <-image_data ("aa9d2eb5-d86b-4fe5-adee-99056db1d8d8", size= 64)[[1]]
Mollusca <-image_data("ebf8143a-5bba-4d0f-9897-e8e752d11e37", size= 64)[[1]]
Annelida <- image_data("c1fd59b3-bc5b-4d26-a37a-8ee5770a5286", size= 64)[[1]]

stonehill_tax %>% 
  filter(kingdom=="Plantae") %>%
  group_by(phylum) %>%
  summarise(count=n()) %>%
  arrange(desc(count))

