package com.grownited.service;

import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailerService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendWelcomeMail(String to, String name) throws Exception {

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        String loginLink = "http://localhost:8080/login";

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
        helper.setSubject("Welcome to CodeVerse 🎉");
        helper.setText(htmlContent, true);

        mailSender.send(message);
    }
}