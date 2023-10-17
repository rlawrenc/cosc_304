/*
JdbcTransactions.java - This code shows how transactions are used in JDBC.

There are two main steps:
1) Turn auto-commit off for your database connection.
2) Make sure to explicitly call commit() to end and commit your transaction, or call rollback().

This sample code determines if a given order total is consistent with its lineitems
and then updates the order total (if required) in a single transaction per order.
*/

import java.sql.*;

public class JdbcTransactions
{	public static void main(String[] args)
	{	String url = "jdbc:sqlserver://localhost;databaseName=WorksOn;TrustServerCertificate=True";
		String uid = "sa";
		String pw = "todo";

		try ( Connection con = DriverManager.getConnection(url, uid, pw);)
		{		
			Statement stmt = con.createStatement();

			con.setAutoCommit(false);			// Set auto-commit to false so can support transactions

			// First, let's mess up the order total
			String sql = "UPDATE Orders SET totalAmount = -1 WHERE orderId = 1;";
			System.out.println("Changing order total for order id 1 to -1.");
			stmt.execute(sql);

			con.commit();						// Now must explicitly commit each statement

			sql = "SELECT SUM(quantity*price),totalAmount FROM Orders O, OrderedProduct OP WHERE OP.orderId = O.orderId and O.orderId = 1 GROUP BY O.orderId, O.totalAmount";
			ResultSet rst = stmt.executeQuery(sql);

			if (rst.next())
			{
				double lineItemValue = rst.getDouble(1);
				double totalAmount = rst.getDouble(2);

				if (lineItemValue != totalAmount)
				{
					stmt.execute("UPDATE Orders SET totalAmount = "+lineItemValue+" WHERE orderId = 1;");
					System.out.println("Order total is incorrect: "+totalAmount+" Updating to: "+lineItemValue);
				}
			}
			con.commit();		// Commit this transaction			
		}
		catch (SQLException ex) {
			System.err.println("SQLException: " + ex); }
	}
}
