# An exposome atlas of Chinese population serum reveals risk of chronic diseases

## Abstract
Although adverse environmental exposures are considered to be a major cause to chronic diseases, current studies have provided limited knowledge on real-world chemical exposures and related risks. Here, we collected serum samples from 5696 healthy people and patients, including 12 chronic diseases in China, and completed serum biomonitoring containing 267 chemicals using gas and liquid chromatography-tandem mass spectrometry. 74 high-frequently detected exposures were used for exposure characterization and risk analysis. Results showed that region was the most critical factor influencing human exposure levels, followed by age. Organochlorine pesticides and perfluoroalkyl substances were associated with multiple chronic diseases, and some of them exceeded safe ranges. Mixture effect models showed significant risk effects of exposure on hyperlipidemia, metabolic syndrome and hyperuricemia. Overall, this study provided a comprehensive human serum exposure atlas and its disease risk, which could guide subsequent more in-depth cause-and-effect studies between environmental exposures and human health.
The R codes and related example data for statistical analysis and figure production have been deposited to the GitHub (see website**). 

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/Figure_1.png"/></div>
<h4 align="center">
Figure. 1 Overview of the study.


## Which R packages are used in this paper?
### R package “vegan” for variation partitioning analysis  
Code: ExposomeAtlas/code/variation_partitioning_analysis.R  
Example file:  
&emsp;ExposomeAtlas/example/M_f3.csv  
&emsp;ExposomeAtlas/example/M_n.csv  

### R package “FactoMineR” for Principal component analysis  
Code: ExposomeAtlas/code/PCA.R  
Example file: ExposomeAtlas/example/PCA.xlsx  
Result figure: ExposomeAtlas/figure/ResultFigure_1_PCA.png

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/ResultFigure_1_PCA.png"/></div>
<h4 align="center">


### R package "MatchIt" for Propensity Score Matching  
Code: ExposomeAtlas/code/PSM.R  
Example file: ExposomeAtlas/example/hyperlipidemiaControl.xlsx 

### R package "RSC" for dose-risk relationship analysis  
Code: ExposomeAtlas/code/RCS.R  
Example file: ExposomeAtlas/example/hyperuricemia_RCS.xlsx  
Result figure: ExposomeAtlas/figure/ResultFigure_2_RCS.png  

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/ResultFigure_2_RCS.png"/></div>
<h4 align="center">


### R package " WQS " for weighted quantile sum regression of mixture effect analysis   
Code: ExposomeAtlas/code/WQS.R  
Example file: ExposomeAtlas/example/hyperuricemia_mixture_effect.xlsx  
Result figure: ExposomeAtlas/figure/Result figure_3_WQS.png  

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/Result figure_3_WQS.png"/></div>
<h4 align="center">


### R package " q g-comp " for quantile g-computation of mixture effect analysis  
Code: ExposomeAtlas/code/qg-comp.R  
Example file: ExposomeAtlas/example/hyperuricemia_mixture_effect.xlsx  
Result figure: ExposomeAtlas/figure/ResultFigure_4_qg-comp.png  

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/ResultFigure_4_qg-comp.png"/></div>
<h4 align="center">


### R package " BKMR " for Bayesian Kernel Machine Regression of mixture effect analysis  
Code: ExposomeAtlas/code/BKMR.R  
Example file: ExposomeAtlas/example/hyperuricemia_mixture_effect.xls  
Result figure: ExposomeAtlas/figure/ResultFigure_5_BKMR.png  

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/ResultFigure_5_BKMR.png"/></div>
<h4 align="center">


## Which codes used for plot in this paper?
### sunburst plot  
Code: ExposomeAtlas/code/plotly_sunburst.Rmd  
Example file: ExposomeAtlas/example/sunburst_267chemicals.csv  
Result figure: ExposomeAtlas/figure/ResultFigure_6_sunburst_plot.png 

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/ResultFigure_6_sunburst_plot.png"/></div>
<h4 align="center">


### bar plot  
Code: ExposomeAtlas/code/bar_plot.R  
Example file: ExposomeAtlas/example/Variation_Proportion.csv  
Result figure: ExposomeAtlas/figure/ResultFigure_7_bar_plot.png 

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/ResultFigure_7_bar_plot.png"/></div>
<h4 align="center">


### stacked bar plot (flip)  
Code: ExposomeAtlas/code/stacked_bar_plot(flip).R  
Example file: ExposomeAtlas/example/location_74_15provience.csv  
Result figure: ExposomeAtlas/figure/ResultFigure 8_stacked_bar_plot_flip.png  

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/ResultFigure 8_stacked_bar_plot_flip.png"/></div>
<h4 align="center">


### line & point & error bar plot  
Code: ExposomeAtlas/code/point&line&errorbar_plot.R  
Example file: ExposomeAtlas/example/age_increase.xlsx  
Result figure: ExposomeAtlas/figure/ResultFigure 9_line&point&errorbar_plot.png  

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/ResultFigure 9_line&point&errorbar_plot.png"/></div>
<h4 align="center">


### split violin plot  
Code: ExposomeAtlas/code/split_violin_plot.R  
Example file: ExposomeAtlas/example/gender_beta.HCH.xlsx  
Result figure: ExposomeAtlas/figure/ResultFigure_10_split_violin_plot.png  

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/ResultFigure_10_split_violin_plot.png"/></div>
<h4 align="center">


### violin & box plot  
Code: ExposomeAtlas/code/Violin&Box_plot.R  
Example file: ExposomeAtlas/example/clinic_info_uricAcid.csv  
Result figure: ExposomeAtlas/figure/ResultFigure_11_violin&box_plot.png  

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/ResultFigure_11_violin&box_plot.png"/></div>
<h4 align="center">


### forest plot  
Code: ExposomeAtlas/code/forestplot_range.R  
Example file: ExposomeAtlas/example/hyperlipidemia_OR_log10.csv  
Result figure: ExposomeAtlas/figure/ResultFigure_12_forest_plot.png 

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/ResultFigure_12_forest_plot.png"/></div>
<h4 align="center">


### stacked bar plot  
Code: ExposomeAtlas/code/stack_bar_plot.R  
Example file: ExposomeAtlas/example/9clinicinfo.csv  
Result figure: ExposomeAtlas/figure/ResultFigure_13_stacked_bar_plot.png

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/ResultFigure_13_stacked_bar_plot.png"/></div>
<h4 align="center">


### heatmap  
Code: ExposomeAtlas/code/heatmap&significant.R  
Example file:  
&emsp;ExposomeAtlas/example/hyperlipidemia_age_OR.csv  
&emsp;ExposomeAtlas/example/hyperlipidemia_age_p.csv  
Result figure: ExposomeAtlas/figure/ResultFigure_14_heatmap.png  

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/ResultFigure_14_heatmap.png"/></div>
<h4 align="center">


### jitter plot  
Code: ExposomeAtlas/code/jitter_plot.R  
Example file: ExposomeAtlas/example/BE&HMB2&BGV.csv  
Result figure: ExposomeAtlas/figure/ResultFigure_15_ jitter_plot.png  

<div align=center><img width="800" src="https://github.com/youlei2023/ExposomeAtlas/blob/master/figure/ResultFigure_15_ jitter_plot.png  "/></div>
<h4 align="center">


## Author
You Lei (youlei@dicp.ac.cn)
