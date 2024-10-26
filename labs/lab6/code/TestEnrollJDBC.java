import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 * Tests university database program.
 */
public class TestEnrollJDBC
{
	/**
	 * Class being tested
	 */
	private static EnrollJDBC q;
	
	/**
	 * Connection to the database
	 */
	private static Connection con;
	
	
	/**
	 * Requests a connection to the database.
	 * 
	 * @throws Exception
	 * 		if an error occurs
	 */
	@BeforeClass
	public static void init() throws Exception 
	{		
		q = new EnrollJDBC();
		con = q.connect();		
		
		// Load data and initialize the database
		q.init();
	}
	
	/**
	 * Closes connection.
	 * 
	 * @throws Exception
	 * 		if an error occurs
	 */
	@AfterClass
	public static void end() throws Exception 
	{
		q.close();        
	}
	
	/**
     * Tests listing all students.
     */
    @Test
    public void testListAllStudents() throws SQLException
    {   
        System.out.println(System.getProperty("user.dir"));

        // Re-initialize database
        q.init();
        
        System.out.println("\nTest List all students.\n");
        
        String result = q.listAllStudents();
        
        // Verify result
        String answer = "sid, sname, sex, birthdate, gpa"
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
        				+"\n22222222, Stephanie Stevens, F, 1999-08-15, null"
        				+"\n22903424, Jie Wang, F, 1996-07-04, 2.96"
        				+"\n45671234, Adam Scott, M, 1993-07-22, 2.96"
        				+"\n55980348, Brian Brooks, M, 1995-01-01, 3.22"
        				+"\n63112345, Yan Yang, F, 1997-08-04, 3.09"
        				+"\n77777777, Sheldon Cooper, M, 1994-03-08, null"
        				+"\n98123434, Jill Patten, F, 1992-09-12, 2.74"
        				+"\n99234353, Jamie Stokes, M, 1990-08-23, 3.05"
        				+"\n99999999, Wang Liu, M, 1994-09-30, 2.94";
                                                                
        System.out.println(result);
        assertEquals(answer, result);          
    }
    
    /**
     * Tests listing all professors in a department.
     */    
    @Test
    public void testListDeptProfessors() throws SQLException
    {                    
        // Re-initialize database
    	q.init();
        
        System.out.println("\nTest List department professors: Computer Science.\n");
        
        String queryResult = q.listDeptProfessors("Computer Science");
        
        // Verify result
        String answer = "Professor Name, Department Name"
        				+"\nArt Funk, Computer Science"
        				+"\nBowen Hui, Computer Science"
        				+"\nDon Epley, Computer Science"
        				+"\nRamon Lawrence, Computer Science";                                               
                
        System.out.println(queryResult);
        assertEquals(answer, queryResult);                 
        
        // Invalid department id
        System.out.println("\nTest List department professors: none.\n");
        queryResult = q.listDeptProfessors("none");
        
        answer = "Professor Name, Department Name";                       
                
        System.out.println(queryResult);
        assertEquals(answer, queryResult);              
    }
    
