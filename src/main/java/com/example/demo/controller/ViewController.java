package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class ViewController {

	@RequestMapping	("/login")
	public String login(Model model) {
		model.addAttribute("center", "login");
		return "index";
	}
	@GetMapping	("/logout")
	public String logout( HttpSession session) {
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}

	@RequestMapping("/services")
	public String services(Model model){
		model.addAttribute("center","services");
		return "index";
	}

	@RequestMapping("/account")
	public String account(Model model) {
		model.addAttribute("center","account");
		return "index";
	}

	@RequestMapping("/form")
	public String form(Model model){
		model.addAttribute("center","form");
		return "index";
	}

	@RequestMapping("/form_org")
	public String form_org() {
		return "form_org";
	}
}
