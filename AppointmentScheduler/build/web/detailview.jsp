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
       <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
       <script src="editappointment.js"></script>
        <title>Appointment Details // WC Database</title>
    </head>
    <body>
        <h3>Appointment Details</h3>
    <div id="appointmentdetails">
         <%
             String id = request.getParameter("id");
             %>
             <input id="id" type="hidden" value="<%=id%>" />
             <%
             
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wcdatabase", "root", "root");
        PreparedStatement stmt=con.prepareStatement("SELECT * FROM appointment WHERE id = ?");
        stmt.setString(1, request.getParameter("id"));
        ResultSet rs=stmt.executeQuery();
        
        while(rs.next())
        {
            String studentid = rs.getString("studentid");
            %>
            <input id="studentid" type="hidden" value="<%=studentid%>" />
            <%
            String tutor = rs.getString("tutor");
            String date = rs.getString("date");
            String time = rs.getString("time");
            String notes = rs.getString("notes");
            
        
             PreparedStatement stmt2=con.prepareStatement("SELECT lastname, firstname, email FROM student WHERE studentid = " + studentid);
             ResultSet rs2=stmt2.executeQuery();
             String firstn ="";
             String lastn = "";
             String email = "";
             if(rs2.next()){
                  firstn = rs2.getString("firstname");
                   lastn = rs2.getString("lastname");
                   email = rs2.getString("email");
             }
             
        rs2.close();
        stmt2.close();
        %>
       
        
        <label>Date:</label> <div id="date"><%=date%></div><input id="date2" type="text" name="date2" value="<%=date%>" /><br>
        <label>Time:</label> <div id="time"><%=time%></div><input id="time2" type="text" name="time2" value="<%=time%>" /><br>
        <label>Student:</label><div id="student"><%=firstn %> <%=lastn %></div><input id="student2" type="text" value="<%=firstn%> <%=lastn%>" disabled="disabled" /><br>
        <label>Email:</label> <div id="email"><%=email %></div><input id="email2" type="text" value="<%=email%>" disabled="disabled" /><br>
        <label>Course Name:</label><div id="course"><%=rs.getString("coursename") %></div><input id="course2" type="text" value="<%=rs.getString("coursename") %>" disabled="disabled" /><br>
        <label>Instructor:</label> <div id="instructor"><%=rs.getString("instructor") %></div><input id="instructor2" type="text" value="<%=rs.getString("instructor") %>" disabled="disabled" /><br>
        <label>Assignment Type:</label><div id="assignmenttype"><%=rs.getString("assignmenttype") %></div><input id="assigntype2" type="text" value="<%=rs.getString("assignmenttype") %>" disabled="disabled" /><br>
        <label>Progress:</label> <div id="progress"><%=rs.getString("progress") %></div><input id="progress2" type="text" value="<%=rs.getString("progress") %>" disabled="disabled" /><br>
        <label>Reasons:</label> <div id="reasons"><%=rs.getString("reasons") %></div><input id="reasons2" type="text" value="<%=rs.getString("reasons") %>" disabled="disabled" /><br>
        <label>Required?:</label><div id="required"><%=rs.getString("required") %></div><input id="required2" type="text" value="<%=rs.getString("required") %>" disabled="disabled" /><br>
        <label>Reason Required:</label><div id="requiredreason"><%=rs.getString("requiredreason") %></div><input id="requiredreason2" type="text" value="<%=rs.getString("requiredreason") %>" disabled="disabled" /><br>
        <label>ESL Student:</label><div id="esl"><%=rs.getString("esl") %></div><input id="esl2" type="text" value="<%=rs.getString("esl") %>" disabled="disabled" /><br>
        <label>Tutor:</label><div id="tutor"><%=tutor%></div><input id="tutor2" type="text" name="tutor2" value="<%=tutor%>" /><br>
        <label>Notes:</label><div id="notes"><%=notes%></div><textarea id="notes2" name="notes2" rows="10" cols="20"><%=notes%>
</textarea><br><br>
     <%
        } 
    rs.close();
    stmt.close();
    con.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }




%>


<input id="edit" type="submit" value="Edit Information" />
<input id="save" type="submit" value="Save" />
</div>
    </body>
</html>