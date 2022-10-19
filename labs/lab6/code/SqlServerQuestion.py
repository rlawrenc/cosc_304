import pyodbc 
try:
    cnx = pyodbc.connect("""DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;
                        DATABASE=workson;UID=sa;PWD=todo""")
    cursor = cnx.cursor()
    sql = """SELECT D.dno, dname, P.pno, pname, SUM(hours)
             FROM Dept D, Proj P, WorksOn W
             WHERE D.dno = P.dno AND P.pno = W.pno
             GROUP BY D.dno, dname, P.pno, pname
             ORDER BY D.dno ASC, SUM(hours) DESC"""
    cursor.execute(sql) 
    
    last = None
    count = 0

    for row in cursor:
        current = row[0]
        if last == None or last != current:
            last = current
            count = 0
            print("\nId:", current," Name:", row[1])
            print("Proj#\tName\tTotal Hours")
            
        if count < 1:  # Only want top 1 if change this to 5 would produce top 5
            print(row[2],"\t",row[3],"\t",str(row[4]))
            count+=1

except pyodbc.Error as err:  
    print(err)
finally:
    cnx.close()