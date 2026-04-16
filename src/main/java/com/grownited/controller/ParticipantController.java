package com.grownited.controller;

import java.time.LocalDateTime;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.HackathonEntity;
import com.grownited.entity.ParticipantRegistrationEntity;
import com.grownited.entity.SubmissionEntity;
import com.grownited.entity.TeamEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.HackathonRepository;
import com.grownited.repository.ParticipantRegistrationRepository;
import com.grownited.repository.SubmissionRepository;
import com.grownited.repository.TeamRepository;
import com.grownited.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class ParticipantController {

    @Autowired
    private HackathonRepository hackathonRepository;

    @Autowired
    private ParticipantRegistrationRepository registrationRepository;

    @Autowired
    private TeamRepository teamRepository;

    @Autowired
    private SubmissionRepository submissionRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/participantDashboard")
    public String participantDashboard(HttpSession session, Model model,
            @RequestParam(value = "statusFilter", defaultValue = "all") String statusFilter) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        // Real counts
        model.addAttribute("totalHackathons", hackathonRepository.count());
        model.addAttribute("myRegistrationsCount", registrationRepository.countByUserId(user.getUserId()));
        model.addAttribute("mySubmissionsCount", submissionRepository.countByUserId(user.getUserId()));

        // User's Registrations
        List<ParticipantRegistrationEntity> allRegs = registrationRepository.findByUserId(user.getUserId());

        // Fetch hackathon details for these registrations to show titles
        java.util.Map<Integer, HackathonEntity> hackathonMap = new java.util.HashMap<>();
        for (ParticipantRegistrationEntity reg : allRegs) {
            hackathonRepository.findById(reg.getHackathonId()).ifPresent(h -> hackathonMap.put(h.getHackathonId(), h));
        }
        model.addAttribute("hackathonMap", hackathonMap);

        List<ParticipantRegistrationEntity> regs = new ArrayList<>();
        for (ParticipantRegistrationEntity reg : allRegs) {
            HackathonEntity hackathon = hackathonMap.get(reg.getHackathonId());
            if (matchesStatusFilter(hackathon, statusFilter)) {
                regs.add(reg);
            }
        }
        model.addAttribute("userRegistrations", regs);
        model.addAttribute("statusFilter", statusFilter);
        
        // Fetch team details
        java.util.Map<String, TeamEntity> teamMap = new java.util.HashMap<>();
        for (ParticipantRegistrationEntity reg : regs) {
            if (reg.getTeamId() != null) {
                teamRepository.findById(reg.getTeamId()).ifPresent(t -> teamMap.put(String.valueOf(t.getTeamId()), t));
            }
        }
        model.addAttribute("teamMap", teamMap);

        // For teams led by current user, show who joined in that team.
        java.util.Map<String, java.util.List<UserEntity>> teamMembersMap = new java.util.HashMap<>();
        for (ParticipantRegistrationEntity reg : regs) {
            if (reg.getTeamId() == null) continue;

            TeamEntity team = teamMap.get(String.valueOf(reg.getTeamId()));
            if (team == null || team.getLeaderId() == null || !team.getLeaderId().equals(user.getUserId())) continue;

            java.util.List<ParticipantRegistrationEntity> teamRegs = registrationRepository.findByTeamId(reg.getTeamId());
            java.util.List<UserEntity> members = new java.util.ArrayList<>();
            for (ParticipantRegistrationEntity teamReg : teamRegs) {
                userRepository.findById(teamReg.getUserId()).ifPresent(members::add);
            }
            teamMembersMap.put(String.valueOf(reg.getTeamId()), members);
        }
        model.addAttribute("teamMembersMap", teamMembersMap);

        // Track submission status per hackathon for dashboard actions.
        java.util.Map<String, Boolean> submittedMap = new java.util.HashMap<>();
        for (ParticipantRegistrationEntity reg : regs) {
            boolean alreadySubmitted;
            if (reg.getTeamId() != null) {
                alreadySubmitted = submissionRepository
                        .findByHackathonIdAndTeamId(reg.getHackathonId(), reg.getTeamId())
                        .isPresent();
            } else {
                alreadySubmitted = submissionRepository
                        .findByHackathonIdAndUserId(reg.getHackathonId(), user.getUserId())
                        .isPresent();
            }
            submittedMap.put(String.valueOf(reg.getHackathonId()), alreadySubmitted);
        }
        model.addAttribute("submittedMap", submittedMap);

        return "ParticipantDashboard";
    }

    private boolean matchesStatusFilter(HackathonEntity hackathon, String statusFilter) {
        if (hackathon == null) return "all".equalsIgnoreCase(statusFilter);
        if (statusFilter == null || "all".equalsIgnoreCase(statusFilter)) return true;

        LocalDate today = LocalDate.now();
        LocalDate startDate = hackathon.getRegistrationStartDate();
        LocalDate endDate = hackathon.getRegistrationEndDate();

        // Primary filter source: registration window dates.
        if ("upcoming".equalsIgnoreCase(statusFilter)) {
            if (startDate != null) {
                return startDate.isAfter(today);
            }
            String status = hackathon.getStatus() == null ? "" : hackathon.getStatus().trim().toLowerCase();
            return status.contains("upcoming");
        }

        if ("ongoing".equalsIgnoreCase(statusFilter)) {
            if (startDate != null && endDate != null) {
                return !today.isBefore(startDate) && !today.isAfter(endDate);
            }
            if (startDate != null && endDate == null) {
                return !today.isBefore(startDate);
            }

            String status = hackathon.getStatus() == null ? "" : hackathon.getStatus().trim().toLowerCase();
            return status.contains("active") || status.contains("ongoing");
        }

        return true;
    }

    @GetMapping("/explore")
    public String exploreHackathons(Model model) {
        List<HackathonEntity> hackathons = hackathonRepository.findAll();
        model.addAttribute("hackathons", hackathons);
        return "ExploreHackathons";
    }

    @GetMapping("/hackathonDetails")
    public String hackathonDetails(@RequestParam("hackathonId") Integer hackathonId, Model model, HttpSession session) {
        HackathonEntity hackathon = hackathonRepository.findById(hackathonId).orElseThrow();
        model.addAttribute("hackathon", hackathon);

        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user != null) {
            Optional<ParticipantRegistrationEntity> reg = registrationRepository.findByHackathonIdAndUserId(hackathonId, user.getUserId());
            model.addAttribute("isRegistered", reg.isPresent());
        }

        return "HackathonDetails";
    }

    @GetMapping("/registrationForm")
    public String registrationForm(@RequestParam("hackathonId") Integer hackathonId, Model model) {
        HackathonEntity hackathon = hackathonRepository.findById(hackathonId).orElseThrow();
        model.addAttribute("hackathon", hackathon);
        return "HackathonRegistrationForm";
    }

    @PostMapping("/registerHackathon")
    public String registerHackathon(@RequestParam("hackathonId") Integer hackathonId, 
                                   @RequestParam(value = "problemStatement", required = false) String problemStatement,
                                   @RequestParam(value = "pptLink", required = false) String pptLink,
                                   @RequestParam("teamOption") String teamOption,
                                   @RequestParam(value = "teamName", required = false) String teamName,
                                   @RequestParam(value = "inviteCode", required = false) String inviteCode,
                                   HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        HackathonEntity hackathon = hackathonRepository.findById(hackathonId).orElseThrow();

        if ("create".equalsIgnoreCase(teamOption)) {
            if (problemStatement == null || problemStatement.isBlank() || pptLink == null || pptLink.isBlank()) {
                return "redirect:/registrationForm?hackathonId=" + hackathonId + "&error=ProblemAndPptRequired";
            }
        }

        if ("Paid".equalsIgnoreCase(hackathon.getPayment())) {
            // Store registration info in session temporarily
            session.setAttribute("temp_problemStatement", problemStatement);
            session.setAttribute("temp_pptLink", pptLink);
            session.setAttribute("temp_teamOption", teamOption);
            session.setAttribute("temp_teamName", teamName);
            session.setAttribute("temp_inviteCode", inviteCode);
            return "redirect:/create-razorpay-order?hackathonId=" + hackathonId;
        }

        // Free Registration - Process Team Logic
        ParticipantRegistrationEntity reg = new ParticipantRegistrationEntity();
        reg.setHackathonId(hackathonId);
        reg.setUserId(user.getUserId());
        reg.setPaymentStatus("Success");
        reg.setRegistrationDate(LocalDateTime.now());
        reg.setProblemStatement(problemStatement != null && !problemStatement.isBlank() ? problemStatement.trim() : null);
        reg.setPptLink(pptLink != null && !pptLink.isBlank() ? pptLink.trim() : null);

        String createdInviteCode = null;

        // Team Logic
        if ("create".equalsIgnoreCase(teamOption) && teamName != null && !teamName.isBlank()) {
            TeamEntity team = new TeamEntity();
            team.setTeamName(teamName.trim());
            team.setHackathonId(hackathonId);
            team.setLeaderId(user.getUserId());
            team.setInviteCode(UUID.randomUUID().toString().substring(0, 8).toUpperCase());
            TeamEntity savedTeam = teamRepository.saveAndFlush(team);
            reg.setTeamId(savedTeam.getTeamId());
            createdInviteCode = savedTeam.getInviteCode();
        } else if ("join".equalsIgnoreCase(teamOption) && inviteCode != null && !inviteCode.isBlank()) {
            Optional<TeamEntity> teamOp = teamRepository.findByInviteCode(inviteCode.trim().toUpperCase());
            if (teamOp.isPresent()) {
                reg.setTeamId(teamOp.get().getTeamId());
            } else {
                return "redirect:/registrationForm?hackathonId=" + hackathonId + "&error=InvalidInviteCode";
            }
        }

        registrationRepository.save(reg);
        
        String redirectUrl = "redirect:/participantDashboard?msg=RegisteredSuccessfully";
        if (createdInviteCode != null) {
            redirectUrl += "&inviteCode=" + createdInviteCode;
        }
        return redirectUrl;
    }

    @PostMapping("/createTeam")
    public String createTeam(@RequestParam("hackathonId") Integer hackathonId, @RequestParam("teamName") String teamName, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user == null) return "redirect:/login";
        if (teamName == null || teamName.isBlank()) {
            return "redirect:/participantDashboard?error=TeamNameRequired";
        }
        
        TeamEntity team = new TeamEntity();
        team.setTeamName(teamName.trim());
        team.setHackathonId(hackathonId);
        team.setLeaderId(user.getUserId());
        team.setInviteCode(UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        TeamEntity savedTeam = teamRepository.saveAndFlush(team);

        // Update registration with teamId
        Optional<ParticipantRegistrationEntity> reg = registrationRepository.findByHackathonIdAndUserId(hackathonId, user.getUserId());
        if (reg.isPresent()) {
            reg.get().setTeamId(savedTeam.getTeamId());
            registrationRepository.save(reg.get());
        }

        return "redirect:/participantDashboard?msg=TeamCreated&inviteCode=" + savedTeam.getInviteCode();
    }

    @PostMapping("/joinTeam")
    public String joinTeam(@RequestParam("inviteCode") String inviteCode, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user == null) return "redirect:/login";
        if (inviteCode == null || inviteCode.isBlank()) {
            return "redirect:/participantDashboard?error=InvalidInviteCode";
        }
        Optional<TeamEntity> teamOp = teamRepository.findByInviteCode(inviteCode.trim().toUpperCase());

        if (teamOp.isPresent()) {
            TeamEntity team = teamOp.get();
            // Create or update registration for this user in this hackathon
            ParticipantRegistrationEntity reg = registrationRepository.findByHackathonIdAndUserId(team.getHackathonId(), user.getUserId())
                    .orElse(new ParticipantRegistrationEntity());
            
            reg.setHackathonId(team.getHackathonId());
            reg.setUserId(user.getUserId());
            reg.setTeamId(team.getTeamId());
            reg.setPaymentStatus("Success"); // Assuming joining a team means payment is already handled or not needed
            reg.setRegistrationDate(LocalDateTime.now());
            registrationRepository.save(reg);

            return "redirect:/participantDashboard?msg=JoinedTeam";
        }

        return "redirect:/participantDashboard?error=InvalidInviteCode";
    }

    @GetMapping("/submitSolution")
    public String submitSolution(@RequestParam("hackathonId") Integer hackathonId, Model model) {
        model.addAttribute("hackathonId", hackathonId);
        return "SubmissionForm";
    }

    @PostMapping("/saveSolution")
    public String saveSolution(SubmissionEntity submission, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user == null) return "redirect:/login";
        submission.setUserId(user.getUserId());
        submission.setSubmissionDate(LocalDateTime.now());
        
        // Find team if applicable
        Optional<ParticipantRegistrationEntity> reg = registrationRepository.findByHackathonIdAndUserId(submission.getHackathonId(), user.getUserId());
        boolean alreadySubmitted = false;
        if (reg.isPresent()) {
            submission.setTeamId(reg.get().getTeamId());
            if (reg.get().getTeamId() != null) {
                alreadySubmitted = submissionRepository
                        .findByHackathonIdAndTeamId(submission.getHackathonId(), reg.get().getTeamId())
                        .isPresent();
            }
        }

        if (!alreadySubmitted) {
            alreadySubmitted = submissionRepository
                    .findByHackathonIdAndUserId(submission.getHackathonId(), user.getUserId())
                    .isPresent();
        }

        if (alreadySubmitted) {
            return "redirect:/participantDashboard?msg=SubmissionAlreadyExists";
        }
        
        submissionRepository.save(submission);
        return "redirect:/participantDashboard?msg=SolutionSubmitted";
    }
}
