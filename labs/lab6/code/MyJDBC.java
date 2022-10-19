import java.sql.*;

public class MyJDBC
{	public static void main(String[] args)
	{	String url = "jdbc:mysql://localhost/workson";
		String uid = "testuser";
		String pw = "todo";

		// Note: Loading a driver class is not required.
		try {	// Load driver class
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch (java.lang.ClassNotFoundException e) {
			System.err.println("ClassNotFoundException: " +e);
			System.exit(1);
		}

		try ( Connection con = DriverManager.getConnection(url, uid, pw);
	              Statement stmt = con.createStatement(); ) 
		{
			ResultSet rst = stmt.executeQuery(
				"SELECT eno, ename FROM emp "+
				" WHERE eno IN (SELECT supereno FROM emp) ORDER BY ename");

			while (rst.next())
			{	System.out.println("Supervisor: "+ rst.getString("ename"));

				// Now look up employees directly supervised by this supervisor
				// Note: Using a PreparedStatement here would be even better!
				Statement stmt2 = con.createStatement();

				String sql = "SELECT ename, salary FROM emp WHERE supereno = '";
				sql += rst.getString("eno")+"' ORDER BY salary DESC";
				ResultSet rst2 = stmt2.executeQuery(sql);

				while (rst2.next())
				{
					System.out.println("   "+rst2.getString(1)+", "+rst2.getString(2));
				}
				System.out.println();
			}
		}
		catch (SQLException ex)
		{
			System.err.println("SQLException: " + ex);
		}		
	}
}


