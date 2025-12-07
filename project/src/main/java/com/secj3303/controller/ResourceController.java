package com.secj3303.controller;

import com.secj3303.model.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

/**
 * ResourceController handles mental health resource management
 */
@Controller
@RequestMapping("/resource")
public class ResourceController {

    // In-memory storage for resources
    private static final Map<Integer, Resource> resourceStore = new ConcurrentHashMap<>();
    private static final AtomicInteger resourceIdCounter = new AtomicInteger(1);
    
    // Upload directory for resource files
    private static final String RESOURCE_UPLOAD_DIR = "uploads/resources/";

    /**
     * Get count of resources uploaded by a specific email
     */
    public static long getResourceCountByEmail(String email) {
        if (email == null) return 0;
        return resourceStore.values().stream()
                .filter(r -> r != null && email.equalsIgnoreCase(r.getUploadedBy()))
                .count();
    }

    /**
     * Show resource upload form for professionals
     */
    @RequestMapping(value = "/upload", method = RequestMethod.GET)
    public String showUploadForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null || user.getRole() != UserRole.PROFESSIONAL) {
            model.addAttribute("error", "Access denied. Professionals only.");
            return "redirect:/index";
        }
        return "resourceUpload";
    }

    /**
     * Handle resource upload by professionals
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String uploadResource(
            @RequestParam(required = false) String title,
            @RequestParam(required = false) String description,
            @RequestParam(required = false) String category,
            @RequestParam(required = false) MultipartFile resourceFile,
            HttpSession session,
            Model model) {

        User user = (User) session.getAttribute("user");
        if (user == null || user.getRole() != UserRole.PROFESSIONAL) {
            model.addAttribute("error", "Access denied. Professionals only.");
            return "redirect:/index";
        }

        // Validate input
        if (title == null || title.trim().isEmpty() || 
            description == null || description.trim().isEmpty() ||
            category == null || category.trim().isEmpty()) {
            model.addAttribute("error", "Title, description, and category are required");
            return "resourceUpload";
        }

        // Debug: Log file information
        System.out.println("DEBUG - File received: " + (resourceFile != null));
        if (resourceFile != null) {
            System.out.println("DEBUG - File name: " + resourceFile.getOriginalFilename());
            System.out.println("DEBUG - File size: " + resourceFile.getSize());
            System.out.println("DEBUG - Is empty: " + resourceFile.isEmpty());
        }

        if (resourceFile == null || resourceFile.isEmpty()) {
            model.addAttribute("error", "Please select a file to upload");
            return "resourceUpload";
        }

        try {
            // Save file
            String fileUrl = saveResourceFile(resourceFile, user.getEmail());
            if (fileUrl == null) {
                model.addAttribute("error", "Failed to save file. Please try again.");
                return "resourceUpload";
            }

            // Create resource
            Resource resource = new Resource(
                title.trim(),
                description.trim(),
                category.trim(),
                fileUrl,
                user.getEmail(),
                user.getFullName()
            );

            int resourceId = resourceIdCounter.getAndIncrement();
            resource.setResourceId(resourceId);
            resource.setCreatedAt(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
            resource.setUpdatedAt(resource.getCreatedAt());

            resourceStore.put(resourceId, resource);

            model.addAttribute("success", "Resource uploaded successfully!");
            return "redirect:/resourceprof";

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Upload failed: " + e.getMessage());
            return "resourceUpload";
        }
    }

    /**
     * View all resources for professionals (their own resources)
     */
    @RequestMapping(value = "/myresources", method = RequestMethod.GET)
    public String viewMyResources(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null || user.getRole() != UserRole.PROFESSIONAL) {
            model.addAttribute("error", "Access denied. Professionals only.");
            return "redirect:/index";
        }

        List<Resource> myResources = resourceStore.values().stream()
            .filter(r -> r.getUploadedBy().equalsIgnoreCase(user.getEmail()))
            .sorted((r1, r2) -> r2.getResourceId() - r1.getResourceId())
            .collect(Collectors.toList());

        model.addAttribute("resources", myResources);
        return "myResources";
    }

    /**
     * Show edit form for a resource
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String showEditForm(@PathVariable("id") int id, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null || user.getRole() != UserRole.PROFESSIONAL) {
            model.addAttribute("error", "Access denied.");
            return "redirect:/index";
        }

        Resource resource = resourceStore.get(id);
        if (resource == null) {
            model.addAttribute("error", "Resource not found");
            return "redirect:/resource/myresources";
        }

        if (!resource.getUploadedBy().equalsIgnoreCase(user.getEmail())) {
            model.addAttribute("error", "You can only edit your own resources");
            return "redirect:/resource/myresources";
        }

        model.addAttribute("resource", resource);
        return "resourceEdit";
    }

    /**
     * Update resource
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String updateResource(
            @PathVariable("id") int id,
            @RequestParam(required = false) String title,
            @RequestParam(required = false) String description,
            @RequestParam(required = false) String category,
            @RequestParam(required = false) MultipartFile resourceFile,
            HttpSession session,
            Model model) {

        User user = (User) session.getAttribute("user");
        if (user == null || user.getRole() != UserRole.PROFESSIONAL) {
            return "redirect:/index";
        }

        Resource resource = resourceStore.get(id);
        if (resource == null || !resource.getUploadedBy().equalsIgnoreCase(user.getEmail())) {
            model.addAttribute("error", "Resource not found or access denied");
            return "redirect:/resource/myresources";
        }

        // Validate
        if (title == null || title.trim().isEmpty() || 
            description == null || description.trim().isEmpty() ||
            category == null || category.trim().isEmpty()) {
            model.addAttribute("error", "All fields are required");
            model.addAttribute("resource", resource);
            return "resourceEdit";
        }

        try {
            // Update fields
            resource.setTitle(title.trim());
            resource.setDescription(description.trim());
            resource.setCategory(category.trim());

            // Update file if new one uploaded
            if (resourceFile != null && !resourceFile.isEmpty()) {
                // Delete old file
                try {
                    Files.deleteIfExists(Paths.get(resource.getFileUrl()));
                } catch (Exception e) {
                    e.printStackTrace();
                }

                // Save new file
                String newFileUrl = saveResourceFile(resourceFile, user.getEmail());
                if (newFileUrl != null) {
                    resource.setFileUrl(newFileUrl);
                }
            }

            resource.setUpdatedAt(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
            resourceStore.put(id, resource);

            model.addAttribute("success", "Resource updated successfully!");
            return "redirect:/resource/myresources";

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Update failed: " + e.getMessage());
            model.addAttribute("resource", resource);
            return "resourceEdit";
        }
    }

    /**
     * Delete resource
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public String deleteResource(@PathVariable("id") int id, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null || user.getRole() != UserRole.PROFESSIONAL) {
            return "redirect:/index";
        }

        Resource resource = resourceStore.remove(id);
        if (resource != null && resource.getUploadedBy().equalsIgnoreCase(user.getEmail())) {
            // Delete file
            try {
                Files.deleteIfExists(Paths.get(resource.getFileUrl()));
            } catch (Exception e) {
                e.printStackTrace();
            }
            model.addAttribute("success", "Resource deleted successfully");
        }

        return "redirect:/resource/myresources";
    }

    /**
     * View all resources for students (search and view)
     */
    @RequestMapping(value = "/browse", method = RequestMethod.GET)
    public String browseResources(
            @RequestParam(required = false) String search,
            @RequestParam(required = false) String category,
            HttpSession session,
            Model model) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/index";
        }

        List<Resource> allResources = new ArrayList<>();
        
        try {
            allResources = new ArrayList<>(resourceStore.values());
            
            // Remove null entries
            allResources.removeIf(r -> r == null);

            // Filter by search term
            if (search != null && !search.trim().isEmpty()) {
                String searchLower = search.trim().toLowerCase();
                allResources = allResources.stream()
                    .filter(r -> {
                        try {
                            String title = r.getTitle() != null ? r.getTitle().toLowerCase() : "";
                            String desc = r.getDescription() != null ? r.getDescription().toLowerCase() : "";
                            return title.contains(searchLower) || desc.contains(searchLower);
                        } catch (Exception e) {
                            return false;
                        }
                    })
                    .collect(Collectors.toList());
            }

            // Filter by category
            if (category != null && !category.trim().isEmpty() && !category.equals("All")) {
                String finalCategory = category.trim();
                allResources = allResources.stream()
                    .filter(r -> {
                        try {
                            String cat = r.getCategory() != null ? r.getCategory() : "";
                            return cat.equalsIgnoreCase(finalCategory);
                        } catch (Exception e) {
                            return false;
                        }
                    })
                    .collect(Collectors.toList());
            }

            // Sort by newest first
            try {
                allResources.sort((r1, r2) -> r2.getResourceId() - r1.getResourceId());
            } catch (Exception e) {
                System.out.println("Sort error: " + e.getMessage());
            }

        } catch (Exception e) {
            System.out.println("Browse error: " + e.getMessage());
            e.printStackTrace();
            model.addAttribute("error", "Error loading resources: " + e.getMessage());
        }
        
        // Always add resources, even if empty
        model.addAttribute("resources", allResources);
        model.addAttribute("searchTerm", search != null ? search : "");
        model.addAttribute("selectedCategory", category != null ? category : "");

        return "resourceBrowse";
    }

    /**
     * View single resource details
     */
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public String viewResource(@PathVariable("id") int id, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/index";
        }

        Resource resource = resourceStore.get(id);
        if (resource == null) {
            model.addAttribute("error", "Resource not found");
            return "redirect:/resource/browse";
        }

        model.addAttribute("resource", resource);
        return "resourceView";
    }

    /**
     * Save resource file to server
     */
    private String saveResourceFile(MultipartFile file, String email) {
        if (file == null || file.isEmpty()) {
            return null;
        }

        try {
            // Create upload directory if not exists
            Path uploadPath = Paths.get(RESOURCE_UPLOAD_DIR);
            Files.createDirectories(uploadPath);

            // Generate unique filename
            String originalFilename = file.getOriginalFilename();
            String extension = originalFilename != null ? originalFilename.substring(originalFilename.lastIndexOf(".")) : ".pdf";
            String filename = email.replaceAll("@", "_").replaceAll("\\.", "_") + "_" + System.currentTimeMillis() + extension;
            Path filepath = uploadPath.resolve(filename);

            // Save file
            Files.write(filepath, file.getBytes());

            return "/" + RESOURCE_UPLOAD_DIR + filename;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
