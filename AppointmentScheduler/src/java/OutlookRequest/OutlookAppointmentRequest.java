
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
import javax.mail.Message;
import javax.mail.Session;
/*
 *
 * @author http://valermicle.blogspot.com/2009/02/i-was-searching-for-documentations-on.html
 * and Patrick Gulrajani
 */
public class OutlookAppointmentRequest {
    
    //Method designed to create datastructure for pushing appointment request to outlook.
    public void OutlookAPTrequest(OutlookInfo info) throws Exception //from request.getParameter datatime in appointmentsubmit.jsp
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
       String from = info.getEmail();
       String subject = "WC Appointent Request for " + info.getName();
       String recipient = "WC email address";
       Session session =  Session.getDefaultInstance(null);
       
       
       MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setSubject(subject);
        message.addRecipient(message.RecipientType.TO, new InternetAddress(recipient));
        
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
        
        
        
        BodyPart calenderPart = buildCalenderPart();
        multipart.addBodyPart(calenderPart);
        
        //#7
        message.setContent(multipart);
        
        //send message
        Transport transport = session.getTransport("smtp"); //PROBLEM HERE.
        transport.connect();
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
        
        
    } // end of method.
    
    
    
    
    public BodyPart buildHtmlTextPart() throws MessagingException 
    {
        MimeBodyPart descriptionPart = new MimeBodyPart();
        
         //Note: even if the content is spcified as being text/html, outlook won't read correctly tables at all
        // and only some properties from div:s. Thus, try to avoid too fancy content
        String content = "Simple Meeting Invitation";
        descriptionPart.setContent(content, "text/html; charset=utf-8");
        return descriptionPart;
    }
    
    //define somewhere the icalendar date format
    private static SimpleDateFormat iCalendarDateFormat = new SimpleDateFormat("yyyyMMdd'T'HHmm'00'");
    
    public BodyPart buildCalenderPart() throws Exception
    {
        BodyPart calendarPart = new MimeBodyPart();
     
        Calendar cal = Calendar.getInstance();
        
        
        ///////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////
        int day_of_month = cal.DAY_OF_MONTH;
        cal.Add(day_of_month, 1);
        
        Date start = cal.getTime();
        
        int hour_of_day = cal.HOUR_OF_DAY;
        cal.Add(hour_of_day, 3);
        //////////////////////////////////////////////////////
        /////////////////////////////////////////////////////
        
        Date end = cal.getTime();
        
        //COPIED DIRECTLY.
         //check the icalendar spec in order to build a more complicated meeting request
        String calendarContent =
                "BEGIN:VCALENDAR\n" +
                        "METHOD:REQUEST\n" +
                        "PRODID: BCP - Meeting\n" +
                        "VERSION:2.0\n" +
                        "BEGIN:VEVENT\n" +
                        "DTSTAMP:" + iCalendarDateFormat.format(start) + "\n" +
                        "DTSTART:" + iCalendarDateFormat.format(start)+ "\n" +
                        "DTEND:"  + iCalendarDateFormat.format(end)+ "\n" +
                        "SUMMARY:test request\n" +
                        "UID:324\n" +
                        "ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TRUE:MAILTO:organizer@yahoo.com\n" +
                        "ORGANIZER:MAILTO:organizer@yahoo.com\n" +
                        "LOCATION:on the net\n" +
                        "DESCRIPTION:learn some stuff\n" +
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
