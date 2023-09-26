
##------------------------------------ggplot2_forestplot-----------------------------
library(ggbreak)
rm(list = ls())
forest_data <- read.csv("path/hyperlipidemia_OR.csv",encoding='UTF-8')
library(ggplot2)
library(scales)
library(ggstatsplot)
library(viridis)

OR <- forest_data$OR
CI_LL  <- forest_data$LowCI
CI_HL <-forest_data$HighCI

ggplot(data=forest_data,
       aes(x=OR,
           y=reorder(exposures,rev(order)),color=Pvalue))+ 
  geom_errorbarh(aes(xmax=CI_HL, xmin=CI_LL),
                 color="skyblue",height=0.5,linewidth=1)+
  geom_point(aes(x=OR,y=reorder(exposures,rev(order))),size=2,shape=18)+ 
  geom_vline(xintercept = 1,linetype='dashed',size=0.75, color = "gray")+ 
  
  scale_x_continuous(limits = c(0,6),breaks = c(0,1,2,3,6))+
  scale_color_viridis(limits=c(0,0.05))+ylab('')+
 
   scale_x_break(c(3.5, 5.5))+
  theme_classic()

  # theme_bw()+
  # theme(panel.grid.major=element_line(colour=NA),
  #       panel.background = element_rect(fill = "transparent",colour = NA),
  #       plot.background = element_rect(fill = "transparent",colour = NA),
  #       panel.grid.minor = element_blank())


