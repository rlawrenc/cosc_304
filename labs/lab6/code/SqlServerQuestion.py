import pyodbc 

cnx = None
cursor = None
try:
    # print(pyodbc.drivers())
    # Download and install ODBC Driver 18 for SQL Server from Microsoft if not installed
    # https://learn.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server
    cnx = pyodbc.connect("""DRIVER={ODBC Driver 18 for SQL Server};SERVER=localhost,1433;
                                DATABASE=workson;UID=sa;PWD=304#sa#pw;Encrypt=yes;TrustServerCertificate=yes;""")
    cursor = cnx.cursor()
    sql = """SELECT D.dno, D.dname, P.pno, P.pname, SUM(W.hours) AS total_hours
                FROM Dept D JOIN Proj P ON D.dno = P.dno
                JOIN WorksOn W ON P.pno = W.pno
                GROUP BY D.dno, D.dname, P.pno, P.pname
                ORDER BY D.dno, total_hours DESC, P.pno"""
    cursor.execute(sql) 
    
    last = None
    count = 0

    for row in cursor:
        current = row[0]
        if last is None or last != current:
            last = current
            count = 0
            print("\nId:", current," Name:", row[1])
            print("Proj#\tName\tTotal Hours")
            
        if count < 1:  # Only want top 1 if change this to 5 would produce top 5
            print(row[2],"\t",row[3],"\t",str(row[4]))
            count+=1

except pyodbc.Error as err:
    print("Database error:", err)

finally:
    if cursor is not None:
        cursor.close()
    if cnx is not None:
        cnx.close()