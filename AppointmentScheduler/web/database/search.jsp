<%-- 
    Document   : search
    Created on : Dec 1, 2014, 11:57:17 PM
    Author     : emily
--%>

<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" type="text/css" href="css/databasestyle.css" /> 
    </head>
    <body>
        <h1>Search</h1>
    
   <div class="CSSTable" >
    <table id="students">
    <%
            
            String input = request.getParameter("input");
            System.out.println(input);
            String category = request.getParameter("category");
            System.out.println(category);
            String table = "";
            
            if(category.equals("studentid") || category.equals("firstname") || category.equals("lastname"))
            {
                table = "student"; %>
                  <tr>
                    <td>Student Id</td>
                    <td>Last Name</td>
                     <td>First Name</td>
                      <td>Email</td>
                       <td></td>
                   </tr>
                <%
            }
            else if(category.equals("tutor"))
            {
                table = "appointment";
                %>
                <tr>
                    <td>Date</td>
                    <td>Time</td>
                     <td>Student Last Name</td>
                      <td>Student First Name</td>
                       <td></td>
                   </tr>
                <%
            }
            else if(category.equals("date") || category.equals("coursename") || category.equals("instructor")){
                 table = "appointment";
                %>
                <tr>
                    <td>Time</td>
                     <td>Student Last Name</td>
                      <td>Student First Name</td>
                       <td>Tutor</td>
                       <td></td>
                   </tr>
                
                <%
            }
            else{ //error 
                
            }
       
    try
    {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wcdatabase", "root", "root");
        PreparedStatement stmt=con.prepareStatement("SELECT * FROM "+ table +" WHERE " + category + " = ?");
        stmt.setString(1, input);
        System.out.println(stmt);
        ResultSet rs=stmt.executeQuery();
        
        while(rs.next())
        {
            if(category.equals("studentid") || category.equals("firstname") || category.equals("lastname")){
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
        <td><form action="writingcenterappointments.jsp" method="POST">
            <input name="studentid" type="hidden" value="<%=studentid%>">
            <input type="submit" value="View Appointments">
            </form></td>
        </tr>
        <%
            }
            else if(category.equals("tutor"))
            {
                String date = rs.getString("date");
                String time = rs.getString("time");
                String id = rs.getString("id");
                String studentid = rs.getString("studentid");
                %>
                <tr>
                <td><%=date%></td>
                <td><%=time%></td>
                <% 
                
                PreparedStatement stmt2=con.prepareStatement("SELECT lastname, firstname FROM student WHERE studentid = " + studentid);
                ResultSet rs2=stmt2.executeQuery();
                String firstn ="";
                String lastn = "";
                if(rs2.next()){
                    firstn = rs2.getString("firstname");
                    lastn = rs2.getString("lastname");
                }
               /* while(rs2.next()){
                    firstn = rs2.getString("firstname");
                    lastn = rs2.getString("lastname");
                }*/
                %>
                <td><%=lastn%></td>
                <td><%=firstn%></td>
                <td><form action="detailview.jsp" method="POST">
                <input name="id" type="hidden" value="<%=id%>">
                <input type="submit" value="View Details"></form></td>
                </tr>
            
                <%
            }
            else if(category.equals("date"))
            {
                String time = rs.getString("time");
                String studentid = rs.getString("studentid");
                String tutor = rs.getString("tutor");
                String id = rs.getString("id");
                %>
                <tr>
                <td><%=time%></td>
                <%
                PreparedStatement stmt2=con.prepareStatement("SELECT lastname, firstname FROM student WHERE studentid = " + studentid);
                ResultSet rs2=stmt2.executeQuery();
                String firstn ="";
                String lastn = "";
                if(rs2.next()){
                    firstn = rs2.getString("firstname");
                    lastn = rs2.getString("lastname");
                }
              /*  while(rs2.next()){
                    firstn = rs2.getString("firstname");
                    lastn = rs2.getString("lastname");
                }*/
                %>
                <td><%=lastn%></td>
                <td><%=firstn%></td>
                <td><%=tutor%></td>
                <td><form action="detailview.jsp" method="POST">
                <input name="id" type="hidden" value="<%=id%>">
                <input type="submit" value="View Details"></form></td>
                </tr>
    <%
            }
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