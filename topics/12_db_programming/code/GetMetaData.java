import java.sql.*;

public class GetMetaData
{	public static void main(String[] args)
	{	String url = "jdbc:mysql://localhost/workson";
    		String uid = "testuser";
    		String pw = "todo";   

    		try ( Connection con = DriverManager.getConnection(url, uid, pw);
                 	Statement stmt = con.createStatement();) 
         	{
			String []tblTypes = {"TABLE"};	// What table types to retrieve
			
			DatabaseMetaData dmd = con.getMetaData();  // Get metadata
			ResultSet rs1, rs2, rs5;

			System.out.println("List all tables in database: ");

			rs1 = dmd.getTables(null,null, "%",tblTypes);
			while (rs1.next()) 
			{
				String tblName = rs1.getString(3);
				
				rs2 = stmt.executeQuery("SELECT COUNT(*) FROM "+tblName);
				rs2.next();
				System.out.println("Table: "+tblName+" # records: "+ rs2.getInt(1));
				rs5 = dmd.getColumns(null,null,tblName,"%");
				System.out.println("  Attributes: ");

				while (rs5.next()) 
				{
					System.out.println(rs5.getString(4));
				}
			}
		}
		catch (SQLException ex) {
			System.err.println("SQLException: " + ex); }		
	}
}
