/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package OutlookRequest;
//java mail package must be downloaded to the project.
import javax.activation.MimetypesFileTypeMap;
import javax.activation.MailcapCommandMap;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.InternetAddress;
import javax.mail.Multipart;
import javax.mail.BodyPart;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.Transport;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
/*
 *
 * @author http://valermicle.blogspot.com/2009/02/i-was-searching-for-documentations-on.html
 * and Patrick Gulrajani
 */
public class OutlookAppointmentRequest {
    
    Session session;
    String host="mymail.clarkson.edu";  
    final String user="kinelec@clarkson.edu";
    final String subject ="Writing Center Appointment Request";
    String recipient = "kinelec@clarkson.edu";
    String name;
    String datetime;
    String email;
    
    public OutlookAppointmentRequest(String name, String datetime, String email){
        this.name = name;
        this.datetime = datetime;
        this.email = email;
    }
    
    //Method designed to create datastructure for pushing appointment request to outlook.
    public void OutlookAPTrequest() throws Exception //from request.getParameter datatime in appointmentsubmit.jsp
    {
        //create Mime object for outlook
        MimetypesFileTypeMap appointmentObject = (MimetypesFileTypeMap)MimetypesFileTypeMap.getDefaultFileTypeMap();
        appointmentObject.addMimeTypes("text/calender ics ICS");
       
       // Activation handling of text/calender
       MailcapCommandMap mailcap = (MailcapCommandMap) MailcapCommandMap.getDefaultCommandMap();
       mailcap.addMailcap("text/calendar;; x-java-content-handler=com.sun.mail.handlers.text_plain");
                
       // #3
       //Start the Mime message build.
       //SOME UNDEFINED VARIABLES HERE.
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(user));
        message.setSubject(subject);
        message.addRecipient(RecipientType.TO, new InternetAddress(recipient));
        
        //#4
        //Build the alternative MimeMultipart
        Multipart multipart = new MimeMultipart("alternative");
        
        //#5 - build first body part.
        BodyPart messageBodypart = buildHtmlTextPart();
        multipart.addBodyPart(messageBodypart);
        
        
        /*
       #6 Build the second part bodyPart, the calendar one and add it to the MimeMultipart

    The following header needs to be added to this part: "Content-Class" - "urn:content-classes:calendarmessage"
    The content type needs to be set to: "text/calendar;method=REQUEST"
    DO NOT set a filename for this part. This is very important in order to have Outlook properly reading the email 
        
        */
        
        
        
        BodyPart calenderPart = buildCalenderPart(/*datetime*/);
        multipart.addBodyPart(calenderPart);
        
        //#7
        message.setContent(multipart);
        
        //send message
        Transport transport = session.getTransport("smtp"); //PROBLEM HERE.
        transport.connect();
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
        
        
    } // end of method.
    
    public void CreateSession() 
    {
    //Get the session object  
    Properties props = new Properties();
    props.put("mail.smtp.starttls.enable","true");
    props.put("mail.smtp.host",host);
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");
    
    Authenticator auth = new Authenticator(){
        @Override
        	protected PasswordAuthentication getPasswordAuthentication(){
        		return new PasswordAuthentication("kinelec", "Caron321"); //user name and password
        	}
    };

    session=Session.getDefaultInstance(props, auth);
    session.setDebug(true);
    }
    
    
    
    public BodyPart buildHtmlTextPart() throws MessagingException 
    {
        MimeBodyPart descriptionPart = new MimeBodyPart();
        
         //Note: even if the content is spcified as being text/html, outlook won't read correctly tables at all
        // and only some properties from div:s. Thus, try to avoid too fancy content
        String content = name + "'s request for an appointment with the writing center. To view more information, please consult the database";
        descriptionPart.setContent(content, "text/html; charset=utf-8");
        return descriptionPart;
    }
    
    //define somewhere the icalendar date format
    private static SimpleDateFormat iCalendarDateFormat = new SimpleDateFormat("yyyyMMdd'T'HHmm'00'");
    
    public BodyPart buildCalenderPart(/*String datetime*/) throws Exception
    {
        BodyPart calendarPart = new MimeBodyPart();
     
        Calendar cal = Calendar.getInstance();
        Date today = new Date();
        
       // cal.add(cal.DAY_OF_MONTH, 10);
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        
        Date start = format1.parse(datetime);
        cal.setTime(start);
        
        cal.add(Calendar.MINUTE, 30);
        
        Date end = cal.getTime();
        
        //COPIED DIRECTLY.
         //check the icalendar spec in order to build a more complicated meeting request
        String calendarContent =
                "BEGIN:VCALENDAR\n" +
                        "METHOD:REQUEST\n" +
                        "PRODID: BCP - Meeting\n" +
                        "VERSION:2.0\n" +
                        "BEGIN:VEVENT\n" +
                        "DTSTAMP:" + iCalendarDateFormat.format(today) + "\n" +
                        "DTSTART:" + iCalendarDateFormat.format(start)+ "\n" +
                        "DTEND:"  + iCalendarDateFormat.format(end)+ "\n" +
                        "SUMMARY:test request\n" +
                        "UID:324\n" +
                        "ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TRUE:MAILTO:organizer@yahoo.com\n" +
                        "ORGANIZER:MAILTO:" + email + "\n" +
                        "LOCATION:Clarkson Writing Center\n" +
                        "DESCRIPTION:Log onto database to see more information\n" +
                        "SEQUENCE:0\n" +
                        "PRIORITY:5\n" +
                        "CLASS:PUBLIC\n" +
                        "STATUS:CONFIRMED\n" +
                        "TRANSP:OPAQUE\n" +
                        "BEGIN:VALARM\n" +
                        "ACTION:DISPLAY\n" +
                        "DESCRIPTION:REMINDER\n" +
                        "TRIGGER;RELATED=START:-PT00H15M00S\n" +
                        "END:VALARM\n" +
                        "END:VEVENT\n" +
                        "END:VCALENDAR";
        
        
        calendarPart.addHeader("Content-Class", "urn:content-classes:calendarmessage");
        calendarPart.setContent(calendarContent, "text/calendar;method=CANCEL");
 
        return calendarPart;
        
    }
        
    
    
    
    
}
