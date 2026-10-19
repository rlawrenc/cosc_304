import java.sql.*;

public class MyJDBC
{	public static void main(String[] args)
	{	String url = "jdbc:mysql://localhost/workson";
		String uid = "testuser";
		String pw = "304testpw";

	 	String employeesSql = "SELECT ename, salary FROM emp " +
    							"WHERE supereno = ? ORDER BY salary DESC, ename";
			
		try ( Connection con = DriverManager.getConnection(url, uid, pw);
	        	Statement stmt = con.createStatement(); 
				PreparedStatement employees = con.prepareStatement(employeesSql);) 
		{
			
			try (ResultSet rst = stmt.executeQuery("SELECT eno, ename FROM emp "+
				" WHERE eno IN (SELECT supereno FROM emp) ORDER BY ename");)
			{
				while (rst.next())
				{
					System.out.println("Supervisor: " + rst.getString("ename"));
					employees.setString(1, rst.getString("eno"));

					try (ResultSet rst2 = employees.executeQuery())
					{
						while (rst2.next())
						{
							System.out.printf("   %s, %.2f%n",
								rst2.getString("ename"),
								rst2.getDouble("salary"));
						}
					}
					System.out.println();
				}
			}
		}
		catch (SQLException ex)
		{
			System.err.println("SQLException: " + ex);
		}		
	}
}


