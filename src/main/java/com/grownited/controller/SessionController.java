package com.grownited.controller;

import java.time.LocalDate;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.grownited.entity.UserDetailEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.UserDetailRepository;
import com.grownited.repository.UserRepository;
import com.grownited.service.MailerService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class SessionController {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	UserDetailRepository userDetailRepository;
	
	@Autowired
	MailerService mailerService;

	@GetMapping("/signup")
	public String openSignupPage() {
		return "Signup"; //jsp name
	}
	
	@GetMapping("/login")
	public String openLoginPage() {
		return "Login";
	}
	
	@PostMapping("/authenticate")
	public String  authenticate(String email,String password,Model model,HttpSession session) {
		Optional<UserEntity> op= userRepository.findByEmail(email);
		if(op.isPresent()) {
			UserEntity dbUser = op.get();
			session.setAttribute("user", dbUser);
			if(dbUser.getPassword().equals(password)) {
				if(dbUser.getRole().equals("Admin")) {
					return"redirect:/adminDashboard";
					
				}else if(dbUser.getRole().equals("Participant")){
					return"redirect:/participantDashboard";
					
				}else if(dbUser.getRole().equals("Judge")){
					return"redirect:/judgeDashboard";
				}
			}
		}
		model.addAttribute("error","Invalid Credentials");
		return"Login";
	}
	
	@GetMapping("/forgetpassword")
	public String openForgetPasswordPage() {
		return "ForgetPassword";
	}
	@PostMapping("/register")
	public String register(UserEntity userEntity,UserDetailEntity userDetailEntity) throws Exception {
		
		
		userEntity.setActive(true);
		userEntity.setCreatedAt(LocalDate.now());
		userEntity.setRole("Participant");
		userRepository.save(userEntity);
		userDetailEntity.setUserId(userEntity.getUserId()); 
		userDetailRepository.save(userDetailEntity); 
		//Welcome Mail Service 
		mailerService.sendWelcomeMail(userEntity.getEmail(),userEntity.getFirstName());
		return"Login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "Login";
	}
	
}
