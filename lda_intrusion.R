intr <- read.csv("train_data.csv")
intr <- select(intr, -(protocol_type:flag))
intr <- mutate(intr, check = ifelse(class == "normal", 0, 1))
intr <- select(intr, -class)
intr <- select(intr, -(num_access_files:num_outbound_cmds))

inT <- createDataPartition(y = intr$check, p = 0.8, list = FALSE)

train <- intr[inT,]
test <- intr[-inT,]

mod <- lda(check~., data = train)
pred <- predict(mod, test)$class

table(pred, test$check)