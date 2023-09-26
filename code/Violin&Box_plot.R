library(ggplot2)
library(grid)
library(RColorBrewer)
mydata<-read.csv("path/clinic_info_uricAcid.csv",stringsAsFactors=FALSE)
#mydata<-melt(mydata)

colnames(mydata)<-c("Class", "Value")
ggplot(mydata, aes(Class, Value))+ 
  geom_violin(aes(fill = Class),trim = FALSE)+
  geom_boxplot(width = 0.2,outlier.size = 1)+
  # stat_boxplot(geom ="errorbar",width=0.2)+
  # geom_jitter(position = position_jitter(0.05),size=0.01,color = "gray")+
  scale_fill_manual(values="#A1D99B")+

  theme_classic()+
  theme(panel.background=element_rect(fill="white",colour="black",size=0.25),
        # panel.grid.major = element_line(colour = "grey60",size=.25,linetype ="dotted" ),
        # panel.grid.minor = element_line(colour = "grey60",size=.25,linetype ="dotted" ),
        #text=element_text(size=15),
        #plot.title=element_text(size=15,family="myfont",hjust=.5),
        axis.line=element_line(colour="black",size=0.25),
        axis.title=element_text(size=13,face="plain",color="black"),
        axis.text = element_text(size=12,face="plain",color="black"),
        legend.position="none"
  )
