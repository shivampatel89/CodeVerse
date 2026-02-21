package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.HackathonEntity;
import com.grownited.entity.UserEntity;
import com.grownited.entity.UserTypeEntity;
import com.grownited.repository.HackathonRepository;
import com.grownited.repository.UserTypeRepository;

import jakarta.servlet.http.HttpSession;




@Controller
public class HackathonController {
	
	@Autowired
	HackathonRepository hackathonRepository;
	
	@Autowired
	UserTypeRepository userTypeRepository;
	
	@GetMapping("addHackathon")
	public String addHackathon(Model model) {
		List<UserTypeEntity> allUserType = userTypeRepository.findAll();
		model.addAttribute("allUserType",allUserType);
		return "AddHackathon";
	}
	
	@PostMapping("saveHackathon")
	public String saveHackathon(HackathonEntity hackathonEntity,HttpSession session) {
		UserEntity currentLoginUser=(UserEntity) session.getAttribute("user");
		hackathonEntity.setUserId(currentLoginUser.getUserId());
		hackathonRepository.save(hackathonEntity);
		return"redirect:/listHackathon";
	}
	
	@GetMapping("listHackathon")
	public String listHackathon(Model model) {
		List<HackathonEntity> hackathonList=hackathonRepository.findAll();
		model.addAttribute("hackathonList",hackathonList);
		return "ListHackathon";
	}
	
	@GetMapping("deleteHackathon")
	public String getMethodName(Integer hackathonId) {
		hackathonRepository.deleteById(hackathonId);
		return "redirect:/listHackathon";
	}
	
	
}
