<%-- 
    Document   : student
    Created on : Nov 26, 2014, 2:39:31 AM
    Author     : emily
--%>

 <%@page import="OutlookRequest.OutlookAppointmentRequest"%>
<%@page import="java.sql.*,java.util.*"%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        
        <%
            //The appointment info List is not being filled here
            //This information needs to be sent out to the writing center somehow.
            
            
            String lastname = request.getParameter("studentlastname");
            String firstname = request.getParameter("studentfirstname");
            String email = request.getParameter("studentemail");
            String studentid = request.getParameter("studentnum");
          //  String professorName = request.getParameter("professorName");
           // String courseName = request.getParameter("courseName");
            //int day = Integer.parseInt(request.getParameter("day"));
           // int month = Integer.parseInt(request.getParameter("month"));
           // int year = Integer.parseInt(request.getParameter("year"));
           // String time = request.getParameter("time");
            /*Create new instance of a student to be used for the database.
              This student object is missing the "description about meeting" currently*/
            //Student s1 = new Student(name, email, studentid);
           // StudentEmail.Email mail = new StudentEmail.Email(email, StudentName, professorName, courseName, day, month, year, time);
        OutlookAppointmentRequest object = new OutlookAppointmentRequest();
        object.CreateSession();
        object.OutlookAPTrequest();
        
         try{
           Class.forName("com.mysql.jdbc.Driver").newInstance();
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wcdatabase", "root", "root");
           PreparedStatement stmt=con.prepareStatement("SELECT * FROM appointment WHERE studentid = ?");
           stmt.setString(1, studentid);
           ResultSet rs=stmt.executeQuery();
           if(rs==null){
                Statement st=con.createStatement();
                int i=st.executeUpdate("INSERT INTO student(studentid,lastname,firstname,email) VALUES('"+studentid+"','"+lastname+"','"+firstname+"','"+email+"')");
                System.out.println("Data is successfully inserted!");
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
