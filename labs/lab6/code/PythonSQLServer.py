
import pyodbc

cnx = None
cursor = None

try:
    cnx = pyodbc.connect("""DRIVER={ODBC Driver 18 for SQL Server};SERVER=localhost,1433;
                            DATABASE=workson;UID=sa;PWD=304#sa#pw;Encrypt=yes;TrustServerCertificate=yes;""")

    cursor = cnx.cursor()
    cursor.execute("SELECT ename, salary FROM emp")

    print("Employee Name,Salary")
    for row in cursor:
        print(f"{row.ename},{row.salary}")

except pyodbc.Error as err:
    print("Database error:", err)

finally:
    if cursor is not None:
        cursor.close()
    if cnx is not None:
        cnx.close()
