library(caret)

network <- read.csv("network_2.csv")

inTrain <- createDataPartition(y = network$category, p = 0.75, list = FALSE)
training <- network[inTrain,]
testing <- network[-inTrain,]

km1 <- kmeans(select(training, -category), centers = 2)
training$clusters <- as.factor(km1$cluster)

modFit <- train(clusters~., data = select(training, -category), method = "rpart")
table(predict(modFit, testing), testing$category)
