# Tests EnrollDB implementation
import unittest
# Note: If using Jupyter Notebook may need to use special package to import notebooks
# pip install import_ipnyb
# import import_ipynb
import EnrollDB



class TestEnrollDB(unittest.TestCase):
    def setUp(self):
        self.enrollDB = EnrollDB.EnrollDB()
        self.enrollDB.con = self.enrollDB.connect()
        self.enrollDB.init()
        
    def tearDown(self):
        self.enrollDB.close()
        
    def testListAllStudents(self):
        """Tests listing all students"""
        
        # Re-initialize database
        self.enrollDB.init()
        
        print("\nTest List All students.\n")
        
        result = self.enrollDB.listAllStudents()
        
        # Verify result
        answer = ("sid, sname, sex, birthdate, gpa"
        				+"\n00005465, Joe Smith, M, 1997-05-01, 3.20"
        				+"\n00112233, Trisha Cavanugh, F, 1994-10-31, 2.96"
        				+"\n00324534, Tony Tenson, M, 1997-03-21, 3.21"
        				+"\n00546343, Sarah Deacon, F, 1996-01-09, 2.78"
        				+"\n00567454, Scott Lawrence, M, 1997-05-11, 2.58"
        				+"\n00573453, Ryan Hackert, M, 1995-07-07, 3.10"
        				+"\n00612354, Elizabeth Guillum, F, 1998-03-06, 3.70"
        				+"\n00934353, James Miller, M, 1997-05-29, 2.82"
        				+"\n00983124, Chris Buckley, M, 1996-06-12, 2.67"
        				+"\n01239874, Beth Bohan, F, 1995-04-17, 2.67"
        				+"\n11111111, Matt Blair, M, 1994-08-04, 2.71"
        				+"\n11563098, Steve Striker, M, 1998-08-09, 2.77"
        				+"\n12456789, Dan Benson, M, 1997-11-12, 2.82"
        				+"\n22222222, Stephanie Stevens, F, 1999-08-15, None"
        				+"\n22903424, Jie Wang, F, 1996-07-04, 2.96"
        				+"\n45671234, Adam Scott, M, 1993-07-22, 2.96"
        				+"\n55980348, Brian Brooks, M, 1995-01-01, 3.22"
        				+"\n63112345, Yan Yang, F, 1997-08-04, 3.09"
        				+"\n77777777, Sheldon Cooper, M, 1994-03-08, None"
        				+"\n98123434, Jill Patten, F, 1992-09-12, 2.74"
        				+"\n99234353, Jamie Stokes, M, 1990-08-23, 3.05"
        				+"\n99999999, Wang Liu, M, 1994-09-30, 2.94") 
                
        print(result)
        self.assertEqual(answer, result);          
       
    
    def testListDeptProfessors(self):
        """Tests listing all professors in a department"""
         
        # Re-initialize database
        self.enrollDB.init()
        
        print("\nTest list professors in a department: Computer Science\n")
        
        queryResult = self.enrollDB.listDeptProfessors("Computer Science")
        
        # Verify result
        answer =("Professor Name, Department Name"
        				+"\nArt Funk, Computer Science"
        				+"\nBowen Hui, Computer Science"
        				+"\nDon Epley, Computer Science"
        				+"\nRamon Lawrence, Computer Science")                        
                
        print(queryResult)
        self.assertEqual(answer, queryResult)
        
        # Invalid customer id
        print("\nTest list professors in a department: none.\n")
        queryResult = self.enrollDB.listDeptProfessors("none")
        
        answer =( "Professor Name, Department Name")                       
                
        print(queryResult)
        self.assertEqual(answer, queryResult)
       
    def testListCourseStudents(self):
        """Tests listing all students in course"""
    
        # Re-initialize database
        self.enrollDB.init()
        
        print("\nTest list students in course: COSC 304.\n")
        
        queryResult = self.enrollDB.listCourseStudents("COSC 304")
        
        # Verify result
        answer = ("Student Id, Student Name, Course Number, Section Number"
        				+"\n00005465, Joe Smith, COSC 304, 001"
        				+"\n00112233, Trisha Cavanugh, COSC 304, 001"
        				+"\n00546343, Sarah Deacon, COSC 304, 001"
        				+"\n00567454, Scott Lawrence, COSC 304, 001"
        				+"\n00573453, Ryan Hackert, COSC 304, 001"
        				+"\n00612354, Elizabeth Guillum, COSC 304, 001"
        				+"\n00934353, James Miller, COSC 304, 001"
        				+"\n12456789, Dan Benson, COSC 304, 001"
        				+"\n45671234, Adam Scott, COSC 304, 001"
        				+"\n99234353, Jamie Stokes, COSC 304, 001")
        
        print(queryResult)
        self.assertEqual(answer, queryResult)
                
        # Course with no students
        print("\nTest list students in course: DATA 301\n")
        queryResult = self.enrollDB.listCourseStudents("DATA 301")
        
        answer = ("Student Id, Student Name, Course Number, Section Number")
                
        print(queryResult)
        self.assertEqual(answer, queryResult)
    
    def testComputeGPA(self):
        """Tests computing GPA for student"""
    
        # Re-initialize database
        self.enrollDB.init()
        
        print("\nTest compute GPA for student: 45671234.\n")
        
        cursor = self.enrollDB.computeGPA("45671234")
        
        # Verify result
        answer = ("Total columns: 1"
                        +"\ngpa"
                        +"\n2.956250"
                        +"\nTotal results: 1")
        
        queryResult = self.enrollDB.resultSetToString(cursor, 100);
        print(queryResult);
        self.assertEqual(answer, queryResult)    
                  
        # No courses (non-existing student)
        print("\Test compute GPA for student: 00000000\n")
        cursor = self.enrollDB.computeGPA("00000000")
        
        answer = ("Total columns: 1"
                +"\ngpa"
                +"\nNone"
                +"\nTotal results: 1")
        
        queryResult = self.enrollDB.resultSetToString(cursor, 100)
        print(queryResult)
        self.assertEqual(answer, queryResult)              

    def testAddStudent(self):
        """Tests add a Student"""
        
        # Re-initialize database
        self.enrollDB.init()
        
        print("\nTest add student:\n")
        
        self.enrollDB.addStudent("55555555",  "Stacy Smith", "F", "1998-01-01")       
        self.enrollDB.addStudent("11223344",  "Jim Jones", "M",  "1997-12-31")
        
        # Verify result
        answer = ("sid, sname, sex, birthdate, gpa"
        				+"\n00005465, Joe Smith, M, 1997-05-01, 3.20"
        				+"\n00112233, Trisha Cavanugh, F, 1994-10-31, 2.96"
        				+"\n00324534, Tony Tenson, M, 1997-03-21, 3.21"
        				+"\n00546343, Sarah Deacon, F, 1996-01-09, 2.78"
        				+"\n00567454, Scott Lawrence, M, 1997-05-11, 2.58"
        				+"\n00573453, Ryan Hackert, M, 1995-07-07, 3.10"
        				+"\n00612354, Elizabeth Guillum, F, 1998-03-06, 3.70"
        				+"\n00934353, James Miller, M, 1997-05-29, 2.82"
        				+"\n00983124, Chris Buckley, M, 1996-06-12, 2.67"
        				+"\n01239874, Beth Bohan, F, 1995-04-17, 2.67"
        				+"\n11111111, Matt Blair, M, 1994-08-04, 2.71"
        				+"\n11223344, Jim Jones, M, 1997-12-31, None"
        				+"\n11563098, Steve Striker, M, 1998-08-09, 2.77"
        				+"\n12456789, Dan Benson, M, 1997-11-12, 2.82"
        				+"\n22222222, Stephanie Stevens, F, 1999-08-15, None"
        				+"\n22903424, Jie Wang, F, 1996-07-04, 2.96"
        				+"\n45671234, Adam Scott, M, 1993-07-22, 2.96"
        				+"\n55555555, Stacy Smith, F, 1998-01-01, None"
        				+"\n55980348, Brian Brooks, M, 1995-01-01, 3.22"
        				+"\n63112345, Yan Yang, F, 1997-08-04, 3.09"
        				+"\n77777777, Sheldon Cooper, M, 1994-03-08, None"
        				+"\n98123434, Jill Patten, F, 1992-09-12, 2.74"
        				+"\n99234353, Jamie Stokes, M, 1990-08-23, 3.05"
        				+"\n99999999, Wang Liu, M, 1994-09-30, 2.94")
        
        # Verify add
        result = self.enrollDB.listAllStudents()
        print(result)
        self.assertEqual(answer, result)
        
    def testDeleteStudent(self):
        """Tests deleting a student"""
        
        # Re-initialize database
        self.enrollDB.init()
        
        print("\nTest delete student:\n")
                       
        self.enrollDB.deleteStudent("99999999")
        self.enrollDB.deleteStudent("00000000")
        
        # Verify result
        answer = ("sid, sname, sex, birthdate, gpa"
				+"\n00005465, Joe Smith, M, 1997-05-01, 3.20"
				+"\n00112233, Trisha Cavanugh, F, 1994-10-31, 2.96"
				+"\n00324534, Tony Tenson, M, 1997-03-21, 3.21"
				+"\n00546343, Sarah Deacon, F, 1996-01-09, 2.78"
				+"\n00567454, Scott Lawrence, M, 1997-05-11, 2.58"
				+"\n00573453, Ryan Hackert, M, 1995-07-07, 3.10"
				+"\n00612354, Elizabeth Guillum, F, 1998-03-06, 3.70"
				+"\n00934353, James Miller, M, 1997-05-29, 2.82"
				+"\n00983124, Chris Buckley, M, 1996-06-12, 2.67"
				+"\n01239874, Beth Bohan, F, 1995-04-17, 2.67"
				+"\n11111111, Matt Blair, M, 1994-08-04, 2.71"				
				+"\n11563098, Steve Striker, M, 1998-08-09, 2.77"
				+"\n12456789, Dan Benson, M, 1997-11-12, 2.82"
				+"\n22222222, Stephanie Stevens, F, 1999-08-15, None"
				+"\n22903424, Jie Wang, F, 1996-07-04, 2.96"
				+"\n45671234, Adam Scott, M, 1993-07-22, 2.96"				
				+"\n55980348, Brian Brooks, M, 1995-01-01, 3.22"
				+"\n63112345, Yan Yang, F, 1997-08-04, 3.09"
				+"\n77777777, Sheldon Cooper, M, 1994-03-08, None"
				+"\n98123434, Jill Patten, F, 1992-09-12, 2.74"
				+"\n99234353, Jamie Stokes, M, 1990-08-23, 3.05")
        
        # Verify add
        result = self.enrollDB.listAllStudents()
        print(result)
        self.assertEqual(answer, result)                    
    
    def testUpdateStudent(self):
        """Tests updating a student"""
        
        # Re-initialize database
        self.enrollDB.init();
        
        print("\nTest update student:\n")
        
        # Make sure customer table does not have added records from other tests
        self.enrollDB.updateStudent("99999999",  "Wang Wong", "F",  "1995-11-08", 3.23);       
        
        self.enrollDB.updateStudent("00567454",  "Scott Brown", "M",  None, 4.00)
        
        # Verify result
        answer = ("sid, sname, sex, birthdate, gpa"
 				+"\n00005465, Joe Smith, M, 1997-05-01, 3.20"
 				+"\n00112233, Trisha Cavanugh, F, 1994-10-31, 2.96"
 				+"\n00324534, Tony Tenson, M, 1997-03-21, 3.21"
 				+"\n00546343, Sarah Deacon, F, 1996-01-09, 2.78"
 				+"\n00567454, Scott Brown, M, None, 4.00"
 				+"\n00573453, Ryan Hackert, M, 1995-07-07, 3.10"
 				+"\n00612354, Elizabeth Guillum, F, 1998-03-06, 3.70"
 				+"\n00934353, James Miller, M, 1997-05-29, 2.82"
 				+"\n00983124, Chris Buckley, M, 1996-06-12, 2.67"
 				+"\n01239874, Beth Bohan, F, 1995-04-17, 2.67"
 				+"\n11111111, Matt Blair, M, 1994-08-04, 2.71" 				
 				+"\n11563098, Steve Striker, M, 1998-08-09, 2.77"
 				+"\n12456789, Dan Benson, M, 1997-11-12, 2.82"
 				+"\n22222222, Stephanie Stevens, F, 1999-08-15, None"
 				+"\n22903424, Jie Wang, F, 1996-07-04, 2.96"
 				+"\n45671234, Adam Scott, M, 1993-07-22, 2.96" 				
 				+"\n55980348, Brian Brooks, M, 1995-01-01, 3.22"
 				+"\n63112345, Yan Yang, F, 1997-08-04, 3.09"
 				+"\n77777777, Sheldon Cooper, M, 1994-03-08, None"
 				+"\n98123434, Jill Patten, F, 1992-09-12, 2.74"
 				+"\n99234353, Jamie Stokes, M, 1990-08-23, 3.05"
 				+"\n99999999, Wang Wong, F, 1995-11-08, 3.23")
        
        # Verify update
        result = self.enrollDB.listAllStudents()
        self.assertEqual(answer, result);                     
        
    def testNewEnroll(self):
        """Tests creating a new enroll"""
        
        # Re-initialize database
        self.enrollDB.init()
        
        print("\nTest new enrroll:\n")
    
        
        # Add an enroll with a student
        self.enrollDB.newEnroll("98123434", "COSC 304", "001", 2.51)
                
        # Verify add order
        answer = ("Total columns: 4"
                        +"\nsid, cnum, secnum, grade"
                        +"\n98123434, COSC 304, 001, 2.51"
                        +"\nTotal results: 1")

        cursor = self.enrollDB.con.cursor()
        cursor.execute("SELECT * FROM enroll WHERE sid = '98123434' and cnum = 'COSC 304'")
        result = self.enrollDB.resultSetToString(cursor, 10)
        self.assertEqual(answer, result)                     

    def testUpdateStudentGPA(self):
        """Tests updating a students GPA"""
        
        # Re-initialize database
        self.enrollDB.init()
        
        print("\nTest update student mark:\n")
                
        # Add an order with a customer
        self.enrollDB.newEnroll("98123434", "COSC 304", "001", 3.97)
        self.enrollDB.updateStudentGPA("98123434")
        # Verify add order
        answer = ("Total columns: 5"
                        +"\nsid, sname, sex, birthdate, gpa"
                        +"\n98123434, Jill Patten, F, 1992-09-12, 2.86"
                        +"\nTotal results: 1")
        
        cursor = self.enrollDB.con.cursor()
        cursor.execute("SELECT * FROM student WHERE sid = '98123434'")
        result = self.enrollDB.resultSetToString(cursor, 10)
        self.assertEqual(answer, result)                     
         
   
    def testUpdateStudentMark(self):
        """Tests updating student mark"""
    
        # Re-initialize database
        self.enrollDB.init()
        
        print("\nTest update student mark for student 98123434:\n")
        
        self.enrollDB.newEnroll("98123434", "COSC 304", "001", None); 
        self.enrollDB.updateStudentMark("98123434", "COSC 304", "001", 3.55)
     
        # Verify order total update       
        answer = ("Total columns: 4"
                        +"\nsid, cnum, secnum, grade"
                        +"\n98123434, COSC 304, 001, 3.55"
                        +"\nTotal results: 1")
                       
        cursor = self.enrollDB.con.cursor()
        cursor.execute("SELECT * FROM enroll WHERE sid = '98123434' and cnum = 'COSC 304'")
        result = self.enrollDB.resultSetToString(cursor, 10)
        self.assertEqual(answer, result)

        
    def testRemoveStudentFromSection(self):
        """Tests removing student """
    
        # Re-initialize database
        self.enrollDB.init()
        
        print("\nRemoving student 00546343 from CHEM 113 002:\n")
        
        self.enrollDB.removeStudentFromSection("00546343", "CHEM 113", "002")
        # Verify order total update       
        answer = ("Total columns: 4"
                        +"\nsid, cnum, secnum, grade"
                        +"\n00546343, CHEM 111, 001, 2.00"  
                        +"\n00546343, CHEM 113, 001, 2.33"
                        +"\n00546343, COSC 304, 001, 3.00"
                        +"\n00546343, COSC 310, 001, 3.00"
                        +"\n00546343, MATH 100, 003, 4.00"
                        +"\n00546343, MATH 100, 004, 2.00"
                        +"\n00546343, MATH 101, 001, 2.00"
                        +"\n00546343, MATH 101, 003, 4.00"
                        +"\n00546343, MATH 101, 004, 2.66"
                        +"\nTotal results: 9")
                       
        cursor = self.enrollDB.con.cursor()
        cursor.execute("SELECT * FROM enroll WHERE sid = '00546343'")
        result = self.enrollDB.resultSetToString(cursor, 10)
        self.assertEqual(answer, result)    
    
    def testQuery1(self):

        # Re-initialize database
        self.enrollDB.init()
        
        print("\nTest query 1:\n")
        
        cursor = self.enrollDB.query1()
        
        # Verify result
        answer = ("Total columns: 2"
        				+"\nsid, sname"
        				+"\n22222222, Stephanie Stevens"
        				+"\n77777777, Sheldon Cooper"
        				+"\nTotal results: 2")
                
        queryResult = self.enrollDB.resultSetToString(cursor, 100)
        print(queryResult)
        self.assertEqual(answer, queryResult)
    
    def testQuery2(self):
        
         
        # Re-initialize database
        self.enrollDB.init()
        
        print("\nTest query 2:\n")
        
        cursor = self.enrollDB.query2()
        
        # Verify result
        answer = ("Total columns: 4"
        				+"\nsid, sname, numcourses, gpa"
        				+"\n00612354, Elizabeth Guillum, 9, 3.701111"
        				+"\n55980348, Brian Brooks, 9, 3.222222"
        				+"\n00324534, Tony Tenson, 16, 3.207500"
        				+"\n00005465, Joe Smith, 5, 3.198000"
        				+"\n77777777, Sheldon Cooper, 0, None"        				
        				+"\nTotal results: 5")
                
        queryResult = self.enrollDB.resultSetToString(cursor, 100)
        print(queryResult)
        self.assertEqual(answer, queryResult)
        
    def testQuery3(self):
       
         
        # Re-initialize database
        self.enrollDB.init()
        
        print("\nTest query 3:\n")
        
        cursor = self.enrollDB.query3()
        
        # Verify result
        answer = ("Total columns: 5"
        				+"\ncnum, numsections, numstudents, avggrade, numprofs"
        				+"\nCHEM 111, 3, 33, 2.868182, 2"
        				+"\nCHEM 113, 4, 33, 2.938788, 2"
        				+"\nCOSC 222, 2, 16, 3.123750, 1"
        				+"\nCOSC 304, 1, 10, 3.298000, 1"
        				+"\nCOSC 310, 1, 10, 3.098000, 1"
        				+"\nCOSC 499, 1, 0, None, 1"
        				+"\nTotal results: 6")
                
        queryResult = self.enrollDB.resultSetToString(cursor, 100)
        print(queryResult)
        self.assertEqual(answer, queryResult)
        
    def testQuery4(self):
        """Return the students who received a higher grade than their course section average in at least two courses.
        Order by number of courses higher than the average and only show top 5."""
         
        # Re-initialize database
        self.enrollDB.init()
        
        print("\nTest query 4:\n")
        
        cursor = self.enrollDB.query4()
        
        # Verify result
        answer = ("Total columns: 3"
        				+"\nsid, sname, numhigher"
        				+"\n00324534, Tony Tenson, 10"
        				+"\n00112233, Trisha Cavanugh, 9"
        				+"\n00612354, Elizabeth Guillum, 8"
        				+"\n55980348, Brian Brooks, 7"
        				+"\n99234353, Jamie Stokes, 7"
        				+"\nTotal results: 5")
                
        queryResult = self.enrollDB.resultSetToString(cursor, 100)
        print(queryResult)
        self.assertEqual(answer, queryResult)
      
    
unittest.main(argv=[''], verbosity=2, exit=False)
