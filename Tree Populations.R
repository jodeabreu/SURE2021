#install.packages("tidyverse/googlesheets4")
library(googlesheets4)
library(googledrive)
#URL
read_sheet("https://docs.google.com/spreadsheets/d/1sXHH3RDfTKkUuPrfB0o5VAX5_1jq8DCiG-znIFkmX58/edit#gid=0")
> #> # A tibble:108 x 6
  sheet_properties("https://docs.google.com/spreadsheets/d/1sXHH3RDfTKkUuPrfB0o5VAX5_1jq8DCiG-znIFkmX58/edit#gid=0")
ggplot
Transect.Data <- read_sheet("https://docs.google.com/spreadsheets/d/1sXHH3RDfTKkUuPrfB0o5VAX5_1jq8DCiG-znIFkmX58/edit#gid=0")
ggplot(Transect.Data)+
geom_bar(aes(x= ScientificName))+
theme(axis.text.x= element_text(angle=45, vjust= 1.1, hjust=1.1 )) +
ggtitle("Number of Trees Observed")+
 theme(plot.title= element_text(hjust = .5))
  
  
ggsave("Transect.Analysis.png", height= 5, width= 8, dpi = 400)

