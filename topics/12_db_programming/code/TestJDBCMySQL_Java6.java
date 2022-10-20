import java.sql.*;

public class TestJDBCMySQL_Java6
{	public static void main(String[] args)
	{	String url = "jdbc:mysql://localhost/workson";
		String uid = "testuser";
		String pw = "todo";      

		// Note: Loading a driver class is not required.
		try 
		{	// Load driver class
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch (java.lang.ClassNotFoundException e) {
			System.err.println("ClassNotFoundException: " +e);
			System.exit(1);
		}

		Connection con = null;
		try {
			con = DriverManager.getConnection(url, uid, pw);
			Statement stmt = con.createStatement();
			ResultSet rst = stmt.executeQuery("SELECT ename,salary FROM emp");
			System.out.println("Employee Name,Salary");
			while (rst.next())
			{	System.out.println(rst.getString("ename")+","+rst.getDouble("salary"));
			}
		}
		catch (SQLException ex)
		{
			System.err.println("SQLException: " + ex);
		}
		finally
		{
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (SQLException ex)
				{
					System.err.println("SQLException: " + ex);
				}
			}
		}
	}
}
