<%-- 
    Document   : editsubmit
    Created on : Dec 2, 2014, 2:23:14 PM
    Author     : emily
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    
    <%
        String tutor = request.getParameter("tutor");
        String notes = request.getParameter("notes");
        String id = request.getParameter("id");
        
        try{
                     Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wcdatabase", "root", "root");
                        Statement st=con.createStatement();
                        int i=st.executeUpdate("UPDATE appointment SET tutor = " + tutor + ", notes = " + notes + " WHERE id = " + id);
                        System.out.println("Data is successfully inserted!");
                        
                         con.close();
                         st.close();
                    }
                    catch(Exception e){
                        System.out.print(e);
                        e.printStackTrace();
                    }
        
        
        
        %>
</html>
