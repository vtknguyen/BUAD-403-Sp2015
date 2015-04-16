library(cluster)

# Load data
dataset = read.csv("purchases.csv", row.names=1)

# Build kmeans cluster model and show results
fit <- kmeans(dataset, 5) # Break into 4 clusters
aggregate(dataset, by=list(fit$cluster), FUN=mean) # View the cluster means
fitdata <- cbind(dataset, classif=fit$cluster) # Add the cluster of membership to each person

# Display cluster plot based on two latent components and show cross-var plots
plot(fitdata, col=1+fitdata$classif)
dev.new()
clusplot(dataset, fitdata$classif, color=TRUE, shade=TRUE, labels=2, lines=0)
