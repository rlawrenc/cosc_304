import mysql.connector
try:
    cnx = mysql.connector.connect(user='todo', password='todo', host='cosc304.ok.ubc.ca', database='workson', ssl_disabled='True')
    cursor = cnx.cursor()
    sql = "INSERT INTO emp (eno, ename, salary) VALUES (%s, %s, %s)"
    cursor.execute(sql, ('E10', 'Test Person', 100000))
    
    # Update data by committing transaction on connection
    cnx.commit()
    
    # Remove employee just added
    sql = "DELETE FROM emp WHERE eno = 'E10'"
    cursor.execute(sql)
    cursor.close()
    cnx.commit()
    print("Success")
except mysql.connector.Error as err:  
    print(err)
finally:
    cnx.close()
