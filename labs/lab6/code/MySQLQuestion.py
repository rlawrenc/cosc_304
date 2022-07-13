import mysql.connector
try:
    cnx = mysql.connector.connect(user='rlawrenc', password='todo', host='cosc304.ok.ubc.ca', database='workson')
    cursor = cnx.cursor(buffered=True)
    query = "SELECT eno, ename FROM emp WHERE eno IN (SELECT supereno FROM emp) ORDER BY ename"
    cursor.execute(query)
    for (eno, ename) in cursor:
        print("\nSupervisor:", ename);

        # Look up employees directly supervised by this supervisor
        cursor2 = cnx.cursor()
        query2 = "SELECT ename, salary FROM emp WHERE supereno = %s ORDER BY salary DESC"
        cursor2.execute(query2, (eno,))
        for (ename, salary) in cursor2:
            print("  ", ename, ",", salary)
        cursor2.close()
    cursor.close()
except mysql.connector.Error as err:  
    print(err)
finally:
    cnx.close()