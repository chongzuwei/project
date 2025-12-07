package com.secj3303.model;

/**
 * Admin model extending User for admin-specific properties.
 * Admins can manage users, resources, and view system statistics.
 */
public class Admin extends User {
    private String adminId;
    private String department;
    private String permissions;

    public Admin() {
        super();
    }

    public Admin(String email, String password, String firstName, String lastName) {
        super(email, password, UserRole.ADMIN, firstName, lastName);
    }

    public Admin(int userId, String email, String password, String firstName, String lastName) {
        super(userId, email, password, UserRole.ADMIN, firstName, lastName);
    }

    // Getters and Setters
    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPermissions() {
        return permissions;
    }

    public void setPermissions(String permissions) {
        this.permissions = permissions;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId='" + adminId + '\'' +
                ", department='" + department + '\'' +
                ", permissions='" + permissions + '\'' +
                "} " + super.toString();
    }
}
