<%@ page import="org.apache.commons.fileupload.FileUpload, org.apache.commons.fileupload.servlet.ServletFileUpload, org.apache.commons.fileupload.FileItem, org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.File"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Process File Upload</title>
</head>
<body>

<H1>Processing uploaded files...</H1>

<%
try
{		
	/* 
		Note: Since HTML request is in one multi-part block.  You cannot use request.getParameter() to retrieve other 
		form parameters.  Instead, fields are processed using FileItem (see below).
		
		Documentation: http://commons.apache.org/proper/commons-fileupload/using.html
	*/
	
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (!isMultipart)
	{	out.println("Error. Expecting multi-part HTML file upload.");
		return;
	}

	// Create a factory for disk-based file items
	DiskFileItemFactory factory = new DiskFileItemFactory();

	// Configure a repository (to ensure a secure temp location is used)
	ServletContext servletContext = this.getServletConfig().getServletContext();
	File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
	factory.setRepository(repository);

	// Create a new file upload handler
	ServletFileUpload upload = new ServletFileUpload(factory);
	
    // If file size exceeds 10 MB, a FileUploadException will be thrown
    upload.setSizeMax(10000000);

	boolean saveToDB = true;

    List<FileItem> fileItems = upload.parseRequest(request);
    Iterator<FileItem> itr = fileItems.iterator();

	while (itr.hasNext()) 
	{
		FileItem fi = (FileItem) itr.next();

		// Check if not form field so as to only handle the file inputs
		// else condition handles the submit button input
		if (!fi.isFormField()) 
		{
			String localName = null;
		
			// Write-out to a local file using only the file name.
			// Note: You should put into its own directory and make sure about duplicate file names.
			// The file gets saved by default in the directory where the JSP is located.
			String baseName = stripClientPath(fi.getName());
			localName = application.getRealPath("/") + baseName;
			int fileSize = (int) fi.getSize();

			if (!saveToDB) 
			{
				out.print("<H3>Remote name: " + fi.getName() + " Local name: " + localName + "  Size: " + fileSize + "</H3>");

				File fNew = new File(localName);
				fi.write(fNew);
			} 
			else 
			{
				// Now we could either:
				//  1) Store the files on the web server and then store their location in the database (easier)
				//  2) Store the file data in a BLOB in the database and materialize on demand (harder).
				// Doing #1 is easy from above just put files in a known directory and check for duplicate names.

				// How to do #2
				//  1) Create a PreparedStatement that will do the insert.
				//  2) Pass the PreparedStatement a InputStream for the BLOB.
				//  Our table definition: (uses image type instead of BLOB as done on SQL Server)
				// create table pictures (
				// id int IDENTITY PRIMARY KEY NOT NULL ,
				// fileName VARCHAR(100),
				// fileData image );

				// Register JDBC driver
				try
				{	// Load driver class
					Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				}
				catch (java.lang.ClassNotFoundException e)
				{
					out.println("ClassNotFoundException: " +e);
				}
				
				// Database connection information
				String url = "jdbc:sqlserver://sql04.ok.ubc.ca;databaseName=db_rlawrenc;";
				String uid = "rlawrenc";
				String pw = "todo";

				Connection con = DriverManager.getConnection(url, uid, pw);
				String stmtSQL = "INSERT INTO pictures (fileName, fileData) VALUES (?,?);";
				PreparedStatement stmt = con.prepareStatement(stmtSQL);
				stmt.setString(1, baseName);
				stmt.setBinaryStream(2, fi.getInputStream(), fileSize);
				stmt.executeUpdate();

				out.println("<H3>Inserted file: " + localName + " size: " + fileSize + " into database</H3>");
			}
		} 
		else 
		{
			out.println("<H3>Form parameter field =" + fi.getFieldName() + "</H3>");
		}
	}
	out.println("<H2>Done processing all files.</H2>");
} 
catch (Exception e) 
{
	out.println("<H2>Error: " + e + "</H2>");
}
%>

<%!
private String stripClientPath(String s) 
{	// Strips the client path from a filename and returns only the filename itself
	if (s==null)
		return null;

	String filepath = null;
	String filename = null;

	int pos = s.lastIndexOf('\\');		// Search for last \
	if (pos >= 0)
	{
		filepath = s.substring(0,pos);
		filename = s.substring(pos + 1);
	}
	else
		filename = s;
	return filename;
}
%>
</body>
</html>

