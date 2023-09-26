library(ggplot2)
library(ggtext)
# library(RColorBrewer)
df <- read.csv('path/Variation_Proportion.csv')

ggplot(df, aes(x = epidemiologicalFactors, y = variationProportions, fill = epidemiologicalFactors, group = factor(1))) + 
  geom_bar(position = position_dodge(),stat = "identity",width = 0.75) +
  scale_fill_manual(values=rep('#63A0CB',9))+
  theme_bw()+
  geom_text(aes(label=variationProportions, y=variationProportions+0.01), vjust=0,size=2.5)+
  theme(axis.text.x=element_text(size=8,hjust =1,angle = 45),
        axis.text.y=element_text(size=8),
        legend.text = element_markdown(size = 8),
        legend.position = "",
        panel.grid.major =  element_line(colour=NA),
        panel.background = element_rect(fill="transparent",colour=NA),
        plot.background = element_rect(fill="transparent",colour=NA),
        panel.grid.minor = element_blank(),
  )

