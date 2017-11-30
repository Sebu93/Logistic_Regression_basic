#Reading csv

setwd("C:/Users/sebas/Desktop/csv")
mydata = read.csv("PaulBooks1.csv")

#logistic regression function

logit = glm(mydata$Purchase ~ mydata$Months+mydata$NoBought,data = mydata,family=binomial)

#Likelihood values

library(lmtest)
lrtest(logit)

#Summary 
summary(logit)

#macfaden r2

library(pscl)
pR2(logit)

#coefficent power
exp(coef(logit))

#confusion matrix
cutoff1 = floor(fitted(logit)+0.5)
table(Actual = mydata$Purchase,Predicted = cutoff1)


#loading test data

mytest_file = read.csv("PaulBooks2.csv",header=TRUE)
#confusion matrix for test data


Floor = predict(logit,newdata=mytest_file,type="response")
cutoff2 = floor(Floor+0.5)
table(Actual = mytest_file$Purchase, Predicted = cutoff2)

#new mailing strategy

Newfloor = predict(logit,newdata=mytest_file,type="response")
cutoff3 = floor(Newfloor>(1/7))
table(Actual = testdata$Purchase, Predicted = cutoff3)
