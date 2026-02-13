package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.CategoryEntity;
import com.grownited.repository.CategoryRepository;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class CategoryController {
	
	@Autowired
	CategoryRepository categoryRepository;
	
	@GetMapping("addCategory")
	public String addCategory() {
		return"AddCategory";
		
	}
	
	@PostMapping("saveCategory")
	public String saveCategory(CategoryEntity categoryEntity) {
		
		categoryEntity.setActive(true);
		categoryRepository.save(categoryEntity);
		return "redirect:/listCategory";
	}
	
	@GetMapping("listCategory")
	public String listCategory(Model model) {
		
		List<CategoryEntity> categoryList= categoryRepository.findAll();
		model.addAttribute("categoryList",categoryList);
		return"ListCategory";
	}
	
	@GetMapping("deleteCategory")
	public String getMethodName(Integer categoryId) {
		System.out.println(categoryId);
		categoryRepository.deleteById(categoryId);
		return "redirect:/listCategory";
	}
	
}
