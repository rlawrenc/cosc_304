import mysql.connector

cnx = None
cursor = None
try:
    cnx = mysql.connector.connect(user='testuser', password='304testpw', host='localhost', database='workson', ssl_disabled=True)
    cursor = cnx.cursor(buffered=True)
    query = "SELECT eno, ename FROM emp WHERE eno IN (SELECT supereno FROM emp) ORDER BY ename"
    cursor.execute(query)
    for (eno, ename) in cursor:
        print("\nSupervisor:", ename)

        # Look up employees directly supervised by this supervisor
        cursor2 = cnx.cursor()
        query2 = "SELECT ename, salary FROM emp WHERE supereno = %s ORDER BY salary DESC"
        try:
            cursor2.execute(query2, (eno,))
            for ename, salary in cursor2:
                print(f"   {ename}, {salary:.2f}")
        finally:
            cursor2.close()
except mysql.connector.Error as err:  
    print(err)
finally:
    if cursor is not None:
        cursor.close()
    if cnx is not None:
        cnx.close()