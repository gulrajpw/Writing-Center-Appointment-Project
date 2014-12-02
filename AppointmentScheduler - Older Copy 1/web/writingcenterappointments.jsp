<%-- 
    Document   : writingcenterappointments
    Created on : Nov 30, 2014, 6:17:39 AM
    Author     : emily
--%>

<%@page import="java.util.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="databasestyle.css" /> 
    </head>
    <body>
        <% 
            String firstname = request.getParameter("fn");
            String lastname = request.getParameter("ln");
            String studentid = request.getParameter("studentid");
        %>
    <h2><%=firstname %> <%=lastname %>'s Appointments</h2>
    <div class="CSSTable" >
        <table id="appointments">
    <tr>
        <td bgcolor="red"></td>
        <td bgcolor="red">Student Number</td>
        <td bgcolor="red">Date/Time</td>
        <td bgcolor="red"></td>
     </tr>
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wcdatabase", "root", "root");
        PreparedStatement stmt=con.prepareStatement("SELECT * FROM appointment WHERE studentid = ?");
        stmt.setString(1, studentid);
        ResultSet rs=stmt.executeQuery();
        while(rs.next())
        {

        %>
        <tr>
        <td><% int id =rs.getInt("id"); %><%=id%></td>
        <td><%=rs.getString("studentid") %></td>
        <td><%=rs.getString("datetime") %></td>
        <td><form action="detailview.jsp" method="POST">
            <input type="hidden" name="id" value="<%=id%>" />
            <input id="details" type="submit" value="View Details" />
            </form>
        </td>
        
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
catch(Exception e)
{
    e.printStackTrace();
    }




%>

</div>

</body>
</html>
