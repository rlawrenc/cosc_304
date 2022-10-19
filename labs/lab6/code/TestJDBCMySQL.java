import java.sql.*;

public class TestJDBCMySQL
{   public static void main(String[] args)
    {   String url = "jdbc:mysql://localhost/workson";
        String uid = "testuser";
        String pw = "todo";              
              
        try ( Connection con = DriverManager.getConnection(url, uid, pw);
              Statement stmt = con.createStatement();) 
        {
            ResultSet rst = stmt.executeQuery("SELECT ename,salary FROM emp");
            System.out.println("Employee Name,Salary");
            while (rst.next())
            {   System.out.println(rst.getString("ename")+","+rst.getDouble("salary"));
            }
        }
        catch (SQLException ex)
        {
            System.err.println("SQLException: " + ex);
        }
    }
}