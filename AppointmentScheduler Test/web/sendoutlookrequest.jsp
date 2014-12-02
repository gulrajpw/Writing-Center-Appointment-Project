<%-- 
    Document   : sendoutlookrequest
    Created on : Dec 2, 2014, 12:12:42 PM
    Author     : Greg
--%>
<%@page import="OutlookRequest.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
        <%
        String datetime = request.getParameter("daetime");
        String studentid = request.getParameter("studentid");
        String lastname = request.getParameter("studentlastname");
        String firstname = request.getParameter("studentfirstname");
        String mail = request.getParameter("studentemail");
        
        OutlookInfo info = new OutlookInfo();
        info.set(firstname, lastname, mail, studentid, datetime);
        OutlookAppointmentRequest aptrequest = new OutlookAppointmentRequest();
        aptrequest.OutlookAPTrequest(info);
        %>
        
    </head>
</html>
