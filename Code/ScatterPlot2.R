library(ggplot2)
library(tidyverse)

#Reading the HFS Data as csv into a variable
hfsData <- read.csv("HFS Service Data.csv")

#Grouping the HFS data by 'job_title' and finally calculating the mean of 'total_duration_num'
hfsData <- hfsData %>% group_by(job_title) %>% summarise(total_time_spent = mean(total_duration_num))

#Generating a Scatter Plot
ggplot(hfsData, aes(job_title, total_time_spent)) +
  ggtitle("Average total time spent by each job title") +
  xlab("Job Title") +
  ylab("Total Time Spent (minutes)") +
  geom_point() +
  geom_text(aes(label=round(total_time_spent, digits=2)), vjust=-1, color="Black", size=3)+
  scale_x_discrete(guide = guide_axis(angle = 90))
  
       