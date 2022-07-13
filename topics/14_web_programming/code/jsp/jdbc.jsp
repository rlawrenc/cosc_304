<!--

A JSP file that encapsulates all database access.

Author: Ramon Lawrence

Public methods:
- public void getConnection() throws SQLException
- public ResultSet executeQuery(String query) throws SQLException
- public void executeUpdate(String query) throws SQLException
- public void closeConnection() throws SQLException

-->

<%@ page import="java.sql.*"%>

<%!
	// User id, password, and server information
	private String url = "jdbc:sqlserver://<url>;DatabaseName=db_rlawrenc;";
	private String uid = "<fill-in>";
	private String pw = "<fill-in>";

	// Connection
	private Connection con = null;
%>

<%!
	public void getConnection() throws SQLException 
	{
		con = DriverManager.getConnection(url, uid, pw);
	}

	public ResultSet executeQuery(String query) throws SQLException 
	{
		Statement stmt = con.createStatement();
		ResultSet rst = stmt.executeQuery(query);

		return rst;
	}

	public void executeUpdate(String query) throws SQLException 
	{
		Statement stmt = con.createStatement();
		stmt.executeUpdate(query);
		if (stmt != null)
			stmt.close();
	}

	public void closeConnection() throws SQLException 
	{
		if (con != null)
			con.close();
		con = null;
	}
%>
