package com.secj3303.model;

import javax.persistence.*;

/**
 * Resource model for mental health resources uploaded by professionals
 */
@Entity
@Table(name = "resources")
public class Resource {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "resource_id")
    private int resourceId;
    
    private String title;
    private String description;
    private String category;
    
    @Column(name = "file_url")
    private String fileUrl;
    
    @Column(name = "uploaded_by")
    private String uploadedBy; // Professional email
    
    @Column(name = "uploaded_by_name")
    private String uploadedByName; // Professional full name
    
    @Column(name = "created_at")
    private String createdAt;
    
    @Column(name = "updated_at")
    private String updatedAt;

    // Constructors
    public Resource() {
    }

    public Resource(String title, String description, String category, String fileUrl, String uploadedBy, String uploadedByName) {
        this.title = title;
        this.description = description;
        this.category = category;
        this.fileUrl = fileUrl;
        this.uploadedBy = uploadedBy;
        this.uploadedByName = uploadedByName;
    }

    public Resource(int resourceId, String title, String description, String category, String fileUrl, 
                    String uploadedBy, String uploadedByName, String createdAt, String updatedAt) {
        this.resourceId = resourceId;
        this.title = title;
        this.description = description;
        this.category = category;
        this.fileUrl = fileUrl;
        this.uploadedBy = uploadedBy;
        this.uploadedByName = uploadedByName;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getters and Setters
    public int getResourceId() {
        return resourceId;
    }

    public void setResourceId(int resourceId) {
        this.resourceId = resourceId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public String getUploadedBy() {
        return uploadedBy;
    }

    public void setUploadedBy(String uploadedBy) {
        this.uploadedBy = uploadedBy;
    }

    public String getUploadedByName() {
        return uploadedByName;
    }

    public void setUploadedByName(String uploadedByName) {
        this.uploadedByName = uploadedByName;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Resource{" +
                "resourceId=" + resourceId +
                ", title='" + title + '\'' +
                ", category='" + category + '\'' +
                ", uploadedBy='" + uploadedBy + '\'' +
                ", createdAt='" + createdAt + '\'' +
                '}';
    }
}
