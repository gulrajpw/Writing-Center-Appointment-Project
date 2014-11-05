<%-- 
    Document   : AppointmentForm
    Created on : Oct 2, 2014, 5:50:59 PM
    Author     : Patrick /whoever else


-This is the .JSP form which is filled out by the student. 
-The student information goes to CollectStudentInfo.JSP where the inline java code is located.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Clarkson University Writing Center Schedule Form</title>
    </head>
    
    
    
    <body>
        
        <%
            //The appointment info is not being filled here.
            //It needs a text area, not a button to be filled.
            //Just not sure how to do it right now.
            %>
        
        <h1>Please fill out this form to create an appointment</h1>
        <form name ="Input" action ="CollectStudentInfo.jsp" method="Post">
            Enter your name:
            <input type="text" name="StudentName" /><br>
            
            Enter your email address:
            <input type="text" name="StudentEmail" /><br>
            
           Enter your student number:
           <input type= "text" name ="StudentNumber" /><br>
                   
           Enter your student status:
           
           <% //Need to figure out what to do with these data fields.    %>
           Undergraduate:
            <input type="checkbox" name="Freshman" checked="checked" value="Freshman" /> Freshman
            <input type="checkbox" name="Sophomore" value="Sophomore"  /> Sophomore 
            <input type="checkbox" name="Junior" checked="checked" value="Junior" /> Junior
            <input type="checkbox" name="Senior" checked="checked" value="Senior" /> Senior
                                                
           Graduate:
             <input type="checkbox" name="MS/MA" checked="checked" value= "MS/MA"  /> MS/MA
             <input type="checkbox" name="DPT" checked="checked" value= "DPT"  /> DPT
             <input type="checkbox" name="OT" checked="checked"  value= "OT" /> OT
             <input type="checkbox" name="PhD" checked="checked" value = "PhD" /> PhD
            
             
            Enter your assignment type:
            <input type ="text" name="AssignmentType" /><br>
              
           Enter the professor name:
           <input type ="text" name ="professorName" /><br>
                
           Enter your course name:
           <input type="text" name ="courseName"/><br>
           
           
           <input type ="submit" value="OK"/>   <% //the submit button %>
           
        </form>
        
        
        
    </body>
 </html>
