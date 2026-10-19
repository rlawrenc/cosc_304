import java.sql.*;

public class SqlServerQuestion
{	public static void main(String[] args)
	{	String url = "jdbc:sqlserver://localhost:1433;databaseName=workson;encrypt=true;trustServerCertificate=true";
		String uid = "sa";
		String pw = "304#sa#pw";
	
		try ( Connection con = DriverManager.getConnection(url, uid, pw);
	              Statement stmt = con.createStatement(); ) 
		{
			String sql = "SELECT D.dno, D.dname, P.pno, P.pname, SUM(W.hours) AS total_hours " +
						"FROM Dept D JOIN Proj P ON D.dno = P.dno " +
						"JOIN WorksOn W ON P.pno = W.pno " +
						"GROUP BY D.dno, D.dname, P.pno, P.pname " +
						"ORDER BY D.dno, total_hours DESC, P.pno";

			ResultSet rst = stmt.executeQuery(sql);

			String last = null;
			int count = 0;

			while (rst.next())
			{
				String current = rst.getString(1);
				if (last == null || !last.equals(current))
				{	last = current;
					count = 0;
					System.out.println("\nId: "+current+"  Name: "+rst.getString(2));
					System.out.println("Proj#\tName\tTotal Hours");
				}

				if (count < 1)	// Only want top 1 if change this to 5 would produce top 5
				{	System.out.println(rst.getString(3)+"\t"+rst.getString(4)+"\t"+rst.getInt(5));
					count++;
				}
			}
			rst.close();
		}
		catch (SQLException ex)
		{
			System.err.println("SQLException: " + ex);
		}		
	}
}

