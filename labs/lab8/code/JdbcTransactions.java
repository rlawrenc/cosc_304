/*
 * JdbcTransactions.java - Demonstrates a JDBC transaction using the Lab 7
 * SQL Server orders database.
 *
 * The program compares an order's stored total with the sum of its line items
 * and corrects the total if necessary. The SELECT and optional UPDATE are
 * performed in one transaction.
 *
 * Key steps:
 * 1. Turn off auto-commit with setAutoCommit(false).
 * 2. Execute the SQL statements.
 * 3. Commit on success, or roll back if a SQL error occurs.
 *
 * Run this standalone program with the SQL Server JDBC driver on the classpath.
 * Start the Lab 7 Docker containers first.
 */

import java.math.BigDecimal;
import java.sql.*;

public class JdbcTransactions
{
    public static void main(String[] args)
    {
        // Connect from the host computer to the Lab 7 SQL Server Docker container.
        String url = "jdbc:sqlserver://cosc304_sqlserver:1433;databaseName=orders;"
                   + "encrypt=true;trustServerCertificate=true";
        String uid = "sa";
        String pw = "304#sa#pw";  // Classroom Docker password (not for production)
        int orderId = 1;

        try (Connection con = DriverManager.getConnection(url, uid, pw))
        {
            con.setAutoCommit(false);  // Start managing transactions explicitly

            try
            {
                String sql = "SELECT O.totalAmount, "
                           + "SUM(OP.quantity * OP.price) AS calculatedTotal "
                           + "FROM ordersummary O "
                           + "LEFT JOIN orderproduct OP ON O.orderId = OP.orderId "
                           + "WHERE O.orderId = ? "
                           + "GROUP BY O.orderId, O.totalAmount";

                BigDecimal storedTotal;
                BigDecimal calculatedTotal;

                try (PreparedStatement pstmt = con.prepareStatement(sql))
                {
                    pstmt.setInt(1, orderId);
                    try (ResultSet rst = pstmt.executeQuery())
                    {
                        if (!rst.next())
                            throw new SQLException("Order " + orderId + " was not found.");

                        storedTotal = rst.getBigDecimal("totalAmount");
                        calculatedTotal = rst.getBigDecimal("calculatedTotal");
                    }
                }

                if (storedTotal.compareTo(calculatedTotal) != 0)
                {
                    sql = "UPDATE ordersummary SET totalAmount = ? WHERE orderId = ?";
                    try (PreparedStatement pstmt = con.prepareStatement(sql))
                    {
                        pstmt.setBigDecimal(1, calculatedTotal);
                        pstmt.setInt(2, orderId);
                        pstmt.executeUpdate();
                    }
                    System.out.println("Order " + orderId + " total was incorrect: "
                                       + storedTotal + ". Updated to: " + calculatedTotal);
                }
                else
                    System.out.println("Order " + orderId + " total is correct: " + storedTotal);

                con.commit();  // Commit the transaction
                System.out.println("Transaction committed.");
            }
            catch (SQLException ex)
            {
                con.rollback();  // Undo any changes made in this transaction
                System.out.println("Transaction rolled back.");
                throw ex;
            }
        }
        catch (SQLException ex)
        {
            System.err.println("SQLException: " + ex.getMessage());
        }
    }
}
