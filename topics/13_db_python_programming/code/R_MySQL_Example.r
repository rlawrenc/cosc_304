# Connect to MySQL using R
library("RMariaDB")
con <- dbConnect(RMariaDB::MariaDB(), user='testuser', password='todo', dbname='workson', host='localhost')

# List database tables
dbListTables(con)

# Execute a query
res <- dbGetQuery(con, "SELECT * FROM emp")

# Disconnect
dbDisconnect(con)