    /**
     * Tests listing all students in a course.
     */    
    @Test
    public void testListCourseStudents() throws SQLException
    {                    
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest List customer orders: COSC 304.\n");
        
        String queryResult = q.listCourseStudents("COSC 304");
        
        // Verify result
        String answer = "Student Id, Student Name, Course Number, Section Number"
        				+"\n00005465, Joe Smith, COSC 304, 001"
        				+"\n00112233, Trisha Cavanugh, COSC 304, 001"
        				+"\n00546343, Sarah Deacon, COSC 304, 001"
        				+"\n00567454, Scott Lawrence, COSC 304, 001"
        				+"\n00573453, Ryan Hackert, COSC 304, 001"
        				+"\n00612354, Elizabeth Guillum, COSC 304, 001"
        				+"\n00934353, James Miller, COSC 304, 001"
        				+"\n12456789, Dan Benson, COSC 304, 001"
        				+"\n45671234, Adam Scott, COSC 304, 001"
        				+"\n99234353, Jamie Stokes, COSC 304, 001";                     
                
        System.out.println(queryResult);
        assertEquals(answer, queryResult);                 
        
        // Course with no students
        System.out.println("\nTest List student courses: DATA 301.\n");
        queryResult = q.listCourseStudents("DATA 301");
        
        answer = "Student Id, Student Name, Course Number, Section Number";                       
                
        System.out.println(queryResult);
        assertEquals(answer, queryResult);              
    }
    
   
    /**
     * Tests computing a GPA for a student.
     */    
    @Test
    public void testComputeGPA() throws SQLException
    {             
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest compute GPA for student: 45671234.\n");
        
        ResultSet rst = q.computeGPA("45671234");
        
        // Verify result
        String answer = "Total columns: 1"
                        +"\ngpa"
                        +"\n2.956250"
                        +"\nTotal results: 1";                       
        
        String queryResult = EnrollJDBC.resultSetToString(rst, 100);
        System.out.println(queryResult);
        assertEquals(answer, queryResult);    
        
        // Verify it is a PreparedStatement that was used
        if (!(rst.getStatement() instanceof PreparedStatement))
            fail("You must use PreparedStatements for this query.");
        
        // No courses (non-existing student)
        System.out.println("\nTest compute GPA for student: 00000000.\n");
        rst = q.computeGPA("00000000");
        
        answer = "Total columns: 1"
                +"\ngpa"
                +"\nnull"
                +"\nTotal results: 1";     
        
        queryResult = EnrollJDBC.resultSetToString(rst, 100);
        System.out.println(queryResult);
        assertEquals(answer, queryResult);              
    }
	
    /**
     * Tests add a student.
     * @throws ParseException 
     */    
    @Test
    public void testAddStudent() throws SQLException, ParseException
    {            
        // Re-initialize database
        q.init();
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");		  
        
        System.out.println("\nTest add student:\n");
             
    	System.out.println("\nAdding student 55555555:");
		PreparedStatement pstmt = q.addStudent("55555555",  "Stacy Smith", "F",  sdf.parse("1998-01-01"));
		// Verify it is a PreparedStatement that was used
        if (!(pstmt instanceof PreparedStatement))
            fail("You must use PreparedStatements.");
        
		System.out.println("\nAdding student 11223344:");
		q.addStudent("11223344",  "Jim Jones", "M",  sdf.parse("1997-12-31"));
        
        // Verify result
        String answer = "sid, sname, sex, birthdate, gpa"
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
        				+"\n11223344, Jim Jones, M, 1997-12-31, null"
        				+"\n11563098, Steve Striker, M, 1998-08-09, 2.77"
        				+"\n12456789, Dan Benson, M, 1997-11-12, 2.82"
        				+"\n22222222, Stephanie Stevens, F, 1999-08-15, null"
        				+"\n22903424, Jie Wang, F, 1996-07-04, 2.96"
        				+"\n45671234, Adam Scott, M, 1993-07-22, 2.96"
        				+"\n55555555, Stacy Smith, F, 1998-01-01, null"
        				+"\n55980348, Brian Brooks, M, 1995-01-01, 3.22"
        				+"\n63112345, Yan Yang, F, 1997-08-04, 3.09"
        				+"\n77777777, Sheldon Cooper, M, 1994-03-08, null"
        				+"\n98123434, Jill Patten, F, 1992-09-12, 2.74"
        				+"\n99234353, Jamie Stokes, M, 1990-08-23, 3.05"
        				+"\n99999999, Wang Liu, M, 1994-09-30, 2.94";                                                               
        
        // Verify add
        String result = q.listAllStudents();
        System.out.println(result);
        assertEquals(answer, result);                     
    }
    
