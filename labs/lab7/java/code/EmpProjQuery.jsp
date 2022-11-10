<%@ page import="java.sql.*" %>
<html>
<head>
<title>WorksOn Query Results Using JSP with HTML Forms</title>
</head>
<body>

<%		
	try 
	{	// Load driver class
		Class.forName("com.mysql.cj.jdbc.Driver");
	}
	catch (java.lang.ClassNotFoundException e) {
		System.err.println("ClassNotFoundException: " +e);	
	}

	String url = "jdbc:mysql://cosc304_mysql/workson";
	String uid = "testuser";
	String pw = "304testpw";

	// Get parameters from request
	String empName = request.getParameter("empname");
	String projName = request.getParameter("projname");
	
	try (Connection con = DriverManager.getConnection(url, uid, pw);)
	{			
		String sql = "SELECT E.eno, E.ename, P.pno, P.pname, resp, hours FROM emp E, workson W, proj P WHERE "
				+ " E.eno = W.eno and P.pno = W.pno ";

		boolean hasEmp = empName != null && !empName.equals("");
		boolean hasProj = projName != null && !projName.equals("");

		PreparedStatement pstmt = null;
		ResultSet rst = null;

		if (hasProj)
			projName = "%" + projName + "%";
		if (!hasEmp && !hasProj) {
			pstmt = con.prepareStatement(sql);
			rst = pstmt.executeQuery();
		} else if (hasEmp) {
			empName = "%" + empName + "%";
			sql += " AND ename LIKE ?";
			if (hasProj)
				sql += " AND pname LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, empName);
			if (hasProj)
				pstmt.setString(2, projName);
			rst = pstmt.executeQuery();
		} else if (hasProj) {
			sql += " AND pname LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, projName);
			rst = pstmt.executeQuery();
		}

		// Note: Asking driver to return actual SQL executed
		sql = pstmt.toString();
		out.println("<h2>SQL Query: " + sql + "</h2>");

		out.print("<table><tr><th>eno</th><th>ename</th><th>pno</th><th>pname</th><th>resp</th><th>hours</th></tr>");
		while (rst.next()) {
			out.println("<tr><td>" + rst.getString(1) + "</td><td>" + rst.getString(2) + "</td><td>"
					+ rst.getString(3) + "</td><td>" + rst.getString(4) + "</td><td>" + rst.getString(5)
					+ "</td><td>" + rst.getInt(6) + "</td></tr>");
		}
		out.println("</table></body></html>");		
	} catch (SQLException ex) {
		out.println(ex);
	} 
%>
</body>
</html>
