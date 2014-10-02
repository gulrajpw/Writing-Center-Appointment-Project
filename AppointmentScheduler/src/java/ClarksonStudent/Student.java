package ClarksonStudent;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Patrick Gulrajani / Whoever adds to it
 */
import java.util.List;

public class Student {
    
    private String StudentName;
    private String StudentEmail;
    private int StudentNumber;
    private String professorName;
    private List<String> ApptInfo;
    private String courseName; //CS350
    
    
    public String getStudentName()
    {        return StudentName;
   
    }
    
    public String getStudentEmail()
    {
    return StudentEmail;    
    
    }
    
    public int getStudentNumber()
    {
     return StudentNumber;   
    }
    
    public String getProfessorName()
    {
     return professorName;   
    }
    
    public List<String> getApptInfo() // This list contains something like a paragraph description that the student adds
                                        //Example: I need help with this because I'm a failure.
    {
        
    return ApptInfo;
    }
    
    public String getCourseName()
    {
    return courseName;    
    
    }
    
}
