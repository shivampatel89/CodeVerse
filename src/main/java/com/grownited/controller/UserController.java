package com.grownited.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.UserDetailEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.UserDetailRepository;
import com.grownited.repository.UserRepository;


@Controller
public class UserController {

	@Autowired
	private UserDetailRepository userDetailRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@GetMapping("listUser")
	public String listUser(Model model) {
		
		List<UserEntity> users = userRepository.findAll();
		model.addAttribute("users",users);
		return"ListUser";
	}
	
	 @GetMapping("viewUser") 
	 public String getMethodName(Integer userId,Model model) { 
		Optional<UserEntity> opUser =userRepository.findById(userId);
		Optional<UserDetailEntity> opUserDetail=userDetailRepository.findByUserId(userId);

		if (opUser.isEmpty()) {
			return"";
		    
		} else {
		    UserEntity userEntity=opUser.get();
		    UserDetailEntity userDetailEntity=opUserDetail.get();
		    
		    model.addAttribute("user",userEntity);
		    model.addAttribute("userDetail",userDetailEntity);
		    
		    return"ViewUser";
		}

   }
			@GetMapping("editUser")
			public String editUser(@RequestParam("userId") Integer userId, Model model) {
				Optional<UserEntity> opUser = userRepository.findById(userId);
				Optional<UserDetailEntity> opUserDetail = userDetailRepository.findByUserId(userId);

				if (opUser.isEmpty()) {
					return "redirect:/listUser";
				}

				model.addAttribute("user", opUser.get());
				model.addAttribute("userDetail", opUserDetail.orElseGet(() -> {
					UserDetailEntity userDetail = new UserDetailEntity();
					userDetail.setUserId(userId);
					return userDetail;
				}));
				return "EditUser";
			}

			@PostMapping("updateUser")
			public String updateUser(UserEntity user, UserDetailEntity userDetailEntity) {
				Optional<UserEntity> opUser = userRepository.findById(user.getUserId());
				if (opUser.isEmpty()) {
					return "redirect:/listUser";
				}

				UserEntity existingUser = opUser.get();
				existingUser.setFirstName(user.getFirstName());
				existingUser.setLastName(user.getLastName());
				existingUser.setEmail(user.getEmail());
				existingUser.setGender(user.getGender());
				existingUser.setBirthYear(user.getBirthYear());
				existingUser.setContactNum(user.getContactNum());
				existingUser.setActive(user.getActive());
				userRepository.save(existingUser);

				userDetailEntity.setUserId(user.getUserId());
				Optional<UserDetailEntity> opDetail = userDetailRepository.findByUserId(user.getUserId());
				if (opDetail.isPresent()) {
					UserDetailEntity existingDetail = opDetail.get();
					existingDetail.setQualification(userDetailEntity.getQualification());
					existingDetail.setCity(userDetailEntity.getCity());
					existingDetail.setState(userDetailEntity.getState());
					existingDetail.setCountry(userDetailEntity.getCountry());
					userDetailRepository.save(existingDetail);
				} else {
					userDetailRepository.save(userDetailEntity);
				}

				return "redirect:/listUser";
			}

	@GetMapping("deleteUser")
	public String getMethodName(Integer userId) {
		userRepository.deleteById(userId);
		userDetailRepository.deleteById(userId);
		return "redirect:/listUser";
	}
	
   
 
}
