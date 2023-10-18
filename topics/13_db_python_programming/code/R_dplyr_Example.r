# R and dplyr/dbplyr Example
library(dplyr)
library(dbplyr)

con <- dbConnect(RMariaDB::MariaDB(), user='testuser', password='todo', dbname='workson', host='localhost')

# Execute a query
data <- tbl(con, "emp") %>%
  group_by(title) %>%
  summarise(
    totalSalary = sum(salary),
    totalEmp = n())
show_query(data)
data # Executes query

# Disconnect
dbDisconnect(con)
