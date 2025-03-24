## A Meta-epidemiology study of the Diversity, Transparency and Accessibility of PRISMA and its Extensions: protocol

rm(list= ls())


## Load Packages
pacman::p_load(tidyverse,
               synthesisr,
               tidystringdist,
               bibliometrix,
               here)

# Load file with all searcges combined 
dat <-  read.csv(here("literature_search", "PRISMA_database_search.csv"), skip = 0)
dim(dat)

# Remove all punctuation
dat$title2 <- str_replace_all(dat$title,"[:punct:]","") %>% 
  str_replace_all(.,"[ ]+", " ") %>% 
  tolower()

# Remove exact titles
dat2 <- distinct(dat, title2, .keep_all = TRUE) 
dim(396) 


# Save file
write_csv(dat2, here("literature_search","PRISMA_database_search_deduplicated.csv"))


