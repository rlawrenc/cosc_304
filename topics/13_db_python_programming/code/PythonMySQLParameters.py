import mysql.connector
try:
    cnx = mysql.connector.connect(user='todo', password='todo', host='localhost', database='workson', ssl_disabled='True')
    cursor = cnx.cursor()
    query = "SELECT pno, count(*) FROM emp NATURAL JOIN workson WHERE salary < %s and ename > %s GROUP BY pno"                
    cursor.execute(query, (45000, 'L'))
    for (pno, cnt) in cursor:
        print(pno, cnt)
    cursor.close()
except mysql.connector.Error as err:  
    print(err)
finally:
    cnx.close()