    /**
     * Tests delete a student.
     */    
    @Test
    public void testDeleteStudent() throws SQLException
    {     
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest delete student:\n");
        
        // Existing student (with courses)
        System.out.println("\nDeleting student 99999999:");
        PreparedStatement pstmt = q.deleteStudent("99999999");
        // Verify a PreparedStatement was used
        if (!(pstmt instanceof PreparedStatement))
            fail("You must use PreparedStatements.");
        
        // Non-existing student
        System.out.println("\nDeleting student 00000000:");
        q.deleteStudent("00000000");
                
        // Verify result
        String answer = "sid, sname, sex, birthdate, gpa"
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
				+"\n22222222, Stephanie Stevens, F, 1999-08-15, null"
				+"\n22903424, Jie Wang, F, 1996-07-04, 2.96"
				+"\n45671234, Adam Scott, M, 1993-07-22, 2.96"				
				+"\n55980348, Brian Brooks, M, 1995-01-01, 3.22"
				+"\n63112345, Yan Yang, F, 1997-08-04, 3.09"
				+"\n77777777, Sheldon Cooper, M, 1994-03-08, null"
				+"\n98123434, Jill Patten, F, 1992-09-12, 2.74"
				+"\n99234353, Jamie Stokes, M, 1990-08-23, 3.05";                                                                          
        
        // Verify delete
        String result = q.listAllStudents();
        System.out.println(result);
        assertEquals(answer, result);                     
    }
    
    /**
     * Tests update a student.
     * @throws ParseException 
     */    
    @Test
    public void testUpdateStudent() throws SQLException, ParseException
    {   
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest update student:\n");
               
        // Update existing students
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");		  
      	System.out.println("\nUpdating student 99999999:");
    	PreparedStatement pstmt = q.updateStudent("99999999",  "Wang Wong", "F",  sdf.parse("1995-11-08"), 3.23);
        // Verify a PreparedStatement was used
        if (!(pstmt instanceof PreparedStatement))
            fail("You must use PreparedStatements.");
        
    	System.out.println("\nUpdating student 00567454:");
    	q.updateStudent("00567454",  "Scott Brown", "M",  null, 4.00);
        
    	String answer = "sid, sname, sex, birthdate, gpa"
 				+"\n00005465, Joe Smith, M, 1997-05-01, 3.20"
 				+"\n00112233, Trisha Cavanugh, F, 1994-10-31, 2.96"
 				+"\n00324534, Tony Tenson, M, 1997-03-21, 3.21"
 				+"\n00546343, Sarah Deacon, F, 1996-01-09, 2.78"
 				+"\n00567454, Scott Brown, M, null, 4.00"
 				+"\n00573453, Ryan Hackert, M, 1995-07-07, 3.10"
 				+"\n00612354, Elizabeth Guillum, F, 1998-03-06, 3.70"
 				+"\n00934353, James Miller, M, 1997-05-29, 2.82"
 				+"\n00983124, Chris Buckley, M, 1996-06-12, 2.67"
 				+"\n01239874, Beth Bohan, F, 1995-04-17, 2.67"
 				+"\n11111111, Matt Blair, M, 1994-08-04, 2.71" 				
 				+"\n11563098, Steve Striker, M, 1998-08-09, 2.77"
 				+"\n12456789, Dan Benson, M, 1997-11-12, 2.82"
 				+"\n22222222, Stephanie Stevens, F, 1999-08-15, null"
 				+"\n22903424, Jie Wang, F, 1996-07-04, 2.96"
 				+"\n45671234, Adam Scott, M, 1993-07-22, 2.96" 				
 				+"\n55980348, Brian Brooks, M, 1995-01-01, 3.22"
 				+"\n63112345, Yan Yang, F, 1997-08-04, 3.09"
 				+"\n77777777, Sheldon Cooper, M, 1994-03-08, null"
 				+"\n98123434, Jill Patten, F, 1992-09-12, 2.74"
 				+"\n99234353, Jamie Stokes, M, 1990-08-23, 3.05"
 				+"\n99999999, Wang Wong, F, 1995-11-08, 3.23";                                     
        
    	 // Verify update
         String result = q.listAllStudents();
         System.out.println(result);
         assertEquals(answer, result);                       
    }
    
    /**
     * Tests adding a new section enrollment.
     */    
    @Test
    public void testNewEnroll() throws SQLException
    { 
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest new enrollment in COSC 304 for 98123434:\n");
               
        // Add an enrollment
        PreparedStatement pstmt = q.newEnroll("98123434", "COSC 304", "001", 2.51);
        // Verify a PreparedStatement was used
        if (!(pstmt instanceof PreparedStatement))
            fail("You must use PreparedStatements.");
                               
        // Verify new enroll
        String answer = "Total columns: 4"
                        +"\nsid, cnum, secnum, grade"
                        +"\n98123434, COSC 304, 001, 2.51"
                        +"\nTotal results: 1";
        Statement stmt = con.createStatement();
        ResultSet rst = stmt.executeQuery("SELECT * FROM enroll WHERE sid = '98123434' and cnum = 'COSC 304'");
        String result = EnrollJDBC.resultSetToString(rst, 10);
        System.out.println(result);
        assertEquals(answer, result);                     
    }
    
