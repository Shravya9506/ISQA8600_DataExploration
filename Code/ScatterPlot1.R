#Loading required libraries
library(ggplot2)

#Reading the HFS Data as csv into a variable
hfsData <- read.csv("HFS Service Data.csv")

#Generating a Scatter Plot
ggplot(hfsData, aes(gender, gender_identity)) + 
  ggtitle("Data Anomalies for Gender and Gender identity") + 
  xlab("Gender") + 
  ylab("Gender Identity") +
  geom_point()