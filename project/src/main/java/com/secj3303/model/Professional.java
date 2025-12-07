package com.secj3303.model;

/**
 * Professional model extending User for professional-specific properties.
 * Professionals can upload resources and manage students.
 */
public class Professional extends User {
    private String professionalId;
    private String department;
    private String qualification;
    private String specialization;
    private String verificationDocument;  // Path to uploaded verification document
    private String verificationStatus;    // PENDING, APPROVED, REJECTED
    private String submittedAt;           // Timestamp when document was submitted

    public Professional() {
        super();
    }

    public Professional(String email, String password, String firstName, String lastName) {
        super(email, password, UserRole.PROFESSIONAL, firstName, lastName);
    }

    public Professional(int userId, String email, String password, String firstName, String lastName) {
        super(userId, email, password, UserRole.PROFESSIONAL, firstName, lastName);
    }

    // Getters and Setters
    public String getProfessionalId() {
        return professionalId;
    }

    public void setProfessionalId(String professionalId) {
        this.professionalId = professionalId;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public String getVerificationDocument() {
        return verificationDocument;
    }

    public void setVerificationDocument(String verificationDocument) {
        this.verificationDocument = verificationDocument;
    }

    public String getVerificationStatus() {
        return verificationStatus;
    }

    public void setVerificationStatus(String verificationStatus) {
        this.verificationStatus = verificationStatus;
    }

    public String getSubmittedAt() {
        return submittedAt;
    }

    public void setSubmittedAt(String submittedAt) {
        this.submittedAt = submittedAt;
    }

    @Override
    public String toString() {
        return "Professional{" +
                "professionalId='" + professionalId + '\'' +
                ", department='" + department + '\'' +
                ", qualification='" + qualification + '\'' +
                ", specialization='" + specialization + '\'' +
                ", verificationStatus='" + verificationStatus + '\'' +
                "} " + super.toString();
    }
}
