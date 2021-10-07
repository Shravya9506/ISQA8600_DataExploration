library(ggplot2)
library(tidyverse)

hfsData <- read.csv("HFS Service Data.csv")
hfsFilteredData <- hfsData %>% filter(hfsData$encounter_with == "Client")
hfsBarData <- as.data.frame(table(hfsFilteredData$is_client_involved)) 

ggplot(hfsBarData, aes(x=hfsBarData$Var1, y=hfsBarData$Freq)) +
  ggtitle("Inconsistencies in client encountered records and client involved records")+
  xlab("Is Client Involved") + 
  ylab("Number of Records")+ 
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=Freq), vjust=1.6, color="white", size=3.5)+
  theme_minimal()

