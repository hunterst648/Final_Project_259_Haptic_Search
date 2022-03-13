#> I am writing this script to assist my final project. I will ultimately want
#> to add code from this script into my rmarkdown for the final project. 
#> 

library(tidyverse)
library(DataExplorer)

ds <-  read_csv("Cleaning Data for Sharing/NVP_Clean_Data.csv")

# Count unique subject numbers 
Part_count <- length(unique(ds$Subject))

# get a simple scatter plot of search times. 

ggplot(ds, aes(x = Distractor_size, y = `Search_time(s)`)) + 
  geom_point() 
  
as.double(ds$Distractor_size)

# Get conditional means 
cond_mean <- ds %>%  group_by(Distractor_num, Distractor_size) %>% 
  summarise_at(vars(`Search_time(s)`), list(name = mean))

# Plot conditional means

ggplot(cond_mean, aes(x=Distractor_size, y= name))+ geom_line() + geom_point()
