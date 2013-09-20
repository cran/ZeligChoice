### R code from vignette source 'ZeligChoice-manual.Rnw'

###################################################
### code chunk number 1: loadLibrary
###################################################
library(ZeligChoice)


###################################################
### code chunk number 2: InputValues.list
###################################################
formulae <- list(cbind(Y1,Y2) ~ X1 + X2)


###################################################
### code chunk number 3: InputValues.list.mu
###################################################
formulae <- list(mu1 = y1 ~ x1 + tag(x3, "x3"), 
                 mu2 = y2 ~ x2 + tag(x3, "x3"))


###################################################
### code chunk number 4: BasicExample.data
###################################################
 data(sanction)
## sanction


###################################################
### code chunk number 5: BasicExample.zelig
###################################################
 z.out1 <- zelig(cbind(import, export) ~ coop + cost + target, 
                  model = "blogit", data = sanction)


###################################################
### code chunk number 6: BasicExample.setx.low
###################################################
 x.low <- setx(z.out1, cost = 1)


###################################################
### code chunk number 7: BasicExample.setx.high
###################################################
x.high <- setx(z.out1, cost = 4)


###################################################
### code chunk number 8: BasicExample.sim
###################################################
 s.out1 <- sim(z.out1, x = x.low, x1 = x.high)
 summary(s.out1)


###################################################
### code chunk number 9: blogit-BasicExamplePlot
###################################################
 plot(s.out1)


###################################################
### code chunk number 10: JointExample.zelig
###################################################
 z.out2 <- zelig(list(import ~ coop, export ~ cost + target), 
                  model = "blogit", data = sanction)
 summary(z.out2)


###################################################
### code chunk number 11: JointExample.setx
###################################################
 x.out2 <- setx(z.out2)


###################################################
### code chunk number 12: JointExample.sim
###################################################
 s.out2 <- sim(z.out2, x = x.out2)
 summary(s.out2)


###################################################
### code chunk number 13: blogitJointExamplePlot
###################################################
 plot(s.out2)


###################################################
### code chunk number 14: InputValues.list
###################################################
fml <- list(cbind(Y1,Y2) ~ X1 + X2)


###################################################
### code chunk number 15: InputValues.list.rho
###################################################
fml <- list(mu1 = Y1 ~ X1 + X2,  
            mu2 = Y2 ~ X1 + X2, 
            rho = ~ 1)


###################################################
### code chunk number 16: InputValues.list.mu
###################################################
fml <- list(mu1 = y1 ~ x1 + tag(x3, "age"), 
            mu2 = y2 ~ x2 + tag(x3, "age"))


###################################################
### code chunk number 17: BasicExample.data
###################################################
 data(sanction)


###################################################
### code chunk number 18: BasicExample.zelig
###################################################
 z.out1 <- zelig(cbind(import, export) ~ coop + cost + target, 
                  model = "bprobit", data = sanction)


###################################################
### code chunk number 19: BasicExample.setx
###################################################
 x.low <- setx(z.out1, cost = 1)
 x.high <- setx(z.out1, cost = 4)


###################################################
### code chunk number 20: BasicExample.sim
###################################################
 s.out1 <- sim(z.out1, x = x.low, x1 = x.high)
 summary(s.out1)


###################################################
### code chunk number 21: bprobit-BasicExamplePlot
###################################################
 plot(s.out1)


###################################################
### code chunk number 22: JointEstimation.list
###################################################
 fml2 <- list(mu1 = import ~ coop, 
               mu2 = export ~ cost + target)


###################################################
### code chunk number 23: JointEstimation.zelig
###################################################
 z.out2 <- zelig(fml2, model = "bprobit", data = sanction)
 summary(z.out2)


###################################################
### code chunk number 24: JointEstimation.setx
###################################################
 x.out2 <- setx(z.out2)


###################################################
### code chunk number 25: JointEstimation.sim
###################################################
 s.out2 <- sim(z.out2, x = x.out2)
 summary(s.out2)


###################################################
### code chunk number 26: bprobit-JointEstimationPlot
###################################################
 plot(s.out2)


###################################################
### code chunk number 27: Example.data
###################################################
 data(sanction)


###################################################
### code chunk number 28: Example.factor
###################################################
 sanction$ncost <- factor(sanction$ncost, ordered = TRUE,
                          levels = c("net gain", "little effect", 
                          "modest loss", "major loss"))


###################################################
### code chunk number 29: Example.zelig
###################################################
 z.out <- zelig(ncost ~ mil + coop, model = "ologit", data = sanction)


###################################################
### code chunk number 30: Example.setx
###################################################
 x.out <- setx(z.out, fn = NULL)


###################################################
### code chunk number 31: Example.sim
###################################################
 s.out <- sim(z.out, x = x.out)


###################################################
### code chunk number 32: Example.summary
###################################################
 summary(s.out)


###################################################
### code chunk number 33: FirstDifferences.zelig
###################################################
 z.out <- zelig(as.factor(cost) ~ mil + coop, model = "ologit", 
                 data = sanction)


###################################################
### code chunk number 34: FirstDifferences.summary
###################################################
summary(z.out)


###################################################
### code chunk number 35: FirstDifferences.setx
###################################################
 x.low <- setx(z.out, mil = 0)
 x.high <- setx(z.out, mil = 1)


###################################################
### code chunk number 36: FirstDifferences.sim
###################################################
 s.out <- sim(z.out, x = x.low, x1 = x.high)
 summary(s.out)


###################################################
### code chunk number 37: Example.data
###################################################
 data(sanction)


###################################################
### code chunk number 38: Example.factor
###################################################
 sanction$ncost <- factor(sanction$ncost, ordered = TRUE,
                           levels = c("net gain", "little effect", 
                           "modest loss", "major loss"))


###################################################
### code chunk number 39: Example.zelig
###################################################
 z.out <- zelig(ncost ~ mil + coop, model = "oprobit", data = sanction)
 summary(z.out)


###################################################
### code chunk number 40: Example.setx
###################################################
 x.out <- setx(z.out, fn = NULL)


###################################################
### code chunk number 41: Example.sim
###################################################
 s.out <- sim(z.out, x = x.out)
 summary(s.out)


###################################################
### code chunk number 42: oprobit-ExamplePlot
###################################################
plot(s.out)


###################################################
### code chunk number 43: FirstDifferences.zelig
###################################################
 z.out <- zelig(as.factor(cost) ~ mil + coop, model = "oprobit", 
                 data = sanction)


###################################################
### code chunk number 44: FirstDifferences.summary
###################################################
summary(z.out)


###################################################
### code chunk number 45: FirstDifferences.setx
###################################################
 x.low <- setx(z.out, mil = 0)
 x.high <- setx(z.out, mil = 1)


###################################################
### code chunk number 46: FirstDifferences.sim
###################################################
 s.out <- sim(z.out, x = x.low, x1 = x.high)


###################################################
### code chunk number 47: FirstDifferences.summary.sim
###################################################
summary(s.out)


###################################################
### code chunk number 48: oprobit-FirstDifferencesPlot
###################################################
 plot(s.out)


