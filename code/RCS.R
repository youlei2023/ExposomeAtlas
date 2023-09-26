rm(list = ls())

library(ggplot2)
library(rms) 

rawdata <- openxlsx::read.xlsx('path/hyperuricemia_RCS.xlsx')
colnames(rawdata)[1:ncol(rawdata)]
# for (ithcol in 18:ncol(rawdata)) {
  ithcol=11   # cycle each exposure, such as 'PCP' is in 11th column
  data <- rawdata
  data$hyperuricemia <- as.factor(data$hyperuricemia)
  data[,ithcol] <- as.numeric(data[,ithcol])
  data$age <- as.numeric(data$age)
  data$income <- as.numeric(data$income)
  data$gender <- as.factor(data$gender)
  data$maritalStatus <- as.factor(data$maritalStatus)
  data$education <- as.factor(data$education)
  data$smoking <- as.factor(data$smoking)
  data$drinking <- as.factor(data$drinking)
  data$location <- as.factor(data$location)
  data$samplingTime <- as.factor(data$samplingTime)
  
  data[,ncol(data)+1] <- data[,ithcol]
  colnames(data)[ncol(data)] <- "exposure"
  dd <- datadist(data) 
  options(datadist='dd')
  
  # fit logistic
  model<-lrm(hyperuricemia~rcs(exposure,4)+age+income+gender+maritalStatus+education+smoking+drinking+location,
             data=data,x=TRUE,y=TRUE)  
  
  # an <- anova(model)
  # p <- round(anova(model)[,3],3) # p-non-linear 
  # plot(Predict(model, exposure, fun=exp),anova=an,pval=T)  
  
  OR<-Predict(model, exposure, fun=exp,type = "predictions", ref.zero = TRUE,np = 200)
  
  dd$limits$exposure[2] <- OR$exposure[which.min(abs(OR$yhat - 1))] # OR = 1, reference point
  model=update(model)
  OR<-Predict(model, exposure, fun=exp,type = "predictions", ref.zero = TRUE,np = 200)
 
  # plot
  ggplot(data = OR, aes(exposure,yhat)) +
    theme_bw()+
    geom_hline(yintercept =1,linetype = "dashed", colour = "orange",linewidth = 1)+
    # scale_x_continuous(breaks = c(-1,0))+
    labs(x = colnames(data)[ithcol] ,y = "OR")
  # geom_rug()
  # geom_line(colour="blue",size=1)
  # geom_point(fill="blue",colour="blue",size=2,shape=21)
  
  # fig1<-ggplot(OR)
  # fig1 
# }

