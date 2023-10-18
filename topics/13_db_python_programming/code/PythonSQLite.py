import sqlite3 
try:
	cnx = sqlite3.connect("test.db")
	cursor = cnx.cursor()
	cursor.execute("CREATE TABLE test (id int, name text)") 
	cursor.execute("INSERT INTO test VALUES(1, 'Joe')") 
	cursor.execute("INSERT INTO test VALUES(2, 'Jen')") 
	cursor.execute("INSERT INTO test VALUES(3, 'Jeff')") 
	cnx.commit()
	cursor.execute("SELECT * FROM test WHERE name > 'Je'")
	for row in cursor:
        print(row) 
	cursor.execute("DROP TABLE test")     
except sqlite3.Error as err:  
    print(err)
finally:
    cnx.close()
