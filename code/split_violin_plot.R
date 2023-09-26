# library(devtools)
# devtools::install_github("psyteachr/introdataviz")
library(tidyverse)
library(ggpubr)
library(ggsci)
library(introdataviz)

df <- openxlsx::read.xlsx('path/gender_beta.HCH.xlsx')

colnames(df)
# [1] "Concentration"     "Exposures"  "Gender"   "sample"  "dataset" 

# plot
ggplot(df,aes(x = Exposures,y = Concentration,fill = Gender)) +
  # split violin
  geom_split_violin(alpha = .5, trim = F,color = NA,width = 1) +
  # mean point
  stat_summary(fun = "mean", geom = "point",position = position_dodge(0.2)) +
  # errorbar
  stat_summary(fun.data = "mean_sd", geom = "errorbar", width = .15,
               size = 0.3,
               position = position_dodge(0.2)) +
  theme_bw(base_size = 16) +
  theme(axis.text.x = element_text(angle = 0,color = 'black',hjust = 0.5),
        legend.position = 'top') +
  # scale_fill_brewer(palette = 'Set1') +
  scale_fill_jco(name = '') +
  scale_y_log10(limit = c(0.001,1000), breaks = c(0.001,0.01,0.1, 1,10,100,1000),labels = c(0.001,0.01,0.1, 1,10,100,1000))
  # # sig. lable
  # stat_compare_means(aes(group=Gender),
  #                    symnum.args=list(cutpoints = c(0, 0.001, 0.01, 0.05, 1),
  #                                     symbols = c("***", "**", "*", "NS")),label = "p.signif",
  #                    label.y = 7,size = 5)