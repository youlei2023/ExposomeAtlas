rm(list=ls())
library(openxlsx)
WQS <- openxlsx::read.xlsx("path/hyperuricemia_mixture_effect.xlsx")
toxic_chems <- names(WQS)[11:ncol(WQS)]
library(gWQS)
WQS$group <- as.factor(WQS$group) 
WQS$gender <- as.factor(WQS$gender)
WQS$age <- as.numeric(WQS$age)
WQS$smoking <- as.factor(WQS$smoking)
WQS$drinking <- as.factor(WQS$drinking)
WQS$location <- as.factor(WQS$location)
# WQS$maritalStatus <- as.factor(WQS$maritalStatus)
# WQS$education <- as.factor(WQS$education)
# WQS$samplingMonth <- as.factor(WQS$samplingMonth)
# WQS$income <- as.numeric(WQS$income)
# gender+maritalStatus+education+smoking+drinking+Provinces+age+income

set.seed(123)
results <- gwqs(group ~ wqs+gender+age+smoking+drinking+location, mix_name = toxic_chems,
                data =WQS, q = 4, validation = 0.6, b = 1000, # Number of bootstrap samples used in parameter estimation
                b1_pos = TRUE, b1_constr = FALSE, family = "binomial",
                seed = 2016, plots = TRUE, tables = TRUE)
toxic_chems
gwqs_barplot(results)
summary(results)
gwqs_summary_tab(results)
gwqs_scatterplot(results)

# 条形图
library(ggplot2)       
library(RColorBrewer)
mydata <- results$final_weights
mydata$mix_name <- factor(mydata$mix_name, levels = mydata$mix_name[order(mydata$mean_weight)])

ggplot(data=mydata[1:15,],aes(mix_name,mean_weight))+
  geom_bar(stat="identity", color="black", width=0.6,fill="#FED976",size=0.25) + 
  
  scale_fill_manual(values=brewer.pal(9,"YlOrRd")[c(6:2)])+
  geom_hline(yintercept = 0.02857,linetype = "dashed", colour = "red")+
  coord_flip()+
  theme_bw()+
  scale_y_continuous(breaks = c(0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65))
  # scale_y_continuous(breaks = c(0.05,0.1,0.15,0.2,0.25),limits = c(0,0.25))
 theme(
  axis.title=element_text(size=15,face="plain",color="black"),
  axis.text = element_text(size=12,face="plain",color="black"),
  legend.title=element_text(size=13,face="plain",color="black"),
  legend.position = "right" # c(0.83,0.15)
)
write.csv(mydata,"path/hyperuricemia_WQS_pos_weight.csv")
