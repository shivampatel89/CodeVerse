package com.grownited.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.grownited.entity.UserDetailEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.UserDetailRepository;
import com.grownited.repository.UserRepository;
import com.grownited.service.MailerService;

import jakarta.mail.Multipart;
import jakarta.servlet.http.HttpSession;

@Controller
public class SessionController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	UserDetailRepository userDetailRepository;

	@Autowired
	MailerService mailerService;

	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	Cloudinary cloudinary;

	@GetMapping("/signup")
	public String openSignupPage() {
		return "Signup"; // jsp name
	}

	@GetMapping("/login")
	public String openLoginPage() {
		return "Login";
	}

	@PostMapping("/authenticate")
	public String authenticate(String email, String password, Model model, HttpSession session) {
		Optional<UserEntity> op = userRepository.findByEmail(email);
		if (op.isPresent()) {
			UserEntity dbUser = op.get();
			session.setAttribute("user", dbUser);
			if(passwordEncoder.matches(password,dbUser.getPassword())) {
				if (dbUser.getRole().equals("Admin")) {
					return "redirect:/adminDashboard";

				} else if (dbUser.getRole().equals("Participant")) {
					return "redirect:/participantDashboard";

				} else if (dbUser.getRole().equals("Judge")) {
					return "redirect:/judgeDashboard";
				}
			}
		}
		model.addAttribute("error", "Invalid Credentials");
		return "Login";
	}

	@GetMapping("/forgetpassword")
	public String openForgetPasswordPage() {
		return "ForgetPassword";
	}

	@PostMapping("/register")
	public String register(UserEntity userEntity, UserDetailEntity userDetailEntity,MultipartFile profilePic) {

		userEntity.setActive(true);
		userEntity.setCreatedAt(LocalDate.now());
		userEntity.setRole("Participant");
		
		//Encode Password
		String encodedPassword = passwordEncoder.encode(userEntity.getPassword());
		System.out.println(encodedPassword);
		userEntity.setPassword(encodedPassword);
		
		//File Upload
		try {
			Map map = 	cloudinary.uploader().upload(profilePic.getBytes(), null);
			String profilePicURL = map.get("secure_url").toString();
			System.out.println(profilePicURL);
			userEntity.setProfilePicURL(profilePicURL);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 //Save User
		  userRepository.save(userEntity);
		  userDetailEntity.setUserId(userEntity.getUserId());
		  userDetailRepository.save(userDetailEntity);
		  
		  //Welcome Mail Service
		  try {
			mailerService.sendWelcomeMail(userEntity.getEmail(),userEntity.getFirstName());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return "Login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "Login";
	}

}
