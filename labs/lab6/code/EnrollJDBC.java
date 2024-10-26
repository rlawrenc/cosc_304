/*
EnrollJDBC.java - JDBC program for accessing and updating an enrollment database on MySQL.

Lab Assignment #6

Student name: 	Jasper XIANG
University id:	12925335
*/

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Scanner;

public class EnrollJDBC
{
	/**
	 * Connection to database
	 */
	private Connection con;
	
    /**
     * Path to DDL file for database. TODO: Change this as needed.
     */
    private String databaseFileName = "bin/university.ddl";

	/**
	 * Main method is only used for convenience.  Use JUnit test file to verify your answer.
	 * 
	 * @param args
	 * 		none expected
	 * @throws SQLException
	 * 		if a database error occurs
	 * @throws ParseException 
	 * 		during date conversions
	 */	
	public static void main(String[] args) throws SQLException, ParseException
	{
		EnrollJDBC app = new EnrollJDBC();
		
		app.connect();
		app.init();
						
		// List all students
		System.out.println("Executing list all students.");
		System.out.println(app.listAllStudents());
		
		// List all professors in a department
		System.out.println("\nExecuting list professors in a department: Computer Science");
		System.out.println(app.listDeptProfessors("Computer Science"));
		System.out.println("\nExecuting list professors in a department: none");
		System.out.println(app.listDeptProfessors("none"));
		
		// List all students in a course
		System.out.println("\nExecuting list students in course: COSC 304");
		System.out.println(app.listCourseStudents("COSC 304"));
		System.out.println("\nExecuting list students in course: DATA 301");
		System.out.println(app.listCourseStudents("DATA 301"));
		
		// Compute GPA
		System.out.println("\nExecuting compute GPA for student: 45671234");
		System.out.println(EnrollJDBC.resultSetToString(app.computeGPA("45671234"),10));
		System.out.println("\nExecuting compute GPA for student: 00000000");
		System.out.println(EnrollJDBC.resultSetToString(app.computeGPA("00000000"),10));
		
		// Add student
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");		    
		System.out.println("\nAdding student 55555555:");
		app.addStudent("55555555",  "Stacy Smith", "F",  sdf.parse("1998-01-01"));
		System.out.println("\nAdding student 11223344:");
		app.addStudent("11223344",  "Jim Jones", "M",  sdf.parse("1997-12-31"));
		System.out.println(app.listAllStudents());
		
		// Delete student
		System.out.println("\nTest delete student:\n");	        
        // Existing student (with courses)
	    System.out.println("\nDeleting student 99999999:");
	    app.deleteStudent("99999999");	    	    
	    // Non-existing student
	    System.out.println("\nDeleting student 00000000:");
	    app.deleteStudent("00000000");
	    System.out.println(app.listAllStudents());
	    
	    // Update student
	    System.out.println("\nUpdating student 99999999:");
    	app.updateStudent("99999999",  "Wang Wong", "F",  sdf.parse("1995-11-08"), 3.23);
    	System.out.println("\nUpdating student 00567454:");
    	app.updateStudent("00567454",  "Scott Brown", "M",  null, 4.00);
    	System.out.println(app.listAllStudents());
    	
    	// New enrollment
    	System.out.println("\nTest new enrollment in COSC 304 for 98123434:\n");        
        app.newEnroll("98123434", "COSC 304", "001", 2.51);

        // Update student mark
        System.out.println("\nTest update student mark for student 98123434 to 3.55:\n");                
        app.updateStudentMark("98123434", "COSC 304", "001", 3.55);
        
        // Update student GPA
        app.init();
        System.out.println("\nTest update student GPA for student:\n"); 
        app.newEnroll("98123434", "COSC 304", "001", 3.97);        
        app.updateStudentGPA("98123434");
        
        // Remove student from section
        app.removeStudentFromSection("98123434", "COSC 304", "001");
        
    	// Queries
		// Re-initialize all data
		app.init();
        System.out.println(EnrollJDBC.resultSetToString(app.query1(), 100));
        System.out.println(EnrollJDBC.resultSetToString(app.query2(), 100));
        System.out.println(EnrollJDBC.resultSetToString(app.query3(), 100));
        System.out.println(EnrollJDBC.resultSetToString(app.query4(), 100));
        
        app.close();        		
	}

	/**
	 * Makes a connection to the database and returns connection to caller.
	 * 
	 * @return
	 * 		connection
	 * @throws SQLException
	 * 		if an error occurs
	 */
	public Connection connect() throws SQLException
	{
	    // TODO: Fill in your connection information. Do NOT connect to university database (lab 2). Connect to testuser or mydb databases.
		String url = "jdbc:mysql://localhost/testuser"; 
		String uid = "testuser";                
		String pw = "<your password>";

		System.out.println("Connecting to database.");
		// Note: Must assign connection to instance variable as well as returning it back to the caller
		con = DriverManager.getConnection(url, uid, pw);
		return con;		                       
	}
	
