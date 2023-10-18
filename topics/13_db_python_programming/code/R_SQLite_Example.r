# R and SQLite example
library("RSQLite")
library("DBI")

con <- dbConnect(RSQLite::SQLite(), ":memory:")

# Write data frame to table
testData <- data.frame(id = 1:5, name=c("Abe", "Ben", "Cindy", "Dana", "Emma"))

dbWriteTable(con, "test", testData)
data <- dbGetQuery(con,"SELECT * FROM test")
data

# Disconnect
dbDisconnect(con)
