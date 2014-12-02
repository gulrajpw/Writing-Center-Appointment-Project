/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $("#details").click(function(){
       var id = $("#details").name();
        $.ajax({
                type: "POST",
                url: "detailview.jsp",
                data: {"appid" : id}, 
                cache: false,
                success: function(result){
                  alert(result);
                  
                }
        });
    
    });
    
    return false;
});