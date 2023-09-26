library("vegan")
library("dplyr")
# setwd()
my_Mn <- read.csv(file = "path/M_n.csv")  # variables data
my_Mf <- read.csv(file = "path/M_f3.csv") # Epidemical factors
my_Mf$Location <- as.factor(my_Mf$Location)
my_Mf$Samplingtime <- as.factor(my_Mf$Samplingtime)
my_Mf$Sex <- as.factor(my_Mf$Sex)
my_Mf$Drinking <- as.factor(my_Mf$Drinking)
my_Mf$Education <- as.factor(my_Mf$Education)
my_Mf$Marriage <- as.factor(my_Mf$Marriage)
my_Mf$Smoking <- as.factor(my_Mf$Smoking)

sink("path/result.txt", append=TRUE)
rda_full <- rda(my_Mn~., data = my_Mf)
rda_null <- rda(my_Mn~1, data = my_Mf)
rda_back <- ordistep(rda_full, direction = 'backward',trace = 0)
rda_frwd <- ordistep(rda_null, formula(rda_full), direction = 'forward',trace = 0)
rda_both <- ordistep(rda_null, formula(rda_full), direction = 'both',trace = 0)
rda_back
rda_frwd
rda_both
df_Age <- my_Mf %>% select(Age)
df_Income <- my_Mf %>% select(Income)
df_Location <- my_Mf %>% select(Location)
df_Samplingtime <- my_Mf %>% select(Samplingtime)
df_Sex <- my_Mf %>% select(Sex)
df_Drinking <- my_Mf %>% select(Drinking)
df_Education <- my_Mf %>% select(Education)
df_Marriage <- my_Mf %>% select(Marriage)
df_Smoking <- my_Mf %>% select(Smoking)

## # calculate "Adj.R.square"
# vpt <- varpart(my_Mn, df_Age,df_Income,df_Location) # calculate "Adj.R.square" for Age, Income, and Location 
# vpt <- varpart(my_Mn,df_Samplingtime,df_Sex,df_Drinking) # calculate "Adj.R.square" for Samplingtime, Sex and Drinking
vpt <- varpart(my_Mn, df_Education,df_Marriage,df_Smoking) # calculate "Adj.R.square" for Education, Marriage and Smoking
# vpt <- varpart(my_Mn, df_Age,df_Income,df_Location,df_Samplingtime,df_Sex,df_Drinking,df_Education,df_Marriage,df_Smoking)
vpt
sink()
plot(
  vpt,
  bg = 2:5,
  id.size = 1.1,
  cex = 1.2,
  Xnames = c('Education', 'Marriage','Smoking')
)
title('Variation partitioning by varpart from clinical information1')
sink("path/result.txt", append=TRUE)

