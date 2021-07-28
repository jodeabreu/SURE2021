phylum_sp_summ <- stonehill_tax %>% 
  filter(quality_grade != 'needs_id') %>%
  filter(!is.na(phylum)) %>%
  group_by(phylum, scientific_name) %>% 
  slice(1) %>%
  group_by(phylum) %>%
  summarize(count=n())

species.richness<- ggplot(phylum_sp_summ) +
  geom_col(aes(x=phylum, y=count))+
  theme_light()+
theme(axis.text.x= element_text(angle=50, vjust= 1, hjust=1.2 ))+
 ylab("Number of Species") +
  add_phylopic(Bryophyta, alpha = 1, x = 4, y = 25, ysize = 35, color = "green4")+
  add_phylopic(Ascomycota, alpha = 1, x = 2, y = 25, ysize = 30, color = "orange")+
add_phylopic(Basidomycota, alpha = 1, x = 3, y = 25, ysize = 35, color = "red")+
  add_phylopic(Tracheophyta, alpha = 1, x = 7, y = 170, ysize = 35, color = "green")+
  add_phylopic(Arthropods, alpha = 1, x = 1, y = 140, ysize = 25, color = "yellow")+
  add_phylopic(Chordata, alpha = 1, x = 5, y = 105, ysize = 10, color = "red")+
  add_phylopic(Mollusca, alpha = 1, x = 6, y = 25, ysize = 25, color = "blue")+ 
  ylim(0,180) +
  ggtitle("Species Richness")+
  theme(plot.title= element_text(hjust = .5))
species.richness

print(phylum_sp_summ)

Ascomycota <-image_data("a21310f5-2762-495d-b996-bc0bef7203fd", size= 64)[[1]] 
Basidomycota <-image_data("f72ec90f-d008-4908-a7e6-582e04814f95", size= 64)[[1]]
Bryophyta <- image_data("4054a966-b5e1-425d-924e-352593ff9a1d", size= 64)[[1]]
Tracheophyta <- image_data("cbc7382f-cfee-40c5-af05-c528d8e94193", size= 64)[[1]]
Arthropods <-image_data ("99364664-e1d2-4963-942b-b9222de80867", size= 64)[[1]] 
Chordata <-image_data ("aa9d2eb5-d86b-4fe5-adee-99056db1d8d8", size= 64)[[1]]
Mollusca <-image_data("ebf8143a-5bba-4d0f-9897-e8e752d11e37", size= 64)[[1]]

