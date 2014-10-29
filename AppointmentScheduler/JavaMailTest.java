import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMailTest {
    public static void main(String[] args) {
        String host="mymail.clarkson.edu";  
        final String user="kinelec@clarkson.edu";//change accordingly  
        String to="	gulrajpw@clarkson.edu";//change accordingly

        //Get the session object  
        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.host",host);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session=Session.getDefaultInstance(props, new javax.mail.Authenticator(){
        	protected PasswordAuthentication getPasswordAuthentication(){
        		return new PasswordAuthentication("kinelec", "*****"); //user name and password
        	}
    
        });
        session.setDebug(true);

        //Compose the message  
        try {
            MimeMessage message = new MimeMessage(session);
            message.saveChanges();
            message.setFrom(new InternetAddress(user));  
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
            message.setSubject("CS350 mail");  
            message.setText("Hey patrick. I am currently sending you this email from a java program. hopefully it works. Also in order to send an email from the writing center email address, we're going to need their password.\n I hope this worked.\n Emily");  

            //send the message
            Transport.send(message);

            System.out.println("message sent successfully...");
        }
        catch (MessagingException e) {e.printStackTrace();}

    }
}
