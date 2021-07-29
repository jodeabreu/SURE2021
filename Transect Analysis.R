#install.packages("tidyverse/googlesheets4")
library(googlesheets4)
library(googledrive)
#URL
read_sheet("https://docs.google.com/spreadsheets/d/1sXHH3RDfTKkUuPrfB0o5VAX5_1jq8DCiG-znIFkmX58/edit#gid=0")
> #> # A tibble:108 x 6
sheet_properties("https://docs.google.com/spreadsheets/d/1sXHH3RDfTKkUuPrfB0o5VAX5_1jq8DCiG-znIFkmX58/edit#gid=0")
ggplot
Transect.Data <- read_sheet("https://docs.google.com/spreadsheets/d/1sXHH3RDfTKkUuPrfB0o5VAX5_1jq8DCiG-znIFkmX58/edit#gid=0")

Transect.Analysis= ggplot(Transect.Data)+
  theme_light()+
  geom_col(aes(x= ScientificName, y= CarbonContentinTons)) +
  theme(axis.text.x= element_text(angle=45, vjust= 1.1, hjust=1.1 )) +
  ylab("Carbon Content in Tons")+ 
  facet_wrap(~Transect, scales='free_x')
ggsave("Transect.Analysis.png", height= 5, width= 8, dpi = 400)


head(Transect.Data)
 
Transect.Data %>% group_by(Transect) %>% summarize(totalCarbon= sum(CarbonContentinTons))
         
         
         