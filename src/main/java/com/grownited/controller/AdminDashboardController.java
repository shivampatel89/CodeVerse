package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminDashboardController {
	
	@GetMapping(value = {"adminDashboard","/"})
	public String adminController() {
		return "AdminDashboard";
	}
}
