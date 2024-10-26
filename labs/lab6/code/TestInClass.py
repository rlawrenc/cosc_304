import mysql.connector
try:
    cnx = mysql.connector.connect(user='testuser', password='304testpw', host='localhost', database='workson')
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
