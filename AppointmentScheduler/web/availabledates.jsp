<%-- 
    Document   : availabledates
    Created on : Nov 30, 2014, 8:55:31 PM
    Author     : emily
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
           String datetime = request.getParameter("datetime");
            
        try{
         Class.forName("com.mysql.jdbc.Driver").newInstance();
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wcdatabase", "root", "root");
           PreparedStatement stmt=con.prepareStatement("SELECT * FROM appointment WHERE datetime = ?");
            stmt.setString(1, datetime);
            ResultSet rs=stmt.executeQuery();
            rs.last(); // position on last row
            int rowcount = 0;
            rowcount = rs.getRow(); // get row no.
            if(datetime == ""){
                response.getWriter().print("Please enter a date/time to check it's availability.");
            }
            else if(rowcount > 0 || datetime.endsWith("05:30:00")){
                response.getWriter().print(datetime + " is not available. Please choose another date/time.");
                
            }
            else{
                response.getWriter().print(datetime + " is available!");
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

