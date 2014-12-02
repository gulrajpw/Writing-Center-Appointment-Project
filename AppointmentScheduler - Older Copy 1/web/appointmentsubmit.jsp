<%-- 
    Document   : student
    Created on : Nov 26, 2014, 2:39:31 AM
    Author     : emily
--%>

 <%@page import="java.sql.*,java.util.*"%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        
        <%
            //The appointment info List is not being filled here
            //This information needs to be sent out to the writing center somehow.
            String datetime = request.getParameter("datetime");
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
         Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wcdatabase", "root", "root");
           Statement st=con.createStatement();
           int i=st.executeUpdate("INSERT INTO appointment(studentid, datetime, coursename, instructor, assignmenttype, progress, required, requiredreason, esl) VALUES('"+studentid+"','"+datetime+"','"+coursename+"','"+instructor+"','"+assignmenttype+"','"+progress+"','"+required+"','"+reasonrequired+"','"+esl+"')");
        System.out.println("Data is successfully inserted!");
        }
        catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
        }
            // Email mail = new Email(/*feilds*/);
           // mail.CreateSession();
           // mail.ComposeEmail();
           // mail.SendEmail();
            
            
                   
                   
        %>
            
        
        
        
        
    
</html>

