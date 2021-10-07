library(ggplot2)
library(tidyverse)

hfsData <- read.csv("HFS Service Data.csv")
hfsData <- hfsData %>% group_by(job_title) %>% summarise(total_time_spent = mean(total_duration_num))
ggplot(hfsData, aes(job_title, total_time_spent)) +
  ggtitle("Average total time spent by each job title") +
  xlab("Job Title") +
  ylab("Total Time Spent (minutes)") +
  geom_point() +
  geom_text(aes(label=round(total_time_spent, digits=2)), vjust=-1, color="Black", size=3)+
  scale_x_discrete(guide = guide_axis(angle = 90))
  
       