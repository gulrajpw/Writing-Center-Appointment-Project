/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OutlookRequest;

/**
 *
 * @author Greg
 */
public class OutlookInfo {
    private String firstname, lastname, email, studentid, datetime;
    
    public OutlookInfo(){
        firstname = ""; lastname = ""; email = ""; studentid = ""; datetime = "";
    }
    
    public void set(String fname, String lname, String mail, String id, String time){
        this.firstname = fname;
        this.lastname = lname;
        this.email = mail;
        this.studentid = id;
        this.datetime = time;
    }    
    
    public String getEmail(){
        return email;
    }
    public String getName(){
        return lastname + ", " + lastname;
    }
    public String getId(){
        return studentid;  
    }
    
}

