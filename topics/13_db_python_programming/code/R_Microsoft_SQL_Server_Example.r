# R Microsoft SQL Server Example
library("DBI")
library("odbc")

db <- dbConnect(odbc::odbc(),
                     Driver = 'ODBC Driver 17 for SQL Server',
                     Server = 'localhost', Database = "workson",
                     UID='sa', PWD='todo')

data <- dbGetQuery(db,"SELECT * FROM emp")
data

# Disconnect
dbDisconnect(db)
