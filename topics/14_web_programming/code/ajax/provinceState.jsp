<%@ page import="java.sql.*" %>
<%
	String country = request.getParameter("country");
	if (country == null)
		out.println("INVALID");
	else
	{	
		try
		{	// Load driver class
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		}
		catch (java.lang.ClassNotFoundException e)
		{
			out.println("ClassNotFoundException: " +e);
		}
		
		String url = "jdbc:sqlserver://sql04.ok.ubc.ca;databaseName=db_rlawrenc;";
		String uid = "rlawrenc";
		String pw = "todo";

		try ( Connection con = DriverManager.getConnection(url, uid, pw);) 
		{			
			String sql = "select stateCode from states where countrycode=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, country);
			ResultSet rst = pstmt.executeQuery();
			StringBuffer buf = new StringBuffer();
			while (rst.next())
			{	buf.append(rst.getString(1));
				buf.append(',');				
			}
			if (buf.length() > 0)
				buf.setLength(buf.length()-1);
			out.println(buf.toString());
		}
		catch (SQLException ex)
		{	out.println("INVALID - "+ex); }		
	}	
%>
