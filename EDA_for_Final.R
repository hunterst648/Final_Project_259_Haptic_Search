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
cond_mean %>% group_by(Distractor_num)
ggplot(cond_mean, aes(x=Distractor_size, y= name, color = Distractor_num))+
  geom_line(aes(group = Distractor_num)) + geom_point()


# now with accuracy?

cond_meanA <- ds %>%  group_by(Distractor_num, Distractor_size) %>% 
  summarise_at(vars(Accuracy), list(name = mean))

cond_meanA %>% group_by(Distractor_num)
ggplot(cond_meanA, aes(x=Distractor_size, y= name, color = Distractor_num))+
  geom_line(aes(group = Distractor_num)) + geom_point()

Haptic_plots <- function(ds,DV){
  dep_var <- DV
  if (dep_var == 1) {
    cond_meanA <- ds %>%  group_by(Distractor_num, Distractor_size) %>% 
    summarise_at(vars(Accuracy), list(name = mean))
    cond_meanA %>% group_by(Distractor_num)
  
    p2 <-  ggplot(cond_meanA, aes(x=Distractor_size, y= name, color = Distractor_num))+
    geom_line(aes(group = Distractor_num)) + geom_point()
  return(p2)
  }
  else {
    cond_mean <- ds %>%  group_by(Distractor_num, Distractor_size) %>% 
    summarise_at(vars(`Search_time(s)`), list(name = mean))
  
    cond_mean %>% group_by(Distractor_num)
  
    p1 <-  ggplot(cond_mean, aes(x=Distractor_size, y= name, color = Distractor_num))+
    geom_line(aes(group = Distractor_num)) + geom_point()
  
  return(p1)
  }
}

Haptic_plots(ds,1)
Haptic_plots(ds,2)

# Try again 


Haptic_plots <- function(ds){
 
    cond_meanA <- ds %>%  group_by(Distractor_num, Distractor_size) %>% 
      summarise_at(vars(Accuracy), list(name = mean))
    cond_meanA %>% group_by(Distractor_num)
    
    p2 <-  ggplot(cond_meanA, aes(x=Distractor_size, y= name, color = Distractor_num))+
      geom_line(aes(group = Distractor_num)) + geom_point()
    return(p2)
    
}
Haptic_plots(ds)
