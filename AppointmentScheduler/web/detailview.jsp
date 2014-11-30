<%-- 
    Document   : detailview
    Created on : Nov 30, 2014, 10:43:26 AM
    Author     : emily
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Appointment Details</h3>
    <div id="appointmentdetails">
         <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wcdatabase", "root", "root");
        PreparedStatement stmt2=con.prepareStatement("SELECT * FROM appointment WHERE id = ?");
        stmt2.setString(1, request.getParameter("details"));
        System.out.println(request.getParameter("details"));
        ResultSet rs2=stmt2.executeQuery();
        
        while(rs2.next())
        {
        
        %>
       
        Student Number: <%=rs2.getString("studentid") %> <br>
        Date/Time: <%=rs2.getString("datetime") %><br>
        For a Course:<%=rs2.getString("course") %><br>
        Course Name: <%=rs2.getString("coursename") %><br>
        Instructor:
        Assignment Type:
        Progress:
        Reasons:
        Required?:
        Reason Required:
        ESL Student:
        Tutor:
        Notes:
    </div>
     <%
        } 
    rs2.close();
    stmt2.close();
    con.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }




%>
    </body>
</html>
