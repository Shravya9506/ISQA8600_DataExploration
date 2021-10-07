library(ggplot2)
library(tidyverse)

hfsData <- read.csv("HFS Service Data.csv")
hfsData <- hfsData %>% group_by(recordID) %>% group_by(program_name) %>% summarise(age = mean(age))
ggplot(hfsData, aes(program_name, age)) + 
  ggtitle("Average ages of clients enrolled into programs") + 
  xlab("Program Name") + 
  ylab("Age") +
  geom_text(aes(label=round(age)), vjust=-1, color="Black", size=3)+
  geom_point()