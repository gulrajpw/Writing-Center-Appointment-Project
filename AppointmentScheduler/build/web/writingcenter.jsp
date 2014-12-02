<%-- 
    Document   : writingcenter
    Created on : Nov 30, 2014, 3:07:47 AM
    Author     : emily
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Writing Center Appointments DataBase</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="databasestyle.css" /> 
    </head>
    <body>
        <h2>Search the Database</h2>
       <div id="searchdiv">
        <form name="form1" action="search.jsp" method="POST">
        <label>Search:</label><input name="input" type="text" /> in <select name="category">
            <option value="studentid">Student Id</option>
            <option value="firstname">First Name</option>
            <option value="lastname">Last Name</option>
            <option value="tutor">Tutor</option>
            <option value="date">Date</option>
        </select>
            <input type="submit" value="Search">
        </form>

      </div>

         
    <div class="CSSTable" >
    <table id="students">
    <tr>
        <td>Student Id</td>
        <td>Last Name</td>
        <td>First Name</td>
        <td>Email</td>
        <td></td>
     </tr>
    <%
       
    try
    {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wcdatabase", "root", "root");
        Statement stmt=con.createStatement();
        String query="select * from student";
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next())
        {
            String studentid = rs.getString("studentid");
            String lastname = rs.getString("lastname");
            String firstname = rs.getString("firstname");
            String email = rs.getString("email");
        %>
        <tr>
        <td><%=studentid%></td>
        <td><%=lastname%></td>
        <td><%=firstname%></td>
        <td><%=email%></td>
        <td><form name="form2" action="writingcenterappointments.jsp" method="POST">
            <input name="studentid" type="hidden" value="<%=studentid%>">
            <input type="submit" value="View Appointments">
            </form></td>
        </tr>
        <%

}
        
%>
    </table>
    <%
    rs.close();
    stmt.close();
    con.close();
    }
    catch(Exception e){
    e.printStackTrace();
    }
    %>
</div>
    </body>
</html>
