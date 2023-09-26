rm(list = ls())
library("qgcomp")
library("knitr")
library("ggplot2")
##-----------------------------------mydata
mydata <- openxlsx::read.xlsx("path/hyperuricemia_mixture_effect.xlsx")
# we save the names of the mixture variables in the variable "Xnm"
Xnm <- c('β.HCH','pp.DDE','pp.DDT','HCB','PCP','Chlorpyrifos','Etofenprox','BaA','Chr','Pyr','BbF',
         'BaP','PCB.138','Iprodione','Indole_3_butyric.acid','Triclocarban','Triclosan','Fipronil.sulphone',
         'Cortisone','Cortisol','Acesulfame.potassium','Cyclamic.acid', 'MCHP','MEP','PFPeA',
         'PFOA','PFNA','PFDA','PFUnDA','PFDoDA','PFTrDA','PFHxS','PFHpS','PFOS','X6_2.Cl.PFAES')

covars = c('age','gender','smoking','drinking','location')
mydata$group <- as.factor(mydata$group)
mydata$gender <- as.factor(mydata$gender)
mydata$smoking <- as.factor(mydata$smoking)
mydata$drinking <- as.factor(mydata$drinking)
mydata$location <- as.factor(mydata$location)
# Example 1: linear model
# Run the model and save the results "qc.fit"
colnames(mydata)[1] <- 'y'
# Example 1: linear model
# Run the model and save the results "qc.fit"
set.seed(123)
qc.fit <- qgcomp.noboot(y~.,
                        dat=mydata[,c(Xnm,covars,'y')],
                        expnms=Xnm,
                        family=binomial(),
                        q=4)

qc.fit
plot(qc.fit)

weight <- rbind(as.matrix(qc.fit$pos.weights),matrix(data = 'neg', nrow = 1, ncol = 1),as.matrix(qc.fit$neg.weights))
write.csv(weight,"path/hyperuricemia_QGCOMP-weight.csv")