/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $("#appointmentdetails").hide();
    
    $("#details").click(function(){
       var id = $("#details").name();
        $.ajax({
                type: "POST",
                url: "writingcenterappointments.jsp",
                data: {"appid" : id}, 
                cache: false,
                success: function(result){
                  alert(result);
                  $("#appointmentdetails").show();
            }
        });
    
    });
    
    return false;
});