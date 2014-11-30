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
    
    private static String StudentName;
    private static String StudentEmail;
    private static int StudentNumber;
    private static String professorName;
    private static List<String> ApptInfo;
    private static String courseName; //CS350
    private static String AssignmentType;
    
    
    public Student() {};
    public Student(String studentName, String email, int number, String profName, String courseName, String AssignmentType) {}; // default constructor
            
    public static String getAssignmentType()
    {
        return AssignmentType;
    }
    
    
    public static String getStudentName()
    {        return StudentName;
   
    }
    
    public static String getStudentEmail()
    {
    return StudentEmail;    
    
    }
    
    public static int getStudentNumber()
    {
     return StudentNumber;   
    }
    
    public static String getProfessorName()
    {
     return professorName;   
    }
    
    public static List<String> getApptInfo() // This list contains something like a paragraph description that the student adds
                                        //Example: I need help with this because I'm a failure.
    {
        
    return ApptInfo;
    }
    
    public static String getCourseName()
    {
    return courseName;    
    
    }

    /**
     * @param StudentName the StudentName to set
     */
    public void setStudentName(String StudentName) {
        this.StudentName = StudentName;
    }

    /**
     * *
     * 
     * @param AssignmentType the AssignmentType to set 
     */
    public void setAssignmentType(String AssignmentType)
    {
    this.AssignmentType = AssignmentType;    
    }
    
    /**
     * @param StudentEmail the StudentEmail to set
     */
    public void setStudentEmail(String StudentEmail) {
        this.StudentEmail = StudentEmail;
    }

    /**
     * @param StudentNumber the StudentNumber to set
     */
    public void setStudentNumber(int StudentNumber) {
        this.StudentNumber = StudentNumber;
    }

    /**
     * @param professorName the professorName to set
     */
    public void setProfessorName(String professorName) {
        this.professorName = professorName;
    }

    /**
     * @param ApptInfo the ApptInfo to set
     */
    public void setApptInfo(List<String> ApptInfo) {
        this.ApptInfo = ApptInfo;
    }

    /**
     * @param courseName the courseName to set
     */
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
    
}
