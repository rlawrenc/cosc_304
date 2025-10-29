import pyodbc 
try:
    # print(pyodbc.drivers())
    # Download and install ODBC Driver 18 for SQL Server from Microsoft if not installed
    # https://learn.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server
    cnx = pyodbc.connect("""DRIVER={ODBC Driver 18 for SQL Server};SERVER=localhost;
                        DATABASE=workson;UID=sa;PWD=todo;TrustServerCertificate=yes;""")
    cursor = cnx.cursor()
    cursor.execute("SELECT * FROM emp WHERE salary < ?", [50000]) 
    for row in cursor:
        print(row[0],row[1], row.salary)        
except pyodbc.Error as err:  
    print(err)
finally:
    cnx.close()