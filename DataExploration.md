# Data Exploration

## Table Of Contents
* [Scatter Plots](#scatter-plots)
* [Facet Grid](#facet-grid)
* [Bar Chart](#bar-chart)

## Scatter Plots

#### Scatter Plot 1 : Data Anomalies for Gender and Gender identity

<h1 align="center">
  <br>
  <img src="https://github.com/Shravya9506/ISQA8600_DataExploration/blob/main/Plots/ScatterPlot1.png" alt="Scatter Plot 1 image">
  <br>
</h1>

Below is the code to generate the above scatter plot

```r
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
```

**_Observation:_** I plotted this understand if there are any data anomolies with the columns 'gender' and 'gender_identity'. It was interesting to note that some data records which had gender = Female had gender_identity = Male and vice-verse. I think this information will be useful for data cleaning. 

#### Scatter Plot 2 : Average total time spent by each job title

<h1 align="center">
  <br>
  <img src="https://github.com/Shravya9506/ISQA8600_DataExploration/blob/main/Plots/ScatterPlot2.png" alt="Scatter Plot 2 image">
  <br>
</h1>

Below is the code to generate the above scatter plot

```r
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
  
       
```

**_Observation:_** This plot gives a gist of the average time spent by each job title towards all the events of Heartland Family Services. From the plot, it is evident that some of the job titles have zero duration spent. For one of our team's research question, these job titles can be eliminated from the analysis.

#### Scatter Plot 3 : Average ages of clients enrolled into programs

<h1 align="center">
  <br>
  <img src="https://github.com/Shravya9506/ISQA8600_DataExploration/blob/main/Plots/ScatterPlot3.png" alt="Scatter Plot 3 image">
  <br>
</h1>

Below is the code to generate the above scatter plot

```r
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
```

**_Observation:_** I hope this plot will help our team with one of our research question where we wanted to find the demographics of the HFS programs based on age, race and gender. So this plot already helps us understand the averages of clients being enrolled into the program. 


## Facet Grid

<h1 align="center">
  <br>
  <img src="https://github.com/Shravya9506/ISQA8600_DataExploration/blob/main/Plots/FacetGrid.png" alt="Scatter Plot 3 image">
  <br>
</h1>

Below is the code to generate the above facet grid

```r
#Loading required libraries
library(ggplot2)

#Reading the HFS Data as csv into a variable
hfsData <- read.csv("HFS Service Data.csv")

#Generating a Facet Grid
ggplot(hfsData, aes(program_name, gender_identity)) + 
  ggtitle("Distribution of various gender identities by State across the Programs") +
  xlab("Program Name") + 
  ylab("Gender Identity") +
  geom_point() + 
  facet_grid(rows = vars(state))
```

**_Observation:_** As per the introduction of the Heartland Family Service, my understanding was that their primary locations of operation where Nebraska and Iowa. But it was interesting to find that they have clients from Colorado, North Carolina and South Carolina. So, I feel it would be really helpful in understanding the main reason for why they have clients from other locations and if these records are data anomalies then they can be eliminated.


## Bar Chart

<h1 align="center">
  <br>
  <img src="https://github.com/Shravya9506/ISQA8600_DataExploration/blob/main/Plots/BarChart.png" alt="Scatter Plot 3 image">
  <br>
</h1>

Below is the code to generate the above bar chart

```r
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
```

**_Observation:_** Events at HFS either have encounters with clients or others. The HFS service data has two columns 'encounter_with' and 'is_client_involved' to determine whether the client was invovled in the encounter or not. However, it was interesting to know that there were some data inconsistencies with these two columns. There were 23 records where 'encounter_with' was 'CLient' yet 'is_client_involved' was False. This may be useful in data cleaning.
