package com.project.yameokja.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.yameokja.domain.Store;
import com.project.yameokja.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService StoreService;
	
	public void setStoreService(StoreService StoreService) {
		this.StoreService = StoreService;
	}
	
	@RequestMapping("/storeList")
	public String StoreList(Model model) {
		
		List<Store> sList = StoreService.storeList();
		
		model.addAttribute("sList", sList);
		
		return "store/storeList";
		
		
	}
}
