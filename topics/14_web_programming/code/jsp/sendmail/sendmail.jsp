<%@ page import="javax.mail.*,java.util.Properties,javax.mail.internet.*" %>
<%
	// This class send an e-mail message to an address provided as a parameter
	// Get e-mail parameter from request
	String email = request.getParameter("email");
	if (email == null) 
	{
		out.println("No e-mail address provided. Using default.");
		email = "ramon.lawrence@ubc.ca";	
	}

	try 
	{
		// Setup SSL (secure) email session
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.mail.ubc.ca");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		final String user = "<fill-in>";
		final String password = "<fill-in>";

		Session mailSession = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() 
			{
				return new PasswordAuthentication(user, password);
			}
		});

		// Create a new e-mail message
		MimeMessage message = new MimeMessage(mailSession);

		// Set the subject line
		message.setSubject("Test Message from JSP");

		// Set the text
		String myText = "This is an example message from JSP.\nPlease do not respond to it.";
		message.setText(myText);

		// Set the FROM address line.  Note: This could be anything.  It does NOT have to be real in general.
		// However, the UBC mail server will reject many addresss that do not appear local.
		Address address = new InternetAddress("ramon.lawrence@ubc.ca", "Ramon Lawrence");
		message.setFrom(address);

		// Optional: Add multiple from addresses
		//Address[] fromAddress = new Address[2];
		//fromAddress[0] = address;
		//fromAddress[1] = new InternetAddress("anyoneelse@a.com", "Anyone"); 
		//message.addFrom(fromAddress);

		// Set to TO address line.  This should be real if you want it delivered.
		Address toAddress = new InternetAddress(email);
		message.addRecipient(Message.RecipientType.TO, toAddress);

		// Optional: Add an address to CC line
		//Address ccAddress = new InternetAddress("mytest@abc.com");
		//message.addRecipient(Message.RecipientType.CC, ccAddress);

		// Basic version for now sending the e-mail
		Transport.send(message);

		// Optional: More complicated version that actually connects to the server
		//message.saveChanges(); // implicit with send()
		//Transport transport = session.getTransport("smtp");
		//transport.connect(host, username, password);
		//transport.sendMessage(message, message.getAllRecipients());
		//transport.close();

		out.println("E-mail sent to address: " + email);
	} 
	catch (Exception e) 
	{
		out.println("Error: " + e);
	}
%>