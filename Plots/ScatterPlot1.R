library(ggplot2)

hfsData <- read.csv("HFS Service Data.csv")
ggplot(hfsData, aes(gender, gender_identity)) + 
  ggtitle("Data Anomalies for Gender and Gender identity") + 
  xlab("Gender") + 
  ylab("Gender Identity") +
  geom_point()