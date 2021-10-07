library(ggplot2)

hfsData <- read.csv("HFS Service Data.csv")
ggplot(hfsData, aes(program_name, gender_identity)) + 
  ggtitle("Distribution of various gender identities by State across the Programs") +
  xlab("Program Name") + 
  ylab("Gender Identity") +
  geom_point() + 
  facet_grid(rows = vars(state))


  