package com.project.yameokja.controller.store;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Store;
import com.project.yameokja.service.store.PostService;
import com.project.yameokja.service.store.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService StoreService;
	private PostService PostService;

	public void setStoreService(StoreService StoreService) {
		this.StoreService = StoreService;
	}

	// 가게 리스트
	@RequestMapping("/storeList")
	public String StoreList(Model model, int categoryNo) {

		List<Store> sList = StoreService.storeList(categoryNo);
		model.addAttribute("sList", sList);

		return "store/storeList";
	}

	// 가게 상세 and 리뷰 리스트를 받아온다
	@RequestMapping("/storeDetail")
	public String StoreDetail(Model model, int storeNo) {

		
		 Store store = StoreService.getStore(storeNo);
		 
		 model.addAttribute("store", store);
		 
			/*
			 * List<Post> pList = PostService.postList(storeNo);
			 * 
			 * model.addAttribute("pList", pList);
			 */

		return "store/storeDetail";
	}
	
	// 가게 정보 글쓰기 폼
	@RequestMapping(value="/storeWriteForm")
	public String insertStoreFrom() {
		
		return "store/storeWriteForm";
	}

	
	 // 가게 정보 글쓰기 프로세스
	@RequestMapping(value="/storeWriteProcess", method=RequestMethod.POST)
	public String insertStoreProcess(
			@RequestParam(value="storeMain", required=false) MultipartFile multipartFile) 
		throws IllegalStateException, IOException { 
		
		Store store =  new Store();
	
		
		
		StoreService.insertStore(store);
	 
		return "store/storeWriteFrom"; 
	 }
	 
}
