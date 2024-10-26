import java.sql.*;
public class TestInClass {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost/workson";
        String uid = "testuser";
        String pw = "304testpw";
        try(Connection con = DriverManager.getConnection(url, uid, pw);
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);) {
            ResultSet rs = stmt.executeQuery("select * from dept natural join proj");

            rs.afterLast();
            while (rs.previous()) {
                System.out.println(rs.getString("dname") + ", " + rs.getString("pname"));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
