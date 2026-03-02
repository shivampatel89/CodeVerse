package com.grownited.service;

import java.security.SecureRandom;

import org.springframework.stereotype.Service;

@Service
public class OtpService {
	
	public String generateOtp() {
		SecureRandom random=new SecureRandom();
		int otp=100000+random.nextInt(900000);
		return String.valueOf(otp);
		
	}
}
