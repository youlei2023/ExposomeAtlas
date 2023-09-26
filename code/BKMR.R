library(bkmr)
library(readxl)
library(corrplot)
library(ggplot2)
dataset2 <- openxlsx::read.xlsx("path/hyperuricemia_mixture_effect.xlsx")
# head(dataset2)
# names(dataset2)
cor.matrix <- cor(dataset2[,11:ncol(dataset2)], method = "spearman")  
corrplot.mixed(cor.matrix, number.cex = 0.8)  
mixture <- as.matrix(dataset2[, 11:ncol(dataset2)])  
covariates <- as.matrix(dataset2[, c(2,3,7,8,9)])  
y <- dataset2$group

set.seed(100) 
knots50  <- fields::cover.design(mixture, nd = 50)$design
fit1 <-  kmbayes(y = y, Z = mixture, X = covariates, iter = 5000,family = "binomial", verbose = FALSE, varsel = TRUE, knots=knots50,  control.params = list(r.jump2 = 0.5), est.h = TRUE,
                 groups=c(1,1,1,1,1,2,3,4,4,4,4,4,5,6,7,8,8,9,10,10,11,11,12,12,13,13,13,13,13,13,13,13,13,13,13))
#fit1 <-  kmbayes(y = y, Z = mixture, X = covariates, iter = 5000, verbose = FALSE, varsel = TRUE)
#fit1 <-  kmbayes(y=y, Z=mixture, X=covariates, iter=25000, verbose=FALSE, varsel=TRUE, knots=knots50,groups=c(1,1,1,1,2,2,3,3,4,5,6,7,7,7,7,7,7,7,7,7,7))
ExtractPIPs(fit1)
pred.resp.univar <- PredictorResponseUnivar(fit = fit1)  
ggplot(pred.resp.univar, aes(z, est, ymin = est - 1.96*se, ymax = est + 1.96*se)) + 
  geom_smooth(stat = "identity") + 
  facet_wrap(~ variable) + ylab("h(z)")  

# overall risk
risks.overall <- OverallRiskSummaries(fit = fit1, qs = seq(0.25, 0.75, by = 0.05), q.fixed = 0.5)  #q.fixed：比较参考的水平#
ggplot(risks.overall, aes(quantile, est, ymin = est - 1.96*sd, ymax = est + 1.96*sd)) + 
  geom_pointrange()+ 
  geom_hline(yintercept = 0, lty = 2, col = "red")

# single risk
risks.singvar <- SingVarRiskSummaries(fit = fit1, y = y, Z = mixture, X = covariates, qs.diff = c(0.25, 0.75), q.fixed = c(0.25, 0.50, 0.75)) #qs.diff：比较不同百分位数的差值#
ggplot(risks.singvar, aes(variable, est, ymin = est - 1.96*sd, ymax = est + 1.96*sd, col = q.fixed)) + 
  geom_pointrange(position = position_dodge(width = 0.75)) + 
  geom_hline(yintercept = 0, lty = 2, col = "red")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1) )


