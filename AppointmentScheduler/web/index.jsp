<%-- 
    Document   : index
    Created on : Nov 28, 2014, 2:54:23 PM
    Author     : emily
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clarkson University//Schedule an Appointment with the Writing Center</title>
       <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
       <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
       <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
       <script src="datetimepicker.js"></script>
       <script src="newjavascript.js"></script>
       <link rel="stylesheet" type="text/css" href="css/stylesheet.css" /> 
       
       

    </head>
    <body>
        
       <div id="student">
            <h2></h2> <!-- Required div Starts Here -->
           <div id="form">
               <h3>Set an Appointment</h3>
            <center>
               <label>Writing Center Hours:</label><br>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>Monday - Thursday:</label> Noon - 5:00pm & 6:30pm - 8:00pm<br>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>Friday:</label> Noon - 2:30pm<br>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>Sunday:</label> 6:00pm - 8:00pm<br><br>
               </center>
  
  <label>Select a date & time:</label>
  <input type="text" name="datetimepicker" id="datetimepicker" />

      <script> 
$(document).ready(function(){
    $('#datetimepicker').datetimepicker({
	controlType: 'select',
        dateFormat: 'yy-mm-dd', 
        timeFormat: 'HH:mm:ss',
        hourMin: 12,
	hourMax: 20,
        stepMinute: 30,
        secondMax:00
    });
});
</script>
  <input id="checkavail" name="checkavail" type="button" value="Check Availability" />
      <br><br>
            
            
            
            
                <div id="studentform">
                    <h3>Student Information<input id="expand" type="button" value="+"><input id="collapse" type="button" value="-"></h3>
                <div id="studentinfo">
                    <label>First Name:</label>
                    <input id="firstname" type="text"><br><br>
                    <label>Last Name:</label>
                    <input id="lastname" type="text"><br><br>
                    <label>Email:</label>
                    <input id="email" type="text"><br><br>
                    <label>Student Number:</label>
                    <input id="studentid" type="text"><br>
                    <%--<input name="standing" type="radio" value="undergraduate" />Undergraduate<br>
                    <div id="underoptions">
                    <select id="undergstanding">
                        <option value="Freshman">Freshman</option>
                        <option value="Sophomore">Sophomore</option>
                        <option value="Junior">Junior</option>
                        <option value="Senior">Senior</option>
                    </select>
                    </div>
                    <input name="standing" type="radio" value="graduate" />Graduate<br>
                     <div id="gradoptions">
                    <select id="gradstanding">
                        <option value="MS/MA">MS/MA</option>
                        <option value="DPT">DPT</option>
                        <option value="OT">OT</option>
                        <option value="PhD">PhD</option>
                    </select>
                    </div><br> --%><br>
                    <input id="submitstudent" type="button" value="Submit" />
                    
                </div>
            </div>
        
         <div id="app">
            <h1></h1> <!-- Required div Starts Here -->
            <div id="appform">
                <h3>Appointment Information</h3>
                <div>
                    <label>Is this project for a specific course?</label><br>
                    <input name="course" id="courseyes" type="radio" value="yes"> Yes <br>
                    <input name="course" id="courseno" type="radio" value="no"> No <br>
                    <div id="notcourse">
                        <label>What do you need help with?</label><br>
                        <input id="reason1" type="checkbox" value="Scholarship Essay"> Scholarship Essay <br>
                        <input id="reason2" type="checkbox" value="Study Abroad Essay"> Study Abroad Essay <br>
                        <input id="reason3" type="checkbox" value="Cover Letter"> Cover Letter <br>
                        <input id="reason4" type="checkbox" value="Resume"> Resume <br>
                        <input id="reason5" type="checkbox" value="Grad School Application Materials"> Grad School Application Materials <br>
                        <input id="reason6" type="checkbox" value="other"> Other <input id="reasonother" type="text" value="" /><br><br>
                        
                    </div>
                    <div id="courseinfo">
                        <label>Course:</label>
                        <input id="coursename" type="text" /><br><br>
                        <label>Instructor:</label>
                        <input id="instructor" type="text" /><br><br>
                        <label>Assignment Type:</label>
                        <input id="assigntype" type="text" />
                        <select id="progress" >
                            <option value="First Draft">First Draft?</option>
                            <option value="Second Draft">Second Draft?</option>
                            <option value="Final Draft">Final Draft?</option>
                            <option value="Other">Other</option>
                        </select><br>
                        <label> What do you hope to address as part of this session?</label><br>
                         <input id="goals1" type="checkbox" value="Clarify the assignment" > Clarify the Assignment (Have you spoken to your professor first)? <br>
                         <input id="goals2" type="checkbox" value="Thesis invention"> Thesis Invention (Ideas) <br>
                         <input id="goals3" type="checkbox" value="Thesis development"> Thesis Development (I have an idea but need help developing it) <br>
                         <input id="goals4" type="checkbox" value="Introduction paragraph"> Introduction Paragraph <br>
                         <input id="goals5" type="checkbox" value="Body/Mainpoint invention"> Body/Main Point Invention (Ideas) <br>
                         <input id="goals6" type="checkbox" value="Development of mainpoints"> Development of Main Points (I have some but need help developing them) <br>
                         <input id="goals7" type="checkbox" value="Organization, flow and transitions"> Organization, Flow and Transitions <br>
                         <input id="goals8" type="checkbox" value="Analysis"> Analysis <br>
                         <input id="goals9" type="checkbox" value="Integration of quotes"> Integration of Quotes <br>
                         <input id="goals10" type="checkbox" value="Writing and idea clarity"> Writing and Idea Clarity (Does the paper make sense?) <br>
                         <input id="goals11" type="checkbox" value="Grammar and mechanics"> Grammar & Mechanics <br>
                         <input id="goals12" type="checkbox" value="Sentence-level help"> Sentence-Level Help <br>
                         <input id="goals13" type="checkbox" value="Citation format"> Citation Format <br>
                         <input id="goals14" type="checkbox" value="other"> Other <input id="goalsother" type="text" name="other" /><br>
                         
                        </div>
                    <label> Are you required by your professor to visit?</label><br>
                    <input name="required" id="requiredyes" type="radio" value="Yes"> Yes <br>
                    <input name ="required" id="requiredno" type="radio" value="No"> No <br>
                    <div id="requiredvisit">
                        <label>Why?</label><br>
                        <input id="reasonrequired1" type="checkbox" value="Co-Writing Requirement"> Co-Writing Requirement<br>
                        <input id="reasonrequired2" type="checkbox" value="Professor Required"> Professor Required<br>
                        <input id="reasonrequired3" type="checkbox" value="other"> Other <input id="requiredother" type="text" name="other" /><br>
                    </div>
                    <label> Are you an ESL Student? </label><br>
                    <input name="esl" id="eslyes" type="radio" value="Yes"> Yes <br>
                    <input name ="esl" id="eslno" type="radio" value="No"> No <br>
               <%--     <label>Do any of these apply? (for internal use only; data is not shared):</label><br>
                    <input id="internaluse1" type="checkbox" value="CUPO"> CUPO<br>
                    <input id="internaluse2" type="checkbox" value="HEOP"> HEOP<br>
                    <input id="internaluse3" type="checkbox" value="Clarkson School"> Clarkson School<br>
                    <input id="internaluse4" type="checkbox" value="other"> Other <input id="internaluseother" type="text" name="other" /><br><br>
                    
                    --%>
                    
                    <input id="submitappointment" type="button" value="Submit" />
                </div>
                </div>
        </div>
  </div>
            </div>
        
    </body>
</html>
