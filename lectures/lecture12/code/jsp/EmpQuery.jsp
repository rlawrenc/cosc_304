<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Query Results Using JSP with PreparedStatements</title>
</head>
<body>

<%
	String url = "jdbc:mysql://cosc304.ok.ubc.ca/workson";
	String uid = "rlawrenc";
	String pw = "todo";

	try 
	{	// Load driver class
		Class.forName("com.mysql.jdbc.Driver");
	}
	catch (java.lang.ClassNotFoundException e) {
		System.err.println("ClassNotFoundException: " +e);	
	}
	
	// Get parameters from request
	String empName = request.getParameter("empname");
	String deptNum = request.getParameter("deptnum");
	
	try (	Connection con = DriverManager.getConnection(url, uid, pw); 
			Statement stmt = con.createStatement();) 
	{
		String sql = "SELECT ename, salary, dno FROM emp";
		boolean hasEmp = empName != null && !empName.equals("");
		boolean hasDept = deptNum != null && !deptNum.equals("");

		PreparedStatement pstmt = null;
		ResultSet rst = null;

		if (!hasEmp && !hasDept) {
			pstmt = con.prepareStatement(sql);
			rst = pstmt.executeQuery();
		} else if (hasEmp) {
			empName = "%" + empName + "%";
			sql += " WHERE ename LIKE ?";
			if (hasDept)
				sql += " AND dno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, empName);
			if (hasDept)
				pstmt.setString(2, deptNum);
			rst = pstmt.executeQuery();
		} else if (hasDept) {
			sql += " WHERE dno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, deptNum);
			rst = pstmt.executeQuery();
		}
		
		// Note: Asking driver to return actual SQL executed
		sql = pstmt.toString();
		out.println("<h2>SQL Query: " + sql + "</h2>");
		out.print("<table><tr><th>Name</th><th>Salary</th><th>dno</th></tr>");
		while (rst.next()) {
			out.println("<tr><td>" + rst.getString(1) + "</td>" + "<td>" + rst.getDouble(2) + "</td>" + "<td>"
					+ rst.getString(3) + "</td></tr>");

		}
		out.println("</table></body></html>");
		out.close();
	} 
	catch (SQLException ex) 
	{
		out.println(ex);
	} 
%>
</body>
</html>
