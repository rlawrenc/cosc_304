import javax.mail.*;
import java.util.Properties;
import javax.mail.internet.*;

public class SendMail {
	public static void main(String[] argv) {
		String email = "ramon.lawrence@ubc.ca"; // Address to send message to

		try {
			// Setup SSL (secure) email session
			Properties props = new Properties();
		
			props.put("mail.smtp.host", "smtp.mail.ubc.ca");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			String user = "<fill-in>";
			String password = "<fill-in>";
			
			Session session = Session.getDefaultInstance(props,
				        new javax.mail.Authenticator() {
				            @Override
				            protected PasswordAuthentication getPasswordAuthentication() {
				                return new PasswordAuthentication(user,password);
				            }
				        });

			// Create a new e-mail message
			MimeMessage message = new MimeMessage(session);

			// Set the subject line
			message.setSubject("Test Email from Java");

			// Set the text
			String myText = "This is an example message from Java.\nPlease do not respond to it.";
			message.setText(myText);

			// Set the FROM address line. Note: This could be anything. It does
			// NOT have to be real in general.
			// However, the UBC mail server will reject many addresses that do
			// not appear local.
			Address address = new InternetAddress("ramon.lawrence@ubc.ca", "Ramon Lawrence");
			message.setFrom(address);

			// Optional: Add multiple from addresses
			// Address[] fromAddress = new Address[2];
			// fromAddress[0] = address;
			// fromAddress[1] = new InternetAddress("anyoneelse@a.com",
			// "Anyone");
			// message.addFrom(fromAddress);

			// Set to TO address line. This should be real if you want it
			// delivered.
			Address toAddress = new InternetAddress(email);
			message.addRecipient(Message.RecipientType.TO, toAddress);

			// Optional: Add an address to CC line
			// Address ccAddress = new InternetAddress("mytest@abc.com");
			// message.addRecipient(Message.RecipientType.CC, ccAddress);

			// Basic version for now sending the e-mail
			Transport.send(message);

			// Optional: More complicated version that actually connects to the
			// server
			// message.saveChanges(); // implicit with send()
			// Transport transport = session.getTransport("smtp");
			// transport.connect(host, username, password);
			// transport.sendMessage(message, message.getAllRecipients());
			// transport.close();

			System.out.println("E-mail sent to address: " + email);
		} catch (Exception e) {
			System.out.println("Exception: " + e);
		}
	}
}