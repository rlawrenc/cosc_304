/*
This program reads in a text-file containing SQL commands and creates a single SQL statement.
It then executes the entire SQL statement.
If there are no errors, the program completes successfully.
*/

import java.io.*;
import java.sql.*;

public class ExecuteSqlScript {
	public static void main(String []argv)
	{	String inFileName = "script.sql";
		BufferedReader myReader = null;
		String sql = "";

		try
		{
			myReader = new BufferedReader(new FileReader(new File(inFileName)));

			while (myReader.ready())
			{
				String line = myReader.readLine();
				sql = sql + line+"\n";
			}

			System.out.println("SQL command to execute: ");
			System.out.println(sql);
		}
		catch (IOException e)
		{	System.err.println("IOException: "+e); }

		try {
			if (myReader != null) myReader.close();
		}
		catch (IOException e)
		{	System.err.println("Exception during closing: "+e); }


		// Now execute script
		String url = "jdbc:sqlserver://<url>;DatabaseName=<fill-in>;";
		String uid = "<fill-in>";
		String pw = "<fill-in>";

		Connection con = null;
		try {
			con = DriverManager.getConnection(url,uid,pw);
			Statement stmt = con.createStatement();
			stmt.execute(sql);
		}
		catch (SQLException ex)
		{
			System.err.println("SQLException: " + ex);
		}
		finally
		{
			if (con != null)
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