    /**
     * Tests updating student GPA.
     */    
    @Test
    public void testUpdateStudentGPA() throws SQLException
    { 
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest update student GPA for student 98123434:\n");
               
        // Add an enrollment        
        q.newEnroll("98123434", "COSC 304", "001", 3.97);
        PreparedStatement pstmt = q.updateStudentGPA("98123434");
        // Verify a PreparedStatement was used
        if (!(pstmt instanceof PreparedStatement))
            fail("You must use PreparedStatements.");
        
        // Verify updated GPA
        String answer = "Total columns: 5"
                        +"\nsid, sname, sex, birthdate, gpa"
                        +"\n98123434, Jill Patten, F, 1992-09-12, 2.86"
                        +"\nTotal results: 1";
        Statement stmt = con.createStatement();
        ResultSet rst = stmt.executeQuery("SELECT * FROM student WHERE sid = '98123434'");
        String result = EnrollJDBC.resultSetToString(rst, 10);
        System.out.println(result);
        assertEquals(answer, result);                     
    }
    
    /**
     * Tests updating student mark.
     */    
    @Test
    public void testUpdateStudentMark() throws SQLException
    { 
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest update student mark for student 98123434 to 3.55:\n");
               
        // Add an enrollment        
        q.newEnroll("98123434", "COSC 304", "001", null);
        PreparedStatement pstmt = q.updateStudentMark("98123434", "COSC 304", "001", 3.55);
        // Verify a PreparedStatement was used
        if (!(pstmt instanceof PreparedStatement))
            fail("You must use PreparedStatements.");
        
        // Update student's grade        
        // Verify new enroll
        String answer = "Total columns: 4"
                        +"\nsid, cnum, secnum, grade"
                        +"\n98123434, COSC 304, 001, 3.55"
                        +"\nTotal results: 1";
        Statement stmt = con.createStatement();
        ResultSet rst = stmt.executeQuery("SELECT * FROM enroll WHERE sid = '98123434' and cnum = 'COSC 304'");
        String result = EnrollJDBC.resultSetToString(rst, 10);
        System.out.println(result);
        assertEquals(answer, result);                     
    }
    
    /**
     * Tests remove student from section.
     */    
    @Test
    public void testRemoveStudentFromSection() throws SQLException
    { 
        // Re-initialize database
        q.init();
        
        System.out.println("\nRemoving student 00546343 from CHEM 113 001:\n");
               
        // Add an enrollment        
        PreparedStatement pstmt = q.removeStudentFromSection("00546343", "CHEM 113", "002");        
        // Verify a PreparedStatement was used
        if (!(pstmt instanceof PreparedStatement))
            fail("You must use PreparedStatements.");
        
        // Verify
        String answer = "Total columns: 4"
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
                        +"\nTotal results: 9";
                        
        Statement stmt = con.createStatement();
        ResultSet rst = stmt.executeQuery("SELECT * FROM enroll WHERE sid = '00546343'");
        String result = EnrollJDBC.resultSetToString(rst, 10);
        System.out.println(result);
        assertEquals(answer, result);                     
    }
    
 
    /**
     * Tests first query:
     * Return the list of students (id and name) that have not registered in any course section. Hint: Left join can be used instead of a subquery.
     */    
    @Test
    public void testQuery1() throws SQLException
    {             
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest query 1:\n");
        
        ResultSet rst = q.query1();
        
        // Verify result
        String answer = "Total columns: 2"
        				+"\nsid, sname"
        				+"\n22222222, Stephanie Stevens"
        				+"\n77777777, Sheldon Cooper"
        				+"\nTotal results: 2";
                
        String queryResult = EnrollJDBC.resultSetToString(rst, 100);
        System.out.println(queryResult);
        assertEquals(answer, queryResult);          
    }
    
