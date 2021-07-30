#install.packages("tidyverse/googlesheets4")
library(googlesheets4)
library(googledrive)
#URL
read_sheet("https://docs.google.com/spreadsheets/d/1sXHH3RDfTKkUuPrfB0o5VAX5_1jq8DCiG-znIFkmX58/edit#gid=0")
> #> # A tibble:108 x 6
  sheet_properties("https://docs.google.com/spreadsheets/d/1sXHH3RDfTKkUuPrfB0o5VAX5_1jq8DCiG-znIFkmX58/edit#gid=0")
ggplot
Transect.Data <- read_sheet("https://docs.google.com/spreadsheets/d/1sXHH3RDfTKkUuPrfB0o5VAX5_1jq8DCiG-znIFkmX58/edit#gid=0")

Number.of.Trees= ggplot(Transect.Data)+
  theme_light()+
  ggtitle("Number of Trees Observed")+
  theme(plot.title= element_text(hjust = .5))+
  geom_bar(aes(x= ScientificName))+
  facet_wrap(~Transect, scales='free_x')+
  theme(axis.text.x= element_text(angle=45, vjust= 1.1, hjust=1.1 ))

 Transect.Data %>% group_by(Transect, ScientificName) %>% summarize(counts= n()) %>% print(n=42)
 

ggsave("Number.of.Trees.png", Transect.Population, height= 9, width= 6, dpi = 400)




