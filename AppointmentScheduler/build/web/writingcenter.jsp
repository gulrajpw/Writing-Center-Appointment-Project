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
        <title>JSP Page</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        
    </head>
    <body>
        <h2>Search the Database</h2>
        <form action="writingcenterappointments.jsp" method="POST">
       
        <label>Search:</label><input id="searchbar" type="text" /> in <select id="searchcategory">
            <option value="studentid">Student Id</option>
            <option value="firstname">First Name</option>
            <option value="lastname">Last Name</option>
            <option value="tutor">Tutor</option>
            <option value="date">Date</option>
        </select>
         <input  type="submit" name="submit" value="Search">

    <table id="students" border="2">
    <tr>
        <td bgcolor="red">Student Id</td>
        <td bgcolor="red">Last Name</td>
        <td bgcolor="red">First Name</td>
        <td bgcolor="red">Email</td>
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

        %>
        <tr>
        <td><input id="studentnum" type="submit" name="studentid" value="<%=rs.getString("studentid") %>" ></td>
        <td><%=rs.getString("lastname") %></td>
        <td><%=rs.getString("firstname") %></td>
        <td><%=rs.getString("email") %></td>
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
</form>
    </body>
</html>
