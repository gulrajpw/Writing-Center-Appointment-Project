<%-- 
    Document   : CollectStudentInfo
    Created on : Oct 2, 2014, 5:54:04 PM
    Author     : Patrick
--%>

<%@page import = "java.util.List"%>
<%@page import = "ClarksonStudent.Student"%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Info</title>
    </head>
    <body>
        <h1>Student </h1>
        
        <%
            //The appointment info List is not being filled here
            //This information needs to be sent out to the writing center somehow.
            
            String StudentName = request.getParameter("StudentName");
            String email = request.getParameter("StudentEmail");
            String StudentNumber = request.getParameter("StudentNumber");
            String professorName = request.getParameter("professorName");
            String courseName = request.getParameter("courseName");
            /*Create new instance of a student to be used for the database.
              This student object is missing the "description about meeting" currently*/
            Student s1 = new Student(StudentName, email, StudentNumber, professorName, courseName);
                   
                   
                   
        %>
            
            
        
        
        
        
    </body>
</html>
