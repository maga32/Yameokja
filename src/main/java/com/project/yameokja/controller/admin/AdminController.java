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
	
	@RequestMapping({"/admin/", "/admin"})
	public String adminMain() {
		return "redirect:/admin/adminMember";
	}
	
	// 회원관련
	@RequestMapping("/admin/adminMember")
	public String adminMember(Model model,
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@RequestParam(value="sort", required=false, defaultValue="joindate") String sort,
			@RequestParam(value="order", required=false, defaultValue="desc") String order,
			@RequestParam(value="searchBy", required=false, defaultValue="id") String searchBy,
			@RequestParam(value="keyword", required=false) String keyword) {
		
		model.addAllAttributes(adminService.getMemberList(page, sort, order, searchBy, keyword));
		model.addAttribute("page", page);
		model.addAttribute("sort", sort);
		model.addAttribute("order", order);
		model.addAttribute("searchBy", searchBy);
		model.addAttribute("keyword", keyword);
		
		return "/admin/adminMember";
	}
	
	@RequestMapping("/admin/updateMemberLevel")
	public String updateMemberLevel(String memberId, int memberLevel, int page, String sort, String order, String searchBy, String keyword) {
		adminService.updateMemberLevel(memberId, memberLevel);
		
		String parameter = "?&page=" + page + "&sort=" + sort + "&order=" + order;
		if(keyword != "") parameter += "&searchBy=" + searchBy + "&keyword=" + keyword;
		
		return "redirect:/admin/adminMember" + parameter;
	}
	
	// 카테고리 관련 시작 -----------------------------------------------
	@RequestMapping("/admin/adminCategory")
	public String adminCategory(Model model, 
			@RequestParam(value="type", required=false, defaultValue="store") String type) {
		List<Category> categoryList = adminService.categoryList(type);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("type", type);
		
		return "/admin/adminCategory";
	}
	
	@RequestMapping("/admin/addCategory")
	public String addCategory(String type, String categoryName) {
		adminService.addCategory(type, categoryName);
		
		return "redirect:/admin/adminCategory?type=" + type;
	}
	
	@RequestMapping("/admin/deleteCategory")
	public String deleteCategory(int categoryNo, String type) {
		adminService.deleteCategory(categoryNo);
		return "redirect:/admin/adminCategory?type=" + type;
	}
	
	@RequestMapping("/admin/updateCategory")
	public String updateCategoryName(Category category, String type) {
		adminService.updateCategory(category);
		return "redirect:/admin/adminCategory?type=" + type;
	}
	// 카테고리 관련 끝 -----------------------------------------------
	
}
