package com.grownited.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.grownited.entity.HackathonEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.HackathonRepository;
import com.grownited.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminDashboardController {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private HackathonRepository hackathonRepository;
	
	@GetMapping("/")
	public String root() {
		return "redirect:/login";
	}

	@GetMapping("adminDashboard")
	public String adminController(Model model, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}

		if (user.getRole() == null || !user.getRole().equalsIgnoreCase("Admin")) {
			return "redirect:/login";
		}

		List<UserEntity> users = userRepository.findAll();
		List<HackathonEntity> hackathons = hackathonRepository.findAll();
		LocalDate today = LocalDate.now();

		long activeUsersCount = users.stream()
				.filter(u -> Boolean.TRUE.equals(u.getActive()))
				.count();

		long completedHackathonsCount = hackathons.stream()
				.filter(h -> "completed".equalsIgnoreCase(safe(h.getStatus())))
				.count();

		long activeHackathonsCount = hackathons.stream()
				.filter(h -> "active".equalsIgnoreCase(safe(h.getStatus())))
				.count();

		long upcomingHackathonsCount = hackathons.stream()
				.filter(h -> "upcoming".equalsIgnoreCase(safe(h.getStatus()))
						|| (h.getRegistrationStartDate() != null && h.getRegistrationStartDate().isAfter(today)))
				.count();

		model.addAttribute("activeUsersCount", activeUsersCount);
		model.addAttribute("completedHackathonsCount", completedHackathonsCount);
		model.addAttribute("activeHackathonsCount", activeHackathonsCount);
		model.addAttribute("upcomingHackathonsCount", upcomingHackathonsCount);
		model.addAttribute("totalHackathonsCount", hackathons.size());

		return "AdminDashboard";
	}

	private String safe(String value) {
		return value == null ? "" : value.trim();
	}
}
