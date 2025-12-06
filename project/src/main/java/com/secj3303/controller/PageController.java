package com.secj3303.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

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
    public String profileProf() {
        return "profileprof";
    }

    // Admin Pages
    @RequestMapping("/homeadmin")
    public String homeAdmin() {
        return "homeadmin";
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
