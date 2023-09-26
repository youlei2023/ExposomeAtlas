library(ggplot2)       
library(RColorBrewer)
library(reshape)
#-------------------------------stack bar plot-------------------------------------------------------
mydata<-read.csv("path/location_74_15provience.csv",sep=",",na.strings="NA",stringsAsFactors=FALSE)
# # mydata <- rawdata[1:16,]
# temp <- mydata[,2:ncol(mydata)]
rowsum<-sort(rowSums(mydata[,2:ncol(mydata)]),index.return=TRUE)

mydata$province <- factor(mydata$province, levels = c('GuiZhou','ShaanXi','YunNan','HeNan','ChongQing','GuangXi','China','BeiJing','HuBei','HuNan',
                                                    'HeiLongjiang','LiaoNing','ShanDong','ZheJiang','JiangSu','ShangHai'))
mydata<-melt(mydata,id.vars='province')

ggplot(data=mydata,aes(province,value,fill=variable))+
  geom_bar(stat="identity",position="stack", color="black", width=0.65,size=0.25)+
  #PCBs=#94CEC5;'Organophosphorus=#B3D474';'PAHs=#86B1CF';'OtherPesticides=#F6F6BA';'Organochlorine=#F5CFE0';'OtherPollutants=#F4B56C';'PFASs=#EC8479';'Drugs=#C1BFDB'
  scale_fill_manual(values=c('#94CEC5','#B3D474','#86B1CF','#F6F6BA','#F5CFE0','#F4B56C','#EC8479','#C1BFDB'))+
  coord_flip()+
  theme_bw()+
  theme(
    #text=element_text(size=15,face="plain",color="black"),
    axis.title=element_text(size=15,face="plain",color="black"),
    axis.text = element_text(size=12,face="plain",color="black"),
    legend.title=element_text(size=13,face="plain",color="black"),
    legend.position = "right"# c(0.83,0.15)
  )

