package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
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
