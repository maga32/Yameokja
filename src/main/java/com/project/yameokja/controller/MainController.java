package com.project.yameokja.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.yameokja.domain.Category;
import com.project.yameokja.service.main.MainService;

@Controller
public class MainController {
	private MainService mainService;
	
	@Autowired
	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}
	
	@RequestMapping({"/", "/main"})
	public String main(Model model) {
		List<Category> categoryList = mainService.categoryList("store");
		
		model.addAttribute("categoryList", categoryList);
		
		return "/main";
	}
	
}
