/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(document).ready(function(){
    $("#time2").hide();
    $("#date2").hide();
    $("#tutor2").hide();
    $("#notes2").hide();
    $("#save").hide();
    $("#student2").hide();
    $("#email2").hide();
    $("#course2").hide();
    $("#instructor2").hide();
    $("#assigntype2").hide();
    $("#progress2").hide();
    $("#reasons2").hide();
    $("#required2").hide();
    $("#requiredreason2").hide();
    $("#esl2").hide();
   
    $("#edit").click(function(){
        $("#time2").show();
        $("#date2").show();
        $("#tutor2").show();
        $("#notes2").show();
        $("#student2").show();
        $("#email2").show();
        $("#course2").show();
        $("#instructor2").show();
        $("#assigntype2").show();
        $("#progress2").show();
        $("#reasons2").show();
        $("#requiredreason2").show();
        $("#required2").show();
        $("#esl2").show();
        $("#save").show();
        $("#time").hide();
        $("#date").hide();
        $("#tutor").hide();
        $("#notes").hide();
        $("#student").hide();
        $("#email").hide();
        $("#course").hide();
        $("#instructor").hide();
        $("#assignmenttype").hide();
        $("#progress").hide();
        $("#reasons").hide();
        $("#required").hide();
        $("#esl").hide();
        $("#requiredreason").hide();
        $("#edit").hide();
    });
    
    $("#save").click(function(){
        var id = $("#id").val();
        var tutor = $("#tutor2").val();
        var notes = $("#notes2").val();
        
         // AJAX Code To Submit Form.
          $.ajax({
                type: "POST",
                url: "editsubmit.jsp",
                data: { "tutor" : tutor,
                         "notes" : notes }, 
                cache: false,
                success: function(result){
                        alert("Your changes have been saved.");
                            $("#time2").hide();
                            $("#date2").hide();
                            $("#tutor2").hide();
                            $("#notes2").hide();
                            $("#save").hide();
                            $("#student2").hide();
                            $("#email2").hide();
                            $("#course2").hide();
                            $("#instructor2").hide();
                            $("#assigntype2").hide();
                            $("#progress2").hide();
                            $("#reasons2").hide();
                            $("#required2").hide();
                            $("#requiredreason2").hide();
                            $("#esl2").hide();
                            $("#time").show();
                            $("#date").show();
                            $("#tutor").show();
                            $("#notes").show();
                            $("#student").show();
                            $("#email").show();
                            $("#course").show();
                            $("#instructor").show();
                            $("#assignmenttype").show();
                            $("#progress").show();
                            $("#reasons").show();
                            $("#requiredreasons").show();
                            $("#edit").show();
                        
                }
                
        });
        
    });
    
});