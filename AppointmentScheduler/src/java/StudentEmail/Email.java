package StudentEmail;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
     String host="mymail.clarkson.edu";  
     final String user="kinelec@clarkson.edu";//change accordingly  
     String to;//change accordingly
     String name;
     String course;
     String prof;
     final String email_subject = "Writing Center Appointment Confirmation";
     Session session;
     MimeMessage message;

    
    
    public Email(){
    };
    
    public Email(String to, String name, String prof, String course)
    {
        this.to = to;
        this.name = name;
        this.prof = prof;
        this.course = course;
    }
    
    public void CreateSession() {
        //Get the session object  
        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.host",host);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        session=Session.getInstance(props, new javax.mail.Authenticator(){
                @Override
        	protected PasswordAuthentication getPasswordAuthentication(){
        		return new PasswordAuthentication("kinelec", "*****"); //user name and password
        	}
    
        });
        session.setDebug(true);
    }
    public void ComposeEmail(){
        //Compose the message  
        try {
            message = new MimeMessage(session);
            message.saveChanges();
            message.setFrom(new InternetAddress(user));  
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
            message.setSubject(email_subject);  
            message.setText(
                    name + "--\n"
                            + "This email notification is a confirmation of your appointment with the Writing Center.\n"
                            + "\n"
                            + "\tAppointment Date: " + "\n"
                            + "\tAppointment Time: " + "\n"
                            + "\tClass: " + course + "\n"
                            + "\tProfessor: " + prof);  
        }
        catch (MessagingException e) {e.printStackTrace();}

        }
        
        public void SendEmail(){
         try {
             //send the message
             Transport.send(message);
         } catch (MessagingException ex) {
             Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
         }

            System.out.println("message sent successfully...");
    }
}
