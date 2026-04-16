package com.grownited.controller;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.HackathonEntity;
import com.grownited.entity.ParticipantRegistrationEntity;
import com.grownited.entity.TeamEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.HackathonRepository;
import com.grownited.repository.ParticipantRegistrationRepository;
import com.grownited.repository.TeamRepository;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.Utils;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {

    @Value("${razorpay.key.id}")
    private String keyId;

    @Value("${razorpay.key.secret}")
    private String keySecret;

    @Autowired
    private HackathonRepository hackathonRepository;

    @Autowired
    private ParticipantRegistrationRepository registrationRepository;

    @Autowired
    private TeamRepository teamRepository;

    @GetMapping("/create-razorpay-order")
    public String createRazorpayOrder(@RequestParam("hackathonId") Integer hackathonId, HttpSession session, Model model) throws Exception {
        HackathonEntity hackathon = hackathonRepository.findById(hackathonId).orElseThrow();
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        RazorpayClient client = new RazorpayClient(keyId, keySecret);

        JSONObject orderRequest = new JSONObject();
        orderRequest.put("amount", (int) (hackathon.getFees() * 100)); // amount in paise
        orderRequest.put("currency", "INR");
        orderRequest.put("receipt", "txn_" + UUID.randomUUID().toString().substring(0, 8));

        Order order = client.orders.create(orderRequest);

        model.addAttribute("orderId", order.get("id"));
        model.addAttribute("amount", order.get("amount"));
        model.addAttribute("keyId", keyId);
        model.addAttribute("hackathon", hackathon);
        model.addAttribute("user", user);

        return "PaymentIntegration";
    }

    @PostMapping("/verify-payment")
    public String verifyPayment(@RequestParam("razorpay_order_id") String orderId,
                                @RequestParam("razorpay_payment_id") String paymentId,
                                @RequestParam("razorpay_signature") String signature,
                                @RequestParam("hackathonId") Integer hackathonId,
                                HttpSession session) throws Exception {

        String secret = keySecret;
        JSONObject options = new JSONObject();
        options.put("razorpay_order_id", orderId);
        options.put("razorpay_payment_id", paymentId);
        options.put("razorpay_signature", signature);

        boolean isValid = Utils.verifyPaymentSignature(options, secret);

        if (isValid) {
            UserEntity user = (UserEntity) session.getAttribute("user");
            
            ParticipantRegistrationEntity reg = new ParticipantRegistrationEntity();
            reg.setHackathonId(hackathonId);
            reg.setUserId(user.getUserId());
            reg.setPaymentStatus("Success");
            reg.setRegistrationDate(LocalDateTime.now());
            
            // Retrieve from session
            reg.setProblemStatement((String) session.getAttribute("temp_problemStatement"));
            reg.setPptLink((String) session.getAttribute("temp_pptLink"));
            
            // Team Logic
            String teamOption = (String) session.getAttribute("temp_teamOption");
            String teamName = (String) session.getAttribute("temp_teamName");
            String inviteCode = (String) session.getAttribute("temp_inviteCode");
            String createdInviteCode = null;

            if ("create".equalsIgnoreCase(teamOption) && teamName != null && !teamName.isBlank()) {
                TeamEntity teamEntity = new TeamEntity();
                teamEntity.setTeamName(teamName.trim());
                teamEntity.setHackathonId(hackathonId);
                teamEntity.setLeaderId(user.getUserId());
                teamEntity.setInviteCode(UUID.randomUUID().toString().substring(0, 8).toUpperCase());
                TeamEntity savedTeam = teamRepository.saveAndFlush(teamEntity);
                reg.setTeamId(savedTeam.getTeamId());
                createdInviteCode = savedTeam.getInviteCode();
            } else if ("join".equalsIgnoreCase(teamOption) && inviteCode != null && !inviteCode.isBlank()) {
                Optional<TeamEntity> teamOp = teamRepository.findByInviteCode(inviteCode.trim().toUpperCase());
                if (teamOp.isPresent()) {
                    reg.setTeamId(teamOp.get().getTeamId());
                }
            }

            registrationRepository.save(reg);

            String redirectUrl = "redirect:/participantDashboard?msg=PaymentSuccessful";
            if (createdInviteCode != null) {
                redirectUrl += "&inviteCode=" + createdInviteCode;
            }
            
            // Clean session
            session.removeAttribute("temp_problemStatement");
            session.removeAttribute("temp_pptLink");
            session.removeAttribute("temp_teamOption");
            session.removeAttribute("temp_teamName");
            session.removeAttribute("temp_inviteCode");
            
            return redirectUrl;
        } else {
            return "redirect:/hackathonDetails?hackathonId=" + hackathonId + "&error=PaymentVerificationFailed";
        }
    }
}
