library(ggplot2)
library(RColorBrewer)
library(reshape2)

mydata<-read.csv("path/9clinicinfo.csv",sep=",",na.strings="NA",stringsAsFactors=FALSE)
mydata$clinic_info <- factor(mydata$clinic_info, levels = c('uricAcid','HbA1c','waistline','BMI','DBP','SBP','TC','TG','LDLC'))
mydata<-melt(mydata,id.vars='clinic_info')

# 'uricAcid'="#F681BE",'HbA1c'="#FED932",'LDLC'="#DE2D26",'TG'="#FB6A4A",'TC'="#FCAE91",'SBP'="#6BAED6",'DBP'="#BDD7E7",'waistline'="#A1D99B",'BMI'="#31A354",hypertension="#2171B5",hyperlipidemia="#A50F15",metabolicSyndrome="#984EA3"
ggplot(data=mydata,aes(variable,value,fill=clinic_info))+
  geom_bar(stat="identity",position="stack", color="black", width=0.7,size=0.25)+
  scale_fill_manual(values=c("#F681BE","#FED932","#A1D99B","#31A354","#BDD7E7","#6BAED6","#FCAE91","#FB6A4A","#DE2D26"))+

  # ylim(-9, 9)+  
  scale_y_continuous(breaks=seq(-5,9,1))+
  theme_bw()+

  theme(
    axis.title=element_text(size=10,face="plain",color="black"),
    axis.text = element_text(size=10,face="plain",color="black",angle = 90),
    legend.title=element_text(size=10,face="plain",color="black"),
    legend.background  =element_blank(),
    legend.position = "right"
  )+
  labs(x = "",y = "Number of associated diseases by direction")

