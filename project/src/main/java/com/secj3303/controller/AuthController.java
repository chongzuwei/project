package com.secj3303.controller;

import com.secj3303.dao.UserDao;
import com.secj3303.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * AuthController handles user authentication including login, registration, and logout.
 * Routes users to role-based pages after successful login.
 */
@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserDao userDao;
    
    // Store pending professionals for verification (in-memory for now)
    private static final Map<String, Professional> pendingProfessionals = new ConcurrentHashMap<>();
    
    // Upload directory for verification documents
    private static final String UPLOAD_DIR = "uploads/verifications/";

    /**
     * Show registration page
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String showRegisterPage(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    /**
     * Handle user registration
     * Creates a new user with the specified role and redirects to login
     * For professionals, requires verification document upload
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
        public String registerUser(
            @RequestParam(required = false) String email,
            @RequestParam(required = false) String password,
            @RequestParam(required = false) String firstName,
            @RequestParam(required = false) String lastName,
            @RequestParam(required = false) String role,
            @RequestParam(required = false) String confirmPassword,
            @RequestParam(required = false) String professionalId,
            @RequestParam(required = false) String department,
            @RequestParam(required = false) String qualification,
            @RequestParam(required = false) String specialization,
            @RequestParam(required = false) String studentId,
            @RequestParam(required = false) String major,
            @RequestParam(required = false) String academicYear,
            @RequestParam(required = false) MultipartFile verificationDocument,
            HttpSession session,
            Model model,
            RedirectAttributes redirectAttributes) {

        // Validate input
        if (email == null || email.trim().isEmpty() || 
            password == null || password.trim().isEmpty() ||
            firstName == null || firstName.trim().isEmpty() ||
            lastName == null || lastName.trim().isEmpty() ||
            role == null || role.trim().isEmpty()) {
            model.addAttribute("error", "All fields are required");
            return "register";
        }
        
        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match");
            return "register";
        }

        // Create user based on role
        User user;
        UserRole userRole = UserRole.fromString(role);
        
        // Admin accounts cannot be registered; they are built-in only
        if (userRole == UserRole.ADMIN) {
            model.addAttribute("error", "Admin accounts cannot be registered. Please select Student or Professional.");
            return "register";
        }
        
        try {
            switch (userRole) {
                case STUDENT:
                    // Validate student-specific fields
                    if (studentId == null || studentId.trim().isEmpty() ||
                        major == null || major.trim().isEmpty() ||
                        academicYear == null || academicYear.trim().isEmpty()) {
                        model.addAttribute("error", "Student ID, Major, and Academic Year are required for student registration");
                        return "register";
                    }
                    
                    Student student = new Student(email, password, firstName, lastName);
                    student.setStudentId(studentId.trim());
                    student.setMajor(major.trim());
                    student.setAcademicYear(academicYear.trim());
                    user = student;
                    break;
                case PROFESSIONAL:
                    // Professionals require verification document
                    if (verificationDocument == null || verificationDocument.isEmpty()) {
                        model.addAttribute("error", "Verification document is required for professional registration");
                        return "register";
                    }

                    // Validate professional fields
                    if (professionalId == null || professionalId.trim().isEmpty() ||
                        department == null || department.trim().isEmpty() ||
                        qualification == null || qualification.trim().isEmpty() ||
                        specialization == null || specialization.trim().isEmpty()) {
                        model.addAttribute("error", "Professional ID, Department, Qualification and Specialization are required");
                        return "register";
                    }

                    Professional prof = new Professional(email, password, firstName, lastName);

                    // Save verification document
                    String docPath = saveVerificationDocument(verificationDocument, email);
                    if (docPath == null) {
                        model.addAttribute("error", "Failed to save verification document. Please try again.");
                        return "register";
                    }

                    prof.setProfessionalId(professionalId.trim());
                    prof.setDepartment(department.trim());
                    prof.setQualification(qualification.trim());
                    prof.setSpecialization(specialization.trim());
                    prof.setVerificationDocument(docPath);
                    prof.setVerificationStatus("PENDING");
                    prof.setSubmittedAt(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));

                    // Store in pending professionals for admin review
                    pendingProfessionals.put(normalizeEmail(email), prof);

                    user = prof;
                    break;
                default:
                    user = new User(email, password, userRole, firstName, lastName);
            }

            // Persist registration info in session so login can display correct name/email in profile
            session.setAttribute("registeredEmail", email);
            session.setAttribute("registeredFirstName", firstName);
            session.setAttribute("registeredLastName", lastName);
            session.setAttribute("registeredRole", userRole.name());

            // Set creation timestamp
            user.setCreatedAt(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));

            // Save user to database
            userDao.save(user);

            // Different success messages based on role
            if (userRole == UserRole.STUDENT) {
                redirectAttributes.addFlashAttribute("success", "Registration successful! Please log in.");
            } else if (userRole == UserRole.PROFESSIONAL) {
                redirectAttributes.addFlashAttribute("success", "Registration submitted successfully! Please wait for admin approval before logging in.");
            }
            
            return "redirect:/auth/login";

        } catch (Exception e) {
            model.addAttribute("error", "Registration failed: " + e.getMessage());
            return "register";
        }
    }

    /**
     * Show login page
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginPage() {
        return "index";
    }

    /**
     * Handle user login
     * Authenticates user and redirects to role-based home page
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginUser(
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam(required = false, defaultValue = "STUDENT") String role,
            HttpSession session,
            Model model) {

        // Validate input
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            model.addAttribute("error", "Email and password are required");
            return "index";
        }

        try {
            // Find user by email from database
            String normalizedEmail = normalizeEmail(email);
            User user = userDao.findByEmail(normalizedEmail);

            if (user == null) {
                model.addAttribute("error", "User not found. Please register first.");
                return "index";
            }

            // Verify password
            if (!user.getPassword().equals(password.trim())) {
                model.addAttribute("error", "Invalid email or password");
                return "index";
            }
            
            // Check if professional is approved
            if (user.getRole() == UserRole.PROFESSIONAL) {
                Professional prof = (Professional) user;
                if (prof.getVerificationStatus() == null || !prof.getVerificationStatus().equals("APPROVED")) {
                    model.addAttribute("error", "Your professional account is pending approval. Please wait for admin verification.");
                    return "index";
                }
            }

            // Store user in session
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userRole", user.getRole());
            session.setAttribute("userEmail", user.getEmail());
            session.setAttribute("userName", user.getFullName());

            // Redirect to role-based home page
            return redirectToRoleBasedHome(user.getRole());

        } catch (Exception e) {
            model.addAttribute("error", "Login failed: " + e.getMessage());
            return "index";
        }
    }

    /**
     * Handle profile updates for email, name, biography, and password
     */
    @RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
    public String updateProfile(
            @RequestParam(required = false) String email,
            @RequestParam(required = false) String firstName,
            @RequestParam(required = false) String lastName,
            @RequestParam(required = false) String biography,
            @RequestParam(required = false) String password,
            @RequestParam(required = false) String confirmPassword,
            HttpSession session,
            Model model) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            model.addAttribute("error", "Please log in to edit your profile.");
            return "index";
        }

        // Validate required fields
        if (email == null || email.trim().isEmpty() ||
            firstName == null || firstName.trim().isEmpty() ||
            lastName == null || lastName.trim().isEmpty()) {
            model.addAttribute("error", "Email, first name, and last name are required");
            return "edituser";
        }

        // If password provided, ensure confirmation matches
        if (password != null && !password.trim().isEmpty()) {
            if (!password.equals(confirmPassword)) {
                model.addAttribute("error", "Passwords do not match");
                return "edituser";
            }
        }

        // Update user fields
        user.setEmail(email.trim());
        user.setFirstName(firstName.trim());
        user.setLastName(lastName.trim());
        user.setBiography(biography != null ? biography.trim() : null);
        if (password != null && !password.trim().isEmpty()) {
            user.setPassword(password.trim());
        }

        // Save updated user to database
        userDao.save(user);

        // Update session attributes
        session.setAttribute("user", user);
        session.setAttribute("userEmail", user.getEmail());
        session.setAttribute("userName", user.getFullName());
        session.setAttribute("registeredFirstName", user.getFirstName());
        session.setAttribute("registeredLastName", user.getLastName());
        session.setAttribute("registeredEmail", user.getEmail());

        model.addAttribute("success", "Profile updated successfully");
        return redirectToRoleProfile(user.getRole());
    }

    /**
     * Helper method to redirect user to their role-based home page
     */
    private String redirectToRoleBasedHome(UserRole role) {
        switch (role) {
            case STUDENT:
                return "redirect:/homestudent";
            case PROFESSIONAL:
                return "redirect:/homeprof";
            case ADMIN:
                return "redirect:/homeadmin";
            default:
                return "redirect:/index";
        }
    }

    /**
     * Redirect to the appropriate profile page based on role
     */
    private String redirectToRoleProfile(UserRole role) {
        switch (role) {
            case STUDENT:
                return "redirect:/profilestudent";
            case PROFESSIONAL:
                return "redirect:/profileprof";
            case ADMIN:
                return "redirect:/profileadmin";
            default:
                return "redirect:/index";
        }
    }

    private String normalizeEmail(String email) {
        return email == null ? "" : email.trim().toLowerCase();
    }

    /**
     * Handle user logout
     * Clears session and redirects to login page
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutUser(HttpSession session) {
        // Invalidate session
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/auth/login";
    }

    /**
     * Check if user is logged in
     * Returns true if user exists in session, false otherwise
     */
    public static boolean isUserLoggedIn(HttpSession session) {
        return session != null && session.getAttribute("user") != null;
    }

    /**
     * Get current user from session
     */
    public static User getCurrentUser(HttpSession session) {
        if (session != null) {
            return (User) session.getAttribute("user");
        }
        return null;
    }

    /**
     * Get current user role from session
     */
    public static UserRole getCurrentUserRole(HttpSession session) {
        if (session != null) {
            Object role = session.getAttribute("userRole");
            if (role instanceof UserRole) {
                return (UserRole) role;
            }
        }
        return null;
    }

    /**
     * Save verification document to server
     */
    private String saveVerificationDocument(MultipartFile file, String email) {
        if (file == null || file.isEmpty()) {
            return null;
        }

        try {
            // Create upload directory if not exists
            Path uploadPath = Paths.get(UPLOAD_DIR);
            Files.createDirectories(uploadPath);

            // Generate unique filename
            String originalFilename = file.getOriginalFilename();
            String extension = originalFilename != null ? originalFilename.substring(originalFilename.lastIndexOf(".")) : ".pdf";
            String filename = normalizeEmail(email) + "_" + System.currentTimeMillis() + extension;
            Path filepath = uploadPath.resolve(filename);

            // Save file
            Files.write(filepath, file.getBytes());

            return UPLOAD_DIR + filename;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Show pending professional verifications (admin only)
     */
    @RequestMapping(value = "/verifyProfessionals", method = RequestMethod.GET)
    public String showPendingProfessionals(HttpSession session, Model model) {
        // Check if user is admin
        User user = (User) session.getAttribute("user");
        if (user == null || user.getRole() != UserRole.ADMIN) {
            model.addAttribute("error", "Access denied. Admin only.");
            return "index";
        }

        // Get all pending professionals
        List<Professional> pending = new ArrayList<>(pendingProfessionals.values());
        model.addAttribute("pendingProfessionals", pending);
        return "verifyProfessionals";
    }

    /**
     * Approve professional registration (admin only)
     */
    @RequestMapping(value = "/approveProfessional", method = RequestMethod.POST)
    public String approveProfessional(
            @RequestParam String email,
            HttpSession session,
            Model model) {
        // Check if user is admin
        User user = (User) session.getAttribute("user");
        if (user == null || user.getRole() != UserRole.ADMIN) {
            model.addAttribute("error", "Access denied. Admin only.");
            return "redirect:/auth/verifyProfessionals";
        }

        String normalizedEmail = normalizeEmail(email);
        Professional prof = pendingProfessionals.remove(normalizedEmail);

        if (prof == null) {
            model.addAttribute("error", "Professional not found in pending list.");
            return "redirect:/auth/verifyProfessionals";
        }

        // Update status and save to database
        prof.setVerificationStatus("APPROVED");
        userDao.save(prof);

        model.addAttribute("success", "Professional " + email + " has been approved.");
        return "redirect:/auth/verifyProfessionals";
    }

    /**
     * Reject professional registration (admin only)
     */
    @RequestMapping(value = "/rejectProfessional", method = RequestMethod.POST)
    public String rejectProfessional(
            @RequestParam String email,
            HttpSession session,
            Model model) {
        // Check if user is admin
        User user = (User) session.getAttribute("user");
        if (user == null || user.getRole() != UserRole.ADMIN) {
            model.addAttribute("error", "Access denied. Admin only.");
            return "redirect:/auth/verifyProfessionals";
        }

        String normalizedEmail = normalizeEmail(email);
        Professional prof = pendingProfessionals.remove(normalizedEmail);

        if (prof == null) {
            model.addAttribute("error", "Professional not found in pending list.");
            return "redirect:/auth/verifyProfessionals";
        }

        // Delete verification document
        if (prof.getVerificationDocument() != null) {
            try {
                Files.deleteIfExists(Paths.get(prof.getVerificationDocument()));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        model.addAttribute("success", "Professional " + email + " has been rejected.");
        return "redirect:/auth/verifyProfessionals";
    }
}
