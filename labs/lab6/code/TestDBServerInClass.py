import pyodbc
try:
    cnx = pyodbc.connect("""DRIVER={ODBC Driver 17 for SQL Server}; 
                        SERVER=localhost; DATABASE=workson;UID=sa;PWD=304#sa#pw""")
    cursor = cnx.cursor()
    query = "select title, avg(salary) as average from emp  where ename > 'J' group by title"
    cursor.execute(query)
    for (title, average) in cursor:
        print(title, average)
    cursor.close()
except mysql.connector.Error as err:
    print(err)
finally:
    cnx.close()