	/**
	 * Closes connection to database.
	 */
	public void close()
	{
		System.out.println("Closing database connection.");
		try
		{
			if (con != null)
	            con.close();
		}
		catch (SQLException e)
		{
			System.out.println(e);
		}
	}
		
	/**
	 * Creates the database and initializes the data.
	 */
	public void init() throws SQLException
	{
	    String fileName = databaseFileName;
	    Scanner scanner = null;
	    
	    try
	    {
	        // Create statement
	        Statement stmt = con.createStatement();	                    
            
	        scanner = new Scanner(new File(fileName));
	        // Read commands separated by ;
	        scanner.useDelimiter(";");
	        while (scanner.hasNext())
	        {
	            String command = scanner.next();
	            if (command.trim().equals(""))
	                continue;
	            // System.out.println(command);        // Uncomment if want to see commands executed
	            stmt.execute(command);
	        }	        
	    }
	    catch (Exception e)
	    {
	        System.out.println(e);
            throw new SQLException(e+"\nWorking Directory = " + System.getProperty("user.dir"));
	    }      
	    if (scanner != null)
	    	scanner.close();
	    
	    System.out.println("Data successfully loaded.");
	}
	
	/**
	 * Returns a String with all the students in the database.  
	 * Format:
	 	sid, sname, sex, birthdate, gpa
		00005465, Joe Smith, M, 1997-05-01, 3.20
	 * 
	 * @return
	 *       String containing all student information
	 */
    public String listAllStudents() throws SQLException
    {                
        StringBuilder output = new StringBuilder();
       
    	// Use a PreparedStatement for this query.
        // TODO: Traverse ResultSet and use StringBuilder.append() to add columns/rows to output string        
        
        return output.toString();
    }
    
    /**
     * Returns a String with all the professors in a given department name.
     * 
     * Format:
     	Professor Name, Department Name
     	Art Funk, Computer Science
     * 
     * @return
     *       String containing professor information
     */
    public String listDeptProfessors(String deptName) throws SQLException
    {
    	// Use a PreparedStatement for this query.
    	// TODO: Traverse ResultSet and use StringBuilder.append() to add columns/rows to output string
    	return "";        
    }
    
    /**
     * Returns a String with all students in a given course number (all sections).
     * 
     * Format:
     	Student Id, Student Name, Course Number, Section Number
     	00005465, Joe Smith, COSC 304, 001
     * 
     * @return
     *       String containing students
     */
    public String listCourseStudents(String courseNum) throws SQLException
    {
    	// Use a PreparedStatement for this query.
    	// TODO: Traverse ResultSet and use StringBuilder.append() to add columns/rows to output string
    	return "";        
    }
    
    /**
     * Returns a ResultSet with a row containing the computed GPA (named as gpa) for a given student id.
     * You must use a PreparedStatement.
     * 
     * @return
     *       ResultSet containing computed GPA
     */
    public ResultSet computeGPA(String studentId) throws SQLException
    {
    	 // TODO: Use a PreparedStatement
    	return null;
    }
    
    /**
     * Inserts a student into the databases.
     * You must use a PreparedStatement. Return the PreparedStatement.
     * 
     * @return
     * 		PreparedStatement used for command
     */
    public PreparedStatement addStudent(String studentId, String studentName, String sex, java.util.Date birthDate) throws SQLException
    {
   	 	// TODO: Use a PreparedStatement and return it at the end of the method
    	return null;
    }
    
    /**
     * Deletes a student from the databases.
     * You must use a PreparedStatement. Return the PreparedStatement.
     * 
     * @throws SQLException
     * 		if an error occurs 
     * @return
     * 		PreparedStatement used for command
     */
    public PreparedStatement deleteStudent(String studentId) throws SQLException
    {
    	// TODO: Use a PreparedStatement and return it at the end of the method
    	return null;
    }
    
    /**
     * Updates a student in the databases.
     * You must use a PreparedStatement. Return the PreparedStatement.
     * 
     * @throws SQLException
     * 		if an error occurs 
     * @return
     * 		PreparedStatement used for command
     */
    public PreparedStatement updateStudent(String studentId, String studentName, String sex, java.util.Date birthDate, double gpa) throws SQLException
    {
    	// TODO: Use a PreparedStatement and return it at the end of the method
    	return null;
    }     
    
    /**
     * Creates a new enrollment in a course section.
     * You must use a PreparedStatement. Return the PreparedStatement.
     * 
     * @throws SQLException
     * 		if an error occurs 
     * @return
     * 		PreparedStatement used for command 
     */    
    public PreparedStatement newEnroll(String studentId, String courseNum, String sectionNum, Double grade) throws SQLException
    {               
    	// TODO: Use a PreparedStatement and return it at the end of the method
    	return null;
    }
    
