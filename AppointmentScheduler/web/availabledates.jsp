<%-- 
    Document   : availabledates
    Created on : Nov 30, 2014, 8:55:31 PM
    Author     : emily
--%>
<%-- 
    Document   : availabledates
    Created on : Nov 30, 2014, 8:55:31 PM
    Author     : emily
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date,java.util.Calendar"%>
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
                response.getWriter().print("Please enter a date/time to check it's availability.");
            }
            else if(rowcount > 0  ){
                response.getWriter().print(datetime + " is not available. Please choose another date/time.");
                
            }
            else if(weekday == 6 || ((weekday > 0 && weekday < 5) && (hour == 17 || (hour == 18 && min == 0))) 
                        || (weekday == 0 && hour < 18) || (weekday == 5 && ((hour == 14 && min == 30) || hour > 14))){
                response.getWriter().print(datetime + " is not during working hours.\nPlease select a proper time.");
            }
            else if (date.before(today)){
                response.getWriter().print("Sorry, you cannnot schedule an appointment in the past.");
            }
            else{
                response.getWriter().print(datetime + " is available!");
            }
        }
        catch(Exception e){
            System.out.print(e);
            e.printStackTrace();
        }
           // mail.CreateSession();
           // mail.ComposeEmail();
           // mail.SendEmail();
            
            
                   
                   
        %>
</html>