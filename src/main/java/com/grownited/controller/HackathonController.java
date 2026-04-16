package com.grownited.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

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
import com.grownited.entity.UserTypeEntity;
import com.grownited.repository.HackathonRepository;
import com.grownited.repository.TeamRepository;
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
		Map<Integer, Long> registrationCountMap = new HashMap<>();
		Map<Integer, Long> submissionCountMap = new HashMap<>();

		for (HackathonEntity hackathon : hackathonList) {
			Long regs = registrationRepository.countByHackathonId(hackathon.getHackathonId());
			Long subs = submissionRepository.countByHackathonId(hackathon.getHackathonId());
			registrationCountMap.put(hackathon.getHackathonId(), regs == null ? 0L : regs);
			submissionCountMap.put(hackathon.getHackathonId(), subs == null ? 0L : subs);
		}

		model.addAttribute("hackathonList",hackathonList);
		model.addAttribute("registrationCountMap", registrationCountMap);
		model.addAttribute("submissionCountMap", submissionCountMap);
		return "ListHackathon";
	}
	
	@GetMapping("deleteHackathon")
	public String getMethodName(Integer hackathonId) {
		hackathonRepository.deleteById(hackathonId);
		return "redirect:/listHackathon";
	}

	@Autowired
	com.grownited.repository.ParticipantRegistrationRepository registrationRepository;

	@Autowired
	com.grownited.repository.SubmissionRepository submissionRepository;

	@Autowired
	TeamRepository teamRepository;

	@GetMapping("viewRegistrations")
	public String viewRegistrations(@RequestParam("hackathonId") Integer hackathonId, Model model) {
		// List<ParticipantRegistrationEntity> ...
		// I'll need to fetch more details (user info)
		// For simplicity, I'll just pass the registrations
		model.addAttribute("registrations", registrationRepository.findByHackathonId(hackathonId));
		return "AdminViewRegistrations";
	}

	@GetMapping("viewSubmissions")
	public String viewSubmissions(@RequestParam("hackathonId") Integer hackathonId, Model model) {
		List<SubmissionEntity> submissions = submissionRepository.findByHackathonId(hackathonId);
		List<ParticipantRegistrationEntity> registrations = registrationRepository.findByHackathonId(hackathonId);

		Set<Integer> teamIds = submissions.stream()
				.map(SubmissionEntity::getTeamId)
				.filter(Objects::nonNull)
				.collect(Collectors.toSet());
		teamIds.addAll(registrations.stream()
				.map(ParticipantRegistrationEntity::getTeamId)
				.filter(Objects::nonNull)
				.collect(Collectors.toSet()));

		Map<Integer, String> teamNameMap = new HashMap<>();
		Map<Integer, Integer> teamLeaderMap = new HashMap<>();
		if (!teamIds.isEmpty()) {
			for (TeamEntity team : teamRepository.findAllById(teamIds)) {
				teamNameMap.put(team.getTeamId(), team.getTeamName());
				teamLeaderMap.put(team.getTeamId(), team.getLeaderId());
			}
		}

		Map<Integer, String> teamPptMap = new HashMap<>();
		Map<Integer, String> userPptMap = new HashMap<>();

		for (ParticipantRegistrationEntity reg : registrations) {
			if (reg.getPptLink() == null || reg.getPptLink().isBlank()) {
				continue;
			}
			if (reg.getTeamId() != null) {
				Integer leaderId = teamLeaderMap.get(reg.getTeamId());
				if (leaderId != null && leaderId.equals(reg.getUserId())) {
					teamPptMap.put(reg.getTeamId(), reg.getPptLink());
				}
			}
			if (reg.getUserId() != null) {
				userPptMap.putIfAbsent(reg.getUserId(), reg.getPptLink());
			}
		}

		List<SubmissionEntity> filteredSubmissions = new ArrayList<>();
		Set<Integer> seenTeamSubmissionIds = new HashSet<>();
		for (SubmissionEntity submission : submissions) {
			if (submission.getTeamId() == null) {
				filteredSubmissions.add(submission);
				continue;
			}

			Integer leaderId = teamLeaderMap.get(submission.getTeamId());
			if (leaderId != null && leaderId.equals(submission.getUserId()) && seenTeamSubmissionIds.add(submission.getTeamId())) {
				filteredSubmissions.add(submission);
			}
		}

		List<ParticipantRegistrationEntity> leaderRegistrations = new ArrayList<>();
		Set<Integer> seenTeamRegistrationIds = new HashSet<>();
		for (ParticipantRegistrationEntity reg : registrations) {
			if (reg.getTeamId() == null) {
				leaderRegistrations.add(reg);
				continue;
			}

			Integer leaderId = teamLeaderMap.get(reg.getTeamId());
			if (leaderId != null && leaderId.equals(reg.getUserId()) && seenTeamRegistrationIds.add(reg.getTeamId())) {
				leaderRegistrations.add(reg);
			}
		}

		model.addAttribute("submissions", filteredSubmissions);
		model.addAttribute("registrations", leaderRegistrations);
		model.addAttribute("teamNameMap", teamNameMap);
		model.addAttribute("teamPptMap", teamPptMap);
		model.addAttribute("userPptMap", userPptMap);
		return "AdminViewSubmissions";
	}
}