    /**
     * Tests second query:
     * For each student return their id and name, number of course sections registered in (called numcourses), and gpa (average of grades). 
     * Return only students born after March 15, 1992. A student is also only in the result if their gpa is above 3.1 or registered in 0 courses.
     * Order by GPA descending then student name ascending and show only the top 5.
     */    
    @Test
    public void testQuery2() throws SQLException
    {   
        // Re-initialize all data
        q.init();
        
        System.out.println("\nTest query 2:\n");
                      
        ResultSet rst = q.query2();
        
        // Verify result
        String answer = "Total columns: 4"
        				+"\nsid, sname, numcourses, gpa"
        				+"\n00612354, Elizabeth Guillum, 9, 3.701111"
        				+"\n55980348, Brian Brooks, 9, 3.222222"
        				+"\n00324534, Tony Tenson, 16, 3.207500"
        				+"\n00005465, Joe Smith, 5, 3.198000"
        				+"\n77777777, Sheldon Cooper, 0, null"        				
        				+"\nTotal results: 5";
        String queryResult = EnrollJDBC.resultSetToString(rst, 100);
        System.out.println(queryResult);
        assertEquals(answer, queryResult);          
    }
    
    /**
     * Tests third query:
     * For each course, return the number of sections (numsections), total number of students enrolled (numstudents), average grade (avggrade), and number of distinct professors who taught the course.
     * Only show courses in Chemistry or Computer Science department. Make sure to show courses even if they have no students. Do not show a course if there are no professors teaching that course.
     */    
    @Test
    public void testQuery3() throws SQLException
    {              
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest query 3:\n");
        
        ResultSet rst = q.query3();
        
        // Verify result
        String answer = "Total columns: 5"
        				+"\ncnum, numsections, numstudents, avggrade, numprofs"
        				+"\nCHEM 111, 3, 33, 2.868182, 2"
        				+"\nCHEM 113, 4, 33, 2.938788, 2"
        				+"\nCOSC 222, 2, 16, 3.123750, 1"
        				+"\nCOSC 304, 1, 10, 3.298000, 1"
        				+"\nCOSC 310, 1, 10, 3.098000, 1"
        				+"\nCOSC 499, 1, 0, null, 1"
        				+"\nTotal results: 6";
        String queryResult = EnrollJDBC.resultSetToString(rst, 100);
        System.out.println(queryResult);
        assertEquals(answer, queryResult);          
    }
    
    /**
     * Tests fourth query:
     * Return the students who received a higher grade than their course section average in at least two courses.
     * Order by number of courses higher than the average and only show top 5.
     */    
    @Test
    public void testQuery4() throws SQLException
    {             
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest query 4:\n");
        
        ResultSet rst = q.query4();
        
        // Verify result
        String answer = "Total columns: 3"
        				+"\nsid, sname, numhigher"
        				+"\n00324534, Tony Tenson, 10"
        				+"\n00112233, Trisha Cavanugh, 9"
        				+"\n00612354, Elizabeth Guillum, 8"
        				+"\n55980348, Brian Brooks, 7"
        				+"\n99234353, Jamie Stokes, 7"
        				+"\nTotal results: 5";
        String queryResult = EnrollJDBC.resultSetToString(rst, 100);
        System.out.println(queryResult);
        assertEquals(answer, queryResult);          
    }
    
    /**
     * Runs an SQL query and compares answer to expected answer.  
     * 
     * @param sql
     * 		SQL query
     * @param answer
     * 		expected answer          
     */
    public static void runSQLQuery(String sql, String answer)
    {    	 
         try
         {
        	Statement stmt = con.createStatement();
 	    	ResultSet rst = stmt.executeQuery(sql);	    	
 	    	
 	    	String st = EnrollJDBC.resultSetToString(rst, 1000);
 	    	System.out.println(st);	    			
 	    		
 	    	assertEquals(answer, st);	           	             
            
 	    	stmt.close();
         }            
         catch (SQLException e)
         {	
        	 System.out.println(e);
        	 fail("Incorrect exception: "+e);
         }              
    }
}
