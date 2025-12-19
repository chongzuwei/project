package com.secj3303.model;

import javax.persistence.*;

/**
 * Student model extending User for student-specific properties.
 * Students can take assessments and view resources.
 */
@Entity
@Table(name = "students")
@PrimaryKeyJoinColumn(name = "user_id")
public class Student extends User {
    @Column(name = "student_id")
    private String studentId;
    
    private String major;
    
    @Column(name = "academic_year")
    private String academicYear;

    public Student() {
        super();
    }

    public Student(String email, String password, String firstName, String lastName) {
        super(email, password, UserRole.STUDENT, firstName, lastName);
    }

    public Student(int userId, String email, String password, String firstName, String lastName) {
        super(userId, email, password, UserRole.STUDENT, firstName, lastName);
    }

    // Getters and Setters
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getAcademicYear() {
        return academicYear;
    }

    public void setAcademicYear(String academicYear) {
        this.academicYear = academicYear;
    }

    @Override
    public String toString() {
        return "Student{" +
                "studentId='" + studentId + '\'' +
                ", major='" + major + '\'' +
                ", academicYear='" + academicYear + '\'' +
                "} " + super.toString();
    }
}
