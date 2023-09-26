# summarySE to calculate mean, SD, SE, CI
library(Rmisc)
library(ggplot2)
library(ggtext)
library(ggbreak)
df2 <- openxlsx::read.xlsx("path/age_increase.xlsx")

# combine '70_80'&'80_91' to '70_91'
df2$Age <- replace(df2$Age,which(df2$Age=='70_80'),'70_91')
df2$Age <- replace(df2$Age,which(df2$Age=='80_91'),'70_91')

tgc <- summarySE(df2, measurevar="Concentration", groupvars=c("Exposures","Age"))
ggplot(tgc, aes(x=Age, y=Concentration, colour=Exposures, group=Exposures)) + 
  geom_errorbar(aes(ymin=Concentration-se, ymax=Concentration+se), width=.2,size=1) +
  geom_line(size=1) +
  geom_point(size=3)+
  scale_y_continuous(limits = c(-0.5,1.1),breaks = c(-0.5,-0.25,0,0.25,0.5,0.5,0.75,1))+
  # scale_y_break(c(0.25, 1.0))+
  # scale_y_log10()+
  theme_classic()+
  theme(axis.text.x=element_text(size=12,angle = 45,hjust =1),
        axis.text.y=element_text(size=12),
        legend.text = element_markdown(size = 15),
    legend.position = "top")
