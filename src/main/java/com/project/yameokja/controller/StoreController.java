package com.project.yameokja.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Store;
import com.project.yameokja.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService StoreService;
	
	public void setStoreService(StoreService StoreService) {
		this.StoreService = StoreService;
	}
	
	// 가게 리스트
	@RequestMapping("/storeList")
	public String StoreList(Model model) {
		
		List<Store> sList = StoreService.storeList();
		model.addAttribute("sList", sList);
		
		return "store/storeList";
	}
	
	// 리스트에서 정보 불러오기
	@RequestMapping("/storeDetail")
	public String StoreDetail(Model model, int storeNo) {
		
		Store store = StoreService.getStore(storeNo);
		model.addAttribute("store", store);
		
		return "store/storeDetail";
	}
	
	// sad
	@RequestMapping(value="/storeWriteForm")
	public String storeWriteForm() {
		
		return "store/storeWriteForm";
	}
	
	
	// 가게 정보 글쓰기
	@RequestMapping(value="/storeWrite", method=RequestMethod.GET)
	public String insertStore(String storeName) {
		Store store new Store();
		
		store.setStoreName(storeName);
		store.setStoreLatitude(storeLatitude);
		store.setStoreLongitude(storeLongitude);
		store.setStoreFileMain(storeFileMain);
		store.setStoreFileMenu(storeFileMenu);
		store.setStoreAddress(storeAddress);
		store.setStoreTime(storeTime);
		store.setStoreDayOff(storeDayOff);
		store.setStoreParking(storeParking);
		store.setCategoryNo(categoryNo);
		
		
		
		
		StoreService.insertStore(store);
		
		return "store/storeWrite";
	}
	

	
}
