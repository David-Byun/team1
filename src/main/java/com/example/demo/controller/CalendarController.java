package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {
    @RequestMapping("/calendar")
    public String Calendar(Model model) {
        model.addAttribute("center","calendar");
        return "index";
    }
}
