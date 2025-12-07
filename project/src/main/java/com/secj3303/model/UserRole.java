package com.secj3303.model;

public enum UserRole {
    STUDENT("student"),
    PROFESSIONAL("professional"),
    ADMIN("admin");

    private final String displayName;

    UserRole(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }

    public static UserRole fromString(String role) {
        for (UserRole userRole : UserRole.values()) {
            if (userRole.displayName.equalsIgnoreCase(role) || userRole.name().equalsIgnoreCase(role)) {
                return userRole;
            }
        }
        throw new IllegalArgumentException("Invalid role: " + role);
    }
}
