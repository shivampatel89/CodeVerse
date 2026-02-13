package com.grownited.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.grownited.entity.UserDetailEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.UserDetailRepository;
import com.grownited.repository.UserRepository;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class UserController {

    private final UserDetailRepository userDetailRepository;
	
	@Autowired
	UserRepository userRepository;

    UserController(UserDetailRepository userDetailRepository) {
        this.userDetailRepository = userDetailRepository;
    }
	
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
	@GetMapping("deleteUser")
	public String getMethodName(Integer userId) {
		userRepository.deleteById(userId);
		userDetailRepository.deleteById(userId);
		return "redirect:/listUser";
	}
	
   
 
}
