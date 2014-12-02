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
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wcdatabase", "root", "root");
        PreparedStatement stmt2=con.prepareStatement("SELECT * FROM appointment WHERE id = ?");
        stmt2.setString(1, request.getParameter("id"));
        ResultSet rs2=stmt2.executeQuery();
        
        while(rs2.next())
        {
        
        %>
       
        Student Number: <%=rs2.getString("studentid") %> <br>
        Date/Time: <%=rs2.getString("datetime") %><br>
        Course Name: <%=rs2.getString("coursename") %><br>
        Instructor: <%=rs2.getString("instructor") %><br>
        Assignment Type: <%=rs2.getString("assignmenttype") %><br>
        Progress: <%=rs2.getString("progress") %><br>
        Reasons: <%=rs2.getString("reason") %><br>
        Required?: <%=rs2.getString("required") %><br>
        Reason Required: <%=rs2.getString("requiredreason") %><br>
        ESL Student: <%=rs2.getString("esl") %><br>
        Tutor: <%=rs2.getString("tutor") %><br>
        Notes: <%=rs2.getString("notes") %><br>
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
<input id="edit" type="submit" value="Edit Information" />

    </body>
</html>