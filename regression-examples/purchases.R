# Illustrates a logistic regression model to predict liklihood of 
# purchase on a website.

purchases <- read.csv("website-purchases.csv")
logit.mod <-  glm(Buy ~ ., data=purchases, family = "binomial")
summary(logit.mod)

library(MASS)
best.fit <- stepAIC(logit.mod, direction="both")

# Evaluate fit
with(logit.mod, pchisq(null.deviance - deviance, df.null - df.residual, lower.tail = FALSE))
with(best.fit, pchisq(null.deviance - deviance, df.null - df.residual, lower.tail = FALSE))


new.purch <- read.csv("new-web-purchases.csv")
predict(logit.mod, newdata=new.purh, type = "response")
