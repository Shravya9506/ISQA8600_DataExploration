library(ggplot2)
library(tidyverse)

#Reading the HFS Data as csv into a variable
hfsData <- read.csv("HFS Service Data.csv")

#Grouping the HFS data by 'recordID' first and then by 'program_name' and finally calculating the mean of ages
hfsData <- hfsData %>% group_by(recordID) %>% group_by(program_name) %>% summarise(age = mean(age))

#Generating a Scatter Plot
ggplot(hfsData, aes(program_name, age)) + 
  ggtitle("Average ages of clients enrolled into programs") + 
  xlab("Program Name") + 
  ylab("Age") +
  geom_text(aes(label=round(age)), vjust=-1, color="Black", size=3)+
  geom_point()