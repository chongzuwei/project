package com.secj3303.controller;

import com.secj3303.dao.ResourceDao;
import com.secj3303.dao.UserDao;
import com.secj3303.model.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class PageController {

    @Autowired
    private ResourceDao resourceDao;

    @Autowired
    private UserDao userDao;

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/index")
    public String indexPage() {
        return "index";
    }

    // Student Pages
    @RequestMapping("/homestudent")
    public String homeStudent() {
        return "homestudent";
    }

    @RequestMapping("/resourcestudent")
    public String resourceStudent() {
        return "resourcestudent";
    }

    @RequestMapping("/profilestudent")
    public String profileStudent() {
        return "profilestudent";
    }

    @RequestMapping("/selfAssessment")
    public String selfAssessment() {
        return "selfAssessment";
    }

    @RequestMapping("/phq9")
    public String phq9() {
        return "phq9";
    }

    @RequestMapping("/result")
    public String result() {
        return "result";
    }

    @RequestMapping("/history")
    public String history() {
        return "history";
    }

    @RequestMapping("/activity")
    public String activity() {
        return "activity";
    }

    @RequestMapping("/communitySharing")
    public String communitySharing() {
        return "communitySharing";
    }

    // Professional Pages
    @RequestMapping("/homeprof")
    public String homeProf() {
        return "homeprof";
    }

    @RequestMapping("/resourceprof")
    public String resourceProf() {
        return "resourceprof";
    }

    @RequestMapping("/profileprof")
    public String profileProf(HttpSession session, Model model) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail != null) {
            List<Resource> userResources = resourceDao.findByUploaderEmail(userEmail);
            long resourceCount = userResources != null ? userResources.size() : 0L;
            model.addAttribute("resourceCount", resourceCount);
        } else {
            model.addAttribute("resourceCount", 0L);
        }
        return "profileprof";
    }

    // Admin Pages
    @RequestMapping("/homeadmin")
    public String homeAdmin() {
        return "homeadmin";
    }

    @RequestMapping("/profileadmin")
    public String profileAdmin(HttpSession session, Model model) {
        // Basic admin stats
        try {
            List<Resource> allResources = resourceDao.findAll();
            long resourceCount = allResources != null ? allResources.size() : 0L;

            long userCount = 0L;
            try {
                userCount = userDao.findAll().size();
            } catch (Exception ignore) {
                // fallback: leave as 0
            }

            model.addAttribute("resourceCount", resourceCount);
            model.addAttribute("userCount", userCount);
        } catch (Exception e) {
            model.addAttribute("resourceCount", 0L);
            model.addAttribute("userCount", 0L);
        }
        return "profileadmin";
    }

    @RequestMapping("/dashboardpage")
    public String dashboardPage() {
        return "dashboardpage";
    }

    @RequestMapping("/edituser")
    public String editUser() {
        return "edituser";
    }

    // Auth
    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("/post")
    public String post() {
        return "post";
    }
}
