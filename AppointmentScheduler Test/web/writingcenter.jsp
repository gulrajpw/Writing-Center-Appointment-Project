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
        <form action="writingcenterappointments.jsp" method="POST">
       
        <label>Search:</label><input id="searchbar" type="text" /> in <select id="searchcategory">
            <option value="studentid">Student Id</option>
            <option value="firstname">First Name</option>
            <option value="lastname">Last Name</option>
            <option value="tutor">Tutor</option>
            <option value="date">Date</option>
        </select>
         <input  type="submit" name="submit" value="Search">
<div class="CSSTable" >
    <table id="students">
    <tr>
        <td></td>
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
        ArrayList<String> stdntids = new ArrayList();
        ArrayList<String> lastnames = new ArrayList();
        ArrayList<String> firstnames = new ArrayList();
        ArrayList<String> emails = new ArrayList();
        while(rs.next())
        {
            stdntids.add(rs.getString("studentid"));
            lastnames.add(rs.getString("lastname"));
            firstnames.add(rs.getString("firstname"));
            emails.add(rs.getString("email"));
        }
        
        for(int i = 0; i < stdntids.size(); i++)
        {
        %>
        
        <tr>
        <td><%=i+1%></td>
        <td><%=stdntids.get(i)%></td>
        <td><%=lastnames.get(i)%></td>
        <td><%=firstnames.get(i)%></td>
        <td><%=emails.get(i)%></td>
        <td><input type="hidden" name="ln" value="<%=lastnames.get(i)%>" />
            <input type="hidden" name="fn" value="<%=firstnames.get(i)%>" />
            <input type="hidden" name="studentid" value="<%=stdntids.get(i)%>" />
            <input type="submit" value="View Appointments"></td>
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
        </form>
    </body>
</html>
