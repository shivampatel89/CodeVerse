package com.grownited.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;

@Service
public class MailerService {
	private static final Logger logger = LoggerFactory.getLogger(MailerService.class);

	@Autowired
	private JavaMailSender mailSender;

	@Value("${spring.mail.username:}")
	private String fromEmail;

	@Value("${app.base-url:http://localhost:8080}")
	private String appBaseUrl;

	@Value("${app.mail.welcome.enabled:true}")
	private boolean welcomeMailEnabled;

	@Value("${app.mail.otp.enabled:true}")
	private boolean otpMailEnabled;

	public void sendWelcomeMail(String to, String name) throws Exception {
		if (!welcomeMailEnabled) {
			logger.info("Welcome email disabled by config. Skipping email for {}", to);
			return;
		}

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

		String loginLink = appBaseUrl + "/login";

		String htmlContent = """
				<!DOCTYPE html>
				<html>
				<head>
				    <meta charset="UTF-8">
				</head>
				<body style="margin:0;padding:0;background-color:#f4f6f9;font-family:Arial,sans-serif;">

				<table align="center" width="600" cellpadding="0" cellspacing="0"
				       style="background:#ffffff;margin-top:30px;border-radius:10px;
				       box-shadow:0 5px 15px rgba(0,0,0,0.1);overflow:hidden;">

				    <tr>
				        <td style="background:#4e73df;padding:25px;text-align:center;color:white;">
				            <h2 style="margin:0;">🎉 Welcome to CodeVerse</h2>
				        </td>
				    </tr>

				    <tr>
				        <td style="padding:30px;color:#333;">
				            <h3>Hello %s,</h3>

				            <p>
				                We're excited to have you on board! Your account has been
				                successfully created.
				            </p>

				            <p><strong>Your Details:</strong></p>

				            <ul>
				                <li><strong>Email:</strong>%s</li>
				                <li><strong>Status:</strong> Active</li>
				            </ul>

				            <p>
				                You can now login and start exploring our platform.
				            </p>

				            <div style="text-align:center;margin:30px 0;">
				                <a href="%s"
				                   style="background:#1cc88a;color:white;
				                   padding:12px 25px;text-decoration:none;
				                   border-radius:5px;font-weight:bold;">
				                    Login Now
				                </a>
				            </div>

				            <p>
				                Regards,<br>
				                <strong>CodeVerse Team</strong>
				            </p>
				        </td>
				    </tr>

				    <tr>
				        <td style="background:#f8f9fc;text-align:center;
				                   padding:15px;font-size:12px;color:#777;">
				            © 2026 CodeVerse | All Rights Reserved
				        </td>
				    </tr>

				</table>

				</body>
				</html>
				""".formatted(name, to, loginLink);

		helper.setTo(to);
		if (fromEmail != null && !fromEmail.isBlank()) {
			helper.setFrom(fromEmail);
		}
		helper.setSubject("Welcome to CodeVerse 🎉");
		helper.setText(htmlContent, true);

		try {
			mailSender.send(message);
		} catch (MailException ex) {
			throw new Exception("Mail send failed", ex);
		}
	}

	public void sendOtpMail(String to, String otp) throws Exception {
		if (!otpMailEnabled) {
			logger.info("OTP email disabled by config. Skipping email for {}", to);
			return;
		}

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

		String htmlContent = """
				<html>
				<body style="font-family:Arial; background:#f4f6f9; padding:20px;">
				    <div style="max-width:500px;margin:auto;background:white;
				                padding:30px;border-radius:10px;
				                box-shadow:0 5px 15px rgba(0,0,0,0.1);">

				        <h2 style="color:#4e73df;text-align:center;">
				            Password Reset OTP
				        </h2>

				        <p>Your One-Time Password (OTP) is:</p>

				        <h1 style="text-align:center;color:#1cc88a;">
				            %s
				        </h1>



				        <p>If you did not request this, please ignore this email.</p>

				    </div>
				</body>
				</html>
				""".formatted(otp);

		helper.setTo(to);
		if (fromEmail != null && !fromEmail.isBlank()) {
			helper.setFrom(fromEmail);
		}
		helper.setSubject("Your OTP for Password Reset");
		helper.setText(htmlContent, true);

		mailSender.send(message);
	}
}