package com.alkemy.challenge.controller;


import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class LoginController {
    
    @GetMapping("/login")
    public String irPLogin () {
        return "login";
    }
    
    @GetMapping("/admin/logout")
    public String logoutAdmin() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return "redirect:/login?logout=true";
    }
    
    @GetMapping("/estudiante/logout")
    public String logoutEstudiante() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return "redirect:/login?logout=true";
    }
    

}
