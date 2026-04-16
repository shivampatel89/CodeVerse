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
import com.grownited.service.OtpService;

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
	OtpService otpService;

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
		Optional<UserEntity> op = userRepository.findTopByEmailOrderByUserIdDesc(email);
		if (op.isPresent()) {
			UserEntity dbUser = op.get();
			if (passwordEncoder.matches(password, dbUser.getPassword())) {
				session.setAttribute("user", dbUser);
				if (dbUser.getRole().equalsIgnoreCase("Admin")) {
					return "redirect:/adminDashboard";

				} else if (dbUser.getRole().equalsIgnoreCase("Participant")) {
					return "redirect:/participantDashboard";

				} else if (dbUser.getRole().equalsIgnoreCase("Judge")) {
					return "redirect:/judgeDashboard";
				} else {
					model.addAttribute("error", "Role not recognized");
					return "Login";
				}
			}
		}
		model.addAttribute("error", "Invalid Credentials");
		return "Login";
	}

	@GetMapping("/forgetPassword")
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
		if (profilePic != null && !profilePic.isEmpty()) {
			try {
				Map map = cloudinary.uploader().upload(profilePic.getBytes(), null);
				String profilePicURL = map.get("secure_url").toString();
				System.out.println(profilePicURL);
				userEntity.setProfilePicURL(profilePicURL);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		try {
			// Save User
			userRepository.save(userEntity);
			userDetailEntity.setUserId(userEntity.getUserId());
			userDetailRepository.save(userDetailEntity);

			// Welcome Mail Service
			try {
				mailerService.sendWelcomeMail(userEntity.getEmail(), userEntity.getFirstName());
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
			// Handle duplicate email or other DB errors
			return "redirect:/signup?error=RegistrationFailed";
		}

		return "Login";
	}
	
	@PostMapping("/sendOtp")
	public String sendOtp(String email,Model model) throws Exception {
		Optional<UserEntity> op=userRepository.findTopByEmailOrderByUserIdDesc(email);
		if(op.isEmpty()) {
			model.addAttribute("error","User Not Found");
			return "redirect:/forgetPassword";
		}
			
			UserEntity user=op.get();
			String otp = otpService.generateOtp();
			user.setOtp(otp);
			userRepository.save(user);
		mailerService.sendOtpMail(email, otp);	
		model.addAttribute("email",email);
		return "VerifyOtp";
	}
	
	@PostMapping("/verifyOtp")
	public String verifyOtp(String email,String otp,Model model) {
		Optional<UserEntity> op=userRepository.findTopByEmailOrderByUserIdDesc(email);
		if(op.isEmpty()) {
			model.addAttribute("error","User Not Found");
			model.addAttribute("email",email);
			return "VerifyOtp";
		}
		UserEntity user=op.get();
		
		if(user.getOtp().equals(otp)) {
			model.addAttribute("email",email);
			return "ChangePassword";
		}
		model.addAttribute("error","Invalid OTP");
		model.addAttribute("email",email);
		return "VerifyOtp";
	}
	
	@PostMapping("/changePassword")
	public String postMethodName(String email,String password,Model model) {
		Optional<UserEntity>op=userRepository.findTopByEmailOrderByUserIdDesc(email);
		if(op.isEmpty()) {
			model.addAttribute("error","User Not Found");
			return "ChangePassword";
		}
		UserEntity user=op.get();
		String encodedPassword=passwordEncoder.encode(password);
		System.out.println(encodedPassword);
		user.setPassword(encodedPassword);
		userRepository.save(user);
		
		return "redirect:/login";
	}
	

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "Login";
	}

}