    /**
     * Updates a student's GPA based on courses taken.
     * You must use a PreparedStatement. Return the PreparedStatement.
     * 
     * @throws SQLException
     * 		if an error occurs 
     * @return
     * 		PreparedStatement used for command 
     */    
    public PreparedStatement updateStudentGPA(String studentId) throws SQLException
    {               
    	// TODO: Use a PreparedStatement and return it at the end of the method
    	return null;
    }	
    
    /**
     * Removes a student from a course and updates their GPA.
     * You must use a PreparedStatement. Return the PreparedStatement.
     * 
     * @throws SQLException
     * 		if an error occurs 
     * @return
     * 		PreparedStatement used for command 
     */    
    public PreparedStatement removeStudentFromSection(String studentId, String courseNum, String sectionNum) throws SQLException
	{
    	// TODO: Use a PreparedStatement and return it at the end of the method
    	return null;
	}
		

    /**
     * Updates a student's mark in an enrolled course section and updates their grade.
     * You must use a PreparedStatement.
     * 
     * @throws SQLException
     * 		if an error occurs 
     * @return
     * 		PreparedStatement used for command
     */    
    public PreparedStatement updateStudentMark(String studentId, String courseNum, String sectionNum, double grade) throws SQLException
	{
    	// TODO: Use a PreparedStatement and return it at the end of the method
    	return null;
	}		
    
    /**
     * Return the list of students (id and name) that have not registered in any course section. Hint: Left join can be used instead of a subquery.
     * 
     * @return
     *      ResultSet
     * @throws SQLException
     *      if an error occurs
     */
    public ResultSet query1() throws SQLException
    {
        System.out.println("\nExecuting query #1.");
        // TODO: Execute the SQL query and return a ResultSet.
        return null;       
    }
    
    /**
     * For each student return their id and name, number of course sections registered in (called numcourses), and gpa (average of grades). 
     * Return only students born after March 15, 1992. A student is also only in the result if their gpa is above 3.1 or registered in 0 courses.
     * Order by GPA descending then student name ascending and show only the top 5.
     * 
     * @return
     *      ResultSet
     * @throws SQLException
     *      if an error occurs
     */
    public ResultSet query2() throws SQLException
    {
        System.out.println("\nExecuting query #2.");
        // TODO: Execute the SQL query and return a ResultSet.
        return null;        
    }
    
    /**
     * For each course, return the number of sections (numsections), total number of students enrolled (numstudents), average grade (avggrade), and number of distinct professors who taught the course (numprofs).
     * Only show courses in Chemistry or Computer Science department. Make sure to show courses even if they have no students. Do not show a course if there are no professors teaching that course. 
     * Format:
     * cnum, numsections, numstudents, avggrade, numprof
     * 
     * 
     * @return
     *      ResultSet
     * @throws SQLException
     *      if an error occurs
     */
    public ResultSet query3() throws SQLException
    {
        System.out.println("\nExecuting query #3.");
        // TODO: Execute the SQL query and return a ResultSet.
        return null;        
    }
    
	/**
	 * Return the students who received a higher grade than their course section average in at least two courses. Order by number of courses higher than the average and only show top 5.
	 * Format:
	 * EmployeeId, EmployeeName, orderCount
	 * 
	 * @return
	 * 		ResultSet
	 * @throws SQLException
	 * 		if an error occurs
	 */
	public ResultSet query4() throws SQLException
	{
		System.out.println("\nExecuting query #4.");
		 // TODO: Execute the SQL query and return a ResultSet.
        return null;		
	}
	
	/*
	 * Do not change anything below here.
	 */
	/**
     * Converts a ResultSet to a string with a given number of rows displayed.
     * Total rows are determined but only the first few are put into a string.
     * 
     * @param rst
     * 		ResultSet
     * @param maxrows
     * 		maximum number of rows to display
     * @return
     * 		String form of results
     * @throws SQLException
     * 		if a database error occurs
     */    
    public static String resultSetToString(ResultSet rst, int maxrows) throws SQLException
    {                       
        if (rst == null)
            return "No Resultset.";
        
        StringBuffer buf = new StringBuffer(5000);
        int rowCount = 0;
        ResultSetMetaData meta = rst.getMetaData();
        buf.append("Total columns: " + meta.getColumnCount());
        buf.append('\n');
        if (meta.getColumnCount() > 0)
            buf.append(meta.getColumnName(1));
        for (int j = 2; j <= meta.getColumnCount(); j++)
            buf.append(", " + meta.getColumnName(j));
        buf.append('\n');
                
        while (rst.next()) 
        {
            if (rowCount < maxrows)
            {
                for (int j = 0; j < meta.getColumnCount(); j++) 
                { 
                	Object obj = rst.getObject(j + 1);                	 	                       	                                	
                	buf.append(obj);                    
                    if (j != meta.getColumnCount() - 1)
                        buf.append(", ");                    
                }
                buf.append('\n');
            }
            rowCount++;
        }            
        buf.append("Total results: " + rowCount);
        return buf.toString();
    }        
}
