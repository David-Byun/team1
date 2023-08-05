package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {
	


	@GetMapping	("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/services")
	public String services(Model model){
		model.addAttribute("center","services");
		return "index";
	}

	@RequestMapping("/account")
	public String account() {
		return "account";
	}

	@RequestMapping("/form")
	public String form() {
		return "form";
	}

	@RequestMapping("/page")
	public String page() {
		return "page";
	}
}
