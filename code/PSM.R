library(MatchIt)
library(table1)
mydata <- openxlsx::read.xlsx("path/hyperlipidemiaControl.xlsx")

# 0 1 --> yes, no: 10 = hyperuricemia, 11 = diabetes, 12 = hyperlipidemia, 13 = hypertension, 14 = obesity
for (ithcol in c(10,11,13,14)) {
  
  for (ithrow in 1:nrow(mydata)) {
    
    if(mydata [ithrow,ithcol]==0){
      mydata [ithrow,ithcol] <- 'no'
    }
    else{
      mydata [ithrow,ithcol] <- 'yes'
    } 
  }
}

##1.before match
pvalue <- function(x, ...) {
  
  y <- unlist(x)
  g <- factor(rep(1:length(x), times=sapply(x, length)))
  if (is.numeric(y)) {
    
    p <- t.test(y ~ g)$p.value
  } else {
    
    p <- chisq.test(table(y, g))$p.value
  }
  # Format the p-value, using an HTML entity for the less-than sign.
  # The initial empty string places the output on the line below the variable label.
  c("", sub("<", "&lt;", format.pval(p, digits=3, eps=0.001)))
}

table1(~ age + gender_c + maritalStatus_c + income + education_c + smoking_c + drinking_c + samplingTime_c + location_c + obesity+diabetes+hyperuricemia+hypertension | hyperlipidemia, 
       data=mydata, overall=F, extra.col=list(`P-value`=pvalue))

##2.after match
set.seed(50)
#PSM
m.out <- matchit(data = mydata,
                 
                 formula = hyperlipidemia ~ age + gender_c + maritalStatus_c + income + education_c + smoking_c + drinking_c + samplingTime_c + location_c + obesity+diabetes+hyperuricemia+hypertension,
                 method = "nearest",
                 distance = "logit",
                 ratio=1,
                 replace = FALSE,
                 caliper = 0.05,
                 std.caliper=T) 
summary(m.out, standardize = T) 


# data after match  
mydata_matched<-match.data(m.out)
table1(~ age + gender_c + maritalStatus_c + income + education_c + smoking_c + drinking_c + samplingTime_c + location_c + obesity+diabetes+hyperuricemia+hypertension | hyperlipidemia, 
       data=mydata_matched, overall=F, extra.col=list(`P-value`=pvalue))

write.csv(mydata_matched,"path/11_CChyperlipidemiaControl_PSMRES.csv")

##3.plot after match

plot(m.out, type = "jitter", interactive = FALSE)

plot(m.out, type = "qq", interactive = FALSE,
     which.xs = c('age','gender_c','maritalStatus_c','income','education_c','smoking_c','drinking_c','samplingTime_c','location_c','disease1','disease2','disease2','disease4'))

plot(m.out, type = "hist")

