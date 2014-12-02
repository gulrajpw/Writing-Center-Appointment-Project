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
                    alert(result);
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
        var assignmenttype;
        if($("#courseyes"))
        {
            course = $("#courseyes").val();
            assignmenttype = $("#assigntype").val();
        }
        else if($("#courseno"))
        {
            course = $("#courseno").val();
            assignmenttype = $("#reason").val();
        }
        var coursename = $("#coursename").val();
        var instructor = $("#instructor").val();
        var studentid = $("#studentid").val();
        var progress = $("#drafts").val();
        var goals;
        if($("#goals1"))
        {
            goals += $("#goals1").val() +", ";
        }
        if($("#goals2"))
        {
            goals += $("#goals2").val() +", ";
        }
        if($("#goals3"))
        {
            goals += $("#goals3").val() +", ";
        }
        if($("#goals4"))
        {
            goals += $("#goals4").val() +", ";
        }
        if($("#goals5"))
        {
            goals += $("#goals5").val() +", ";
        }
        if($("#goals6"))
        {
            goals += $("#goals6").val() +", ";
        }
        if($("#goals7"))
        {
            goals += $("#goals7").val() +", ";
        }
        if($("#goals8"))
        {
            goals += $("#goals8").val() +"\n";
        }
        if($("#goals9"))
        {
            goals += $("#goals9").val() +"\n";
        }
        if($("#goals10"))
        {
            goals += $("#goals10").val() +"\n";
        }
        if($("#goals11"))
        {
            goals += $("#goals11").val() +"\n";
        }
        if($("#goals12"))
        {
            goals += $("#goals12").val()+"\n";
        }
        if($("#goals13"))
        {
            goals += $("#goals13").val()+"\n";
        }
        if($("#goals14"))
        {
            goals += $("#goalsother").val()+"\n";
        }
        var required;
        if($("#requiredyes"))
        {
            required = $("#requiredyes").val();
        }
        else if($("requiredno"))
        {
            required = $("requiredno").val();
        }
        var reasonrequired = $("#reasonrequired").val();
        var datetime = $('#datetimepicker').val();
        
        var esl;
        if($("#eslyes"))
        {
            esl = $("#eslyes").val();
        }
        else if($("eslno"))
        {
            esl = $("eslno").val();
        }
        

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
                data: { "studentid" : studentid,
                    "datetime" : datetime,
                    "coursename" : coursename,
                     "instructor" : instructor, 
                     "assignmenttype" : assignmenttype,
                      "progress" : progress,
                      "reasons" : goals,
                      "required" : required,
                      "reasonrequired" : reasonrequired,
                      "esl" : esl
                       }, 
                cache: false,
                success: function(result){
                    alert(result);
                    window.location = "calendar.jsp";
            }
        });
    }
    return false;
});



});


