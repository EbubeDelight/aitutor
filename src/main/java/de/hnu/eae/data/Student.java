package de.hnu.eae.data;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Student {
    @Id @GeneratedValue
    private Long matrNr;
    @Column(length=30)
    private String firstname;
    private String lastname;
    @Temporal(TemporalType.DATE)
    private Date dateOfBirth;
    @Column(length=30)
    private String placeOfBirth;
    @Column(length=30)
    private String nationality;
    @Column(length=30)
    private String countryOfResidence;

    public Student(Long matrNr, String firstname, String lastname, Date dateOfBirth, String placeOfBirth,
            String nationality, String countryOfResidence) {
        this.matrNr = matrNr;
        this.firstname = firstname;
        this.lastname = lastname;
        this.dateOfBirth = dateOfBirth;
        this.placeOfBirth = placeOfBirth;
        this.nationality = nationality;
        this.countryOfResidence = countryOfResidence;
    
    }
    public Student(){

    }

    public Long getMatrNr() {
        return matrNr;
    }
    public void setMatrNr(Long matrNr) {
        this.matrNr = matrNr;
    }
    public String getFirstname() {
        return firstname;
    }
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }
    public String getLastname() {
        return lastname;
    }
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
    public Date getDateOfBirth() {
        return dateOfBirth;
    }
    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    public String getPlaceOfBirth() {
        return placeOfBirth;
    }
    public void setPlaceOfBirth(String placeOfBirth) {
        this.placeOfBirth = placeOfBirth;
    }
    public String getNationality() {
        return nationality;
    }
    public void setNationality(String nationality) {
        this.nationality = nationality;
    }
    public String getCountryOfResidence() {
        return countryOfResidence;
    }
    public void setCountryOfResidence(String countryOfResidence) {
        this.countryOfResidence = countryOfResidence;
    }

    
    
}
