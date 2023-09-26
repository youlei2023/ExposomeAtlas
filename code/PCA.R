library(ggplot2)
library(factoextra)
library(FactoMineR)
library(ggfortify)
#-----------------------------------------------------------Method 1-----------------------------------------------------------

mydata <- openxlsx::read.xlsx("path/PCA.xlsx")
df <- mydata[c(2:5)]

autoplot(prcomp(df), data = mydata, 
         shape=21,colour ="group",fill= 'group', size=0.75,
         frame = TRUE,frame.type = 'norm', frame.colour = 'group')+
theme_bw()

##-----------------------------------------------------------Method 2-----------------------------------------------------------

mydata <- openxlsx::read.xlsx("path/PCA.xlsx")
df <- mydata[c(2:5)]

mydata.pca<- PCA(df, graph = FALSE)

fviz_pca_ind(mydata.pca,
             geom.ind = "point", # show points only (nbut not "text")
             pointsize =2,pointshape = 21,fill.ind = mydata$group, # color by groups
             palette = c( '#FFB6C1',"#00AFBB", "#E7B800",'#440154FF','#404688FF','#287C8EFF','#26AD81FF', "#B2182B", "#D6604D", "#F4A582", "#FDDBC7", "#D1E5F0", "#92C5DE", "#4393C3", "#2166AC"),
             addEllipses = TRUE, # Concentration ellipses
             legend.title = "Groups",
             title="")+
  theme_grey() +
  theme(
    text=element_text(size=12,face="plain",color="black"),
    axis.title=element_text(size=11,face="plain",color="black"),
    axis.text = element_text(size=10,face="plain",color="black"),
    legend.title = element_text(size=11,face="plain",color="black"),
    legend.text = element_text(size=11,face="plain",color="black"),
    legend.background = element_blank(),
    legend.position=c(0.88,0.15)
  )