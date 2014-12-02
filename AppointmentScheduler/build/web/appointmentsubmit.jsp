<%-- 
    Document   : student
    Created on : Nov 26, 2014, 2:39:31 AM
    Author     : emily
--%>

 <%@page import="Email.Email"%>
<%@page import="OutlookRequest.OutlookAppointmentRequest"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*,java.util.*" %>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        </head>
     
    <%
           String datetime = request.getParameter("datetime");
      
           String[] datearray = datetime.split(" ");
           String datestring = datearray[0];
           String timearray = datearray[1];
           String[] time = timearray.split(":");
           int hour = Integer.parseInt(time[0]);
           int min = Integer.parseInt(time[1]);
           hour = hour%12 + 12;
           SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
           java.util.Date date = format1.parse(datestring);
           int weekday = date.getDay();
            
           java.util.Date today = new java.util.Date();
           /* System.out.println(date.before(today)); //2014/08/06 15:59:48*/
            
            
            /*DateFormat format2= new SimpleDateFormat("EEEE");
            
           String day2 = format2.format(date);
            System.out.println(datestring);
            System.out.println(date2.toString());
            System.out.println(day2);
            System.out.println(date2.getDay());
            System.out.println(weekday);
            System.out.println(hour);
            
            */
            
        try{
         Class.forName("com.mysql.jdbc.Driver").newInstance();
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wcdatabase", "root", "root");
           PreparedStatement stmt=con.prepareStatement("SELECT * FROM appointment WHERE datetime = ?");
            stmt.setString(1, datetime);
            ResultSet rs=stmt.executeQuery();
            rs.last(); // position on last row
            int rowcount = 0;
            rowcount = rs.getRow(); // get row no.
            if(datetime == ""){
                response.sendError(response.SC_FORBIDDEN, "Error: Must fill in a date and time.");
            }
            else if(rowcount > 0  ){
                response.sendError(response.SC_FORBIDDEN, "Error: Date and time selected not available.");
                
            }
            else if(weekday == 6 || ((weekday > 0 && weekday < 5) && (hour == 17 || (hour == 18 && min == 0))) 
                        || (weekday == 0 && hour < 18) || (weekday == 5 && ((hour == 14 && min == 30) || hour > 14))){
                response.sendError(response.SC_FORBIDDEN, "Error: Time selected is not during Writing Center hours");
            }
            else if (date.before(today)){
                response.sendError(response.SC_FORBIDDEN, "Error: Date or time has passed.");
            }
            
            con.close();
            stmt.close();
            rs.close();
        }
            catch(Exception e){
                System.out.print(e);
                e.printStackTrace();
            }
                    String firstname = request.getParameter("firstname");
                    String lastname = request.getParameter("lastname");
                    String name = firstname + " " + lastname;
                    String email = request.getParameter("email");
                    String studentid = request.getParameter("studentid");
                    String coursename = request.getParameter("coursename");
                    String instructor = request.getParameter("instructor");
                    String assignmenttype = request.getParameter("assignmenttype");
                    String progress = request.getParameter("progress");
                    String reasons = request.getParameter("reasons");
                    String required = request.getParameter("required");
                    String reasonrequired = request.getParameter("reasonrequired");
                    String esl = request.getParameter("esl");
            
                    try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wcdatabase", "root", "root");
                        Statement st=con.createStatement();
                        int i=st.executeUpdate("INSERT INTO appointment(studentid, datetime, date, time, coursename, instructor, assignmenttype, progress, reasons, required, requiredreason, esl) VALUES('"+studentid+"','"+datetime+"','"+datestring+"','"+timearray+"','"+coursename+"','"+instructor+"','"+assignmenttype+"','"+progress+"','"+reasons+"','"+required+"','"+reasonrequired+"','"+esl+"')");
                        System.out.println("Data is successfully inserted!");
                        
                         con.close();
                         st.close();
                    }
                    catch(Exception e){
                        System.out.print(e);
                        e.printStackTrace();
                    }
             
            Email mail = new Email(email, name, datestring, timearray);
            mail.CreateSession();
            mail.ComposeEmail();
            mail.SendEmail();
         OutlookAppointmentRequest object = new OutlookAppointmentRequest(name, datetime, email);
         object.CreateSession();
         object.OutlookAPTrequest();
            
                   
                   
        %>
            
        
        
        
        
    
</html>

