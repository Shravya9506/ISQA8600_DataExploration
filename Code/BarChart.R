#Loading required libraries
library(ggplot2)
library(tidyverse)


#Reading the HFS Data as csv into a variable
hfsData <- read.csv("HFS Service Data.csv")

#Filtering the HFS data where 'encounter_with' column value is 'Client'
hfsFilteredData <- hfsData %>% filter(hfsData$encounter_with == "Client")

#Converting the HFS filtered data table to a data frame
hfsBarData <- as.data.frame(table(hfsFilteredData$is_client_involved)) 

#Generating a Bar Chart 
ggplot(hfsBarData, aes(x=hfsBarData$Var1, y=hfsBarData$Freq)) +
  ggtitle("Inconsistencies in client encountered records and client involved records")+
  xlab("Is Client Involved") + 
  ylab("Number of Records")+ 
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=Freq), vjust=1.6, color="white", size=3.5)+
  theme_minimal()

