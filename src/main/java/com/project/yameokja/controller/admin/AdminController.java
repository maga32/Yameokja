package com.project.yameokja.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.yameokja.domain.Category;
import com.project.yameokja.service.admin.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/admin/adminMain")
	String adminMain() {
		return "/admin/adminMain";
	}
	
	@RequestMapping({"/admin/adminCategory"})
	public String adminCategory(Model model, 
			@RequestParam(value="type", required=false, defaultValue="store") String type) {
		List<Category> categoryList = adminService.categoryList(type);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("type", type);
		
		return "/admin/adminCategory";
	}
	
	@RequestMapping({"/admin/addCategory"})
	public String addCategory(String type, String categoryName) {
		adminService.addCategory(type, categoryName);
		
		return "redirect:/admin/adminCategory";
	}
	
	@RequestMapping({"/admin/deleteCategory"})
	public String deleteCategory(int categoryNo, String type) {
		adminService.deleteCategory(categoryNo);
		return "redirect:/admin/adminCategory?type=" + type;
	}
}
