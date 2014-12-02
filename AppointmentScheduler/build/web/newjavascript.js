/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    $('#expand').hide();
    $('#collapse').hide();
    $('#app').hide();
    $('#courseinfo').hide();
    $('#notcourse').hide();
    $('#requiredvisit').hide();
    $('#underoptions').hide();
    $('#gradoptions').hide();
    
    $("#undergrad").on('click', function(){
       if($("#gradoptions").show()){
           $("#gradoptions").hide();
       } 
       $("#underoptions").show();
    });
    
     $("#grad").on('click', function(){
       if($("#underoptions").show()){
           $("#underoptions").hide();
       } 
       $("#gradoptions").show();
    });
   
   $("#checkavail").on('click', function(){
       var date = $("#datetimepicker").val();
        $.ajax({
                type: "POST",
                url: "availabledates.jsp",
                data: {"datetime" : date}, 
                cache: false,
                success: function(result){
                 alert(result);
            }
        });
       
   });
   
    $('#courseyes').on('click', function(){
        $('#courseinfo').show();
        if($('#notcourse').show())
        {
            $('#notcourse').hide();
        }
    });
                
    $('#courseno').on('click', function(){
        $('#notcourse').show();
        if($('#courseinfo').show()){
            $('#courseinfo').hide();
        }
    });
           
    $('#requiredyes').on('click', function(){
        $('#requiredvisit').show();
    });
    $('#requiredno').on('click', function(){
        $('#requiredvisit').hide();
    });
           
    
    $("#submitstudent").click(function(){
        var firstname = $("#firstname").val();
        var lastname = $("#lastname").val();
        var email = $("#email").val();
        var studentid = $("#studentid").val();

        // Returns successful data submission message when the entered information is stored in database.
        if(lastname==''||firstname==''||email==''||studentid=='')
        {
            alert("Please Fill All Fields");
        }
        else
        {
            // AJAX Code To Submit Form.
            $.ajax({
                type: "POST",
                url: "studentsubmit.jsp",
                data: { "studentlastname" : lastname, "studentfirstname" : firstname, "studentemail" : email, "studentnum" : studentid }, 
                cache: false,
                success: function(result){
                    $('#studentinfo').hide();
                    document.getElementById("submitstudent").disabled = true;
                    $('#expand').show();
                    $('#app').show();
                    //alert(result);
                 }
                     
         
        });
    }
    return false;
});


$('#expand').click(function(){
    $('#studentinfo').show();
    $('#expand').hide();
    $('#collapse').show();
});

$('#collapse').click(function(){
    $('#studentinfo').hide();
    $('#expand').show();
    $('#collapse').hide();
});

$("#submitappointment").click(function(){
        var course;
        var coursename;
        var instructor;
        var assignmenttype;
        var internaluse;
        var progress;
        if($("#courseyes").is(":checked"))
        {
            course = $("#courseyes").val();
            assignmenttype = $("#assigntype").val();
            coursename = $("#coursename").val();
            instructor = $("#instructor").val();
            progress = $("#progress option:selected").val();
        }
        else if($("#courseno").is(":checked"))
        {
            course = $("#courseno").val();
            if($("#reason1").is(":checked")){
                assignmenttype = $("#reason1").val();
            }
            else if($("#reason2").is(":checked")){
                assignmenttype = $("#reason2").val();
            }
            else if($("#reason3").is(":checked")){
                assignmenttype = $("#reason3").val();
            }
            else if($("#reason3").is(":checked")){
                assignmenttype = $("#reason3").val();
            }
            else if($("#reason4").is(":checked")){
                assignmenttype = $("#reason4").val();
            }
            else if($("#reason5").is(":checked")){
                assignmenttype = $("#reason5").val();
            }
            else if($("#reason6").is(":checked")){
                assignmenttype = $("#reasonother").val();
            }
        }
        var studentid = $("#studentid").val();
        var goals = "";
        if($("#goals1").is(":checked"))
        {
            goals += $("#goals1").val() +", ";
        }
        if($("#goals2").is(":checked"))
        {
            goals += $("#goals2").val() +", ";
        }
        if($("#goals3").is(":checked"))
        {
            goals += $("#goals3").val() +", ";
        }
        if($("#goals4").is(":checked"))
        {
            goals += $("#goals4").val() +", ";
        }
        if($("#goals5").is(":checked"))
        {
            goals += $("#goals5").val() +", ";
        }
        if($("#goals6").is(":checked"))
        {
            goals += $("#goals6").val() +", ";
        }
        if($("#goals7").is(":checked"))
        {
            goals += $("#goals7").val() +", ";
        }
        if($("#goals8").is(":checked"))
        {
            goals += $("#goals8").val() +", ";
        }
        if($("#goals9").is(":checked"))
        {
            goals += $("#goals9").val() +", ";
        }
        if($("#goals10").is(":checked"))
        {
            goals += $("#goals10").val() +", ";
        }
        if($("#goals11").is(":checked"))
        {
            goals += $("#goals11").val() +", ";
        }
        if($("#goals12").is(":checked"))
        {
            goals += $("#goals12").val()+", ";
        }
        if($("#goals13").is(":checked"))
        {
            goals += $("#goals13").val()+", ";
        }
        if($("#goals14").is(":checked"))
        {
            goals += $("#goalsother").val()+", ";
        }
        var required = $('input:radio[name=required]:checked').val();
        var reasonrequired = "";
        if($("#requiredyes").is(":checked"))
        {
            if($("#reasonrequired1").is(":checked"))
            {
                        reasonrequired = $("#reasonrequired1").val() + ", ";
            }
            if($("#reasonrequired2").is(":checked"))
            {
                        reasonrequired = $("#reasonrequired2").val() + ", ";
            }
             if($("#reasonrequired3").is(":checked"))
            {
                        reasonrequired = $("#requiredother").val() + ", ";
            }
        }
        var datetime = $('#datetimepicker').val();
        
        var esl = $('input:radio[name=esl]:checked').val();
        
        var firstname = $("#firstname").val();
        var lastname = $("#lastname").val();
        var email = $("#email").val();
        

        // Returns successful data submission message when the entered information is stored in database
        if(course==''||required=='')
        {
            alert("Please Fill All Fields");
        }
        else
        {
            // AJAX Code To Submit Form.
            $.ajax({
                type: "POST",
                url: "appointmentsubmit.jsp",
                data: { "firstname" : firstname,
                    "lastname" : lastname,
                    "email" : email,
                    "studentid" : studentid,
                    "datetime" : datetime,
                    "coursename" : coursename,
                     "instructor" : instructor, 
                     "assignmenttype" : assignmenttype,
                      "progress" : progress,
                      "reasons" : goals,
                      "required" : required,
                      "reasonrequired" : reasonrequired,
                      "esl" : esl,
                      "internaluse" : internaluse
                       }, 
                cache: false,
                success: function(result){
                        alert("You've successfully requested an appointment with the Writing Center.");
                        window.location = "index.jsp";
                },
                error: function(xhr, message, thrownError){
                        alert("Error\n\nPlease select an available date and time.");
                        
                }
        });
    }
    return false;
});



});


