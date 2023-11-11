package com.example.demo.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExceptionController implements ErrorController {
    @GetMapping("/error")
    public String exceptionPage(Model model) throws Exception {
        model.addAttribute("center","error");
        return "index";
    };
}
