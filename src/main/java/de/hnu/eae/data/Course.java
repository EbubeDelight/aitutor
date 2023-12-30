package de.hnu.eae.data;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Course {
    @Id @GeneratedValue
    private Long id;
    @Column(length=30)
    private String title;
    private int courseEcts;
    @Column(length=3)
    private String courseSemester;
    
   

    public Course(Long id, String title, String courseSemester, int courseEcts 
            ) {
        this.id = id;
        this.title = title;
        this.courseSemester = courseSemester;
        this.courseEcts = courseEcts;
    
    }
    public Course(){

    }

    public Long id() {
        return id;
    }
    public void setid(Long id) {
        this.id = id;
    }
    public String title() {
        return title;
    }
    public void settitle(String title) {
        this.title = title;
    }
    public String courseSemester() {
        return courseSemester;
    }
    public void setcourseSemester(String courseSemester) {
        this.courseSemester = courseSemester;
    }
    public int courseEcts() {
        return courseEcts;
    }
    public void courseEcts(int courseEcts) {
        this.courseEcts = courseEcts;
    }


    
    
}
