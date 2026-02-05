package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.CategoryEntity;
import com.grownited.repository.CategoryRepository;


@Controller
public class CategoryController {
	
	@Autowired
	CategoryRepository categoryRepository;
	
	@GetMapping("newCategory")
	public String newCategory() {
		return"NewCategory";
		
	}
	@PostMapping("saveCategory")
	public String saveCategory(CategoryEntity categoryEntity) {
		
		categoryEntity.setActive(true);
		categoryRepository.save(categoryEntity);
		return "AdminDashboard";
	}
	
	
}
