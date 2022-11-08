package com.project.yameokja.controller.store;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	private StoreService storeService;
	
	@Autowired
	private PostService postService;

	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}
	public void setPostService(PostService postService) {
		this.postService = postService;
	}
	
	private final static String DEFAULT_PATH = "/resources/IMG/store";
	
	// 가게 리스트
	@RequestMapping("/storeList")
	public String StoreList(Model model, String type1, String type2,
			@RequestParam(value="categoryNo", required=false, defaultValue="99") int categoryNo,
			@RequestParam(value="keyword", required=false, defaultValue="null") String keyword,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="orderBy", required=false, defaultValue="null") String orderBy,
			HttpServletResponse response,HttpServletRequest request, PrintWriter out) throws IOException {
		
		response.setContentType("text/html; charset=utf-8");
		out = response.getWriter();
		
		String type = "";
		
		type = type1+ "," + type2;		
		
		Map<String, Object> sList = storeService.storeList(categoryNo, pageNum, type, keyword, orderBy);
		
		model.addAllAttributes(sList);
		model.addAttribute("categoryNo", categoryNo);
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		model.addAttribute("orderBy", orderBy);
		
		return "store/storeList";
	}
	
	
	// 가게 상세 and 리뷰 리스트
	@RequestMapping("/storeDetail")
	public String StoreDetail(Model model, int storeNo,
			@RequestParam(value="detailOrderBy", required=false, defaultValue="null") String detailOrderBy) {

		Store store = storeService.getStore(storeNo);
		List<Post> bestOnePost = postService.bestOnePost(storeNo);
		List<Post> bestTwoPost = postService.bestTwoPost(storeNo);
		List<Post> bestThreePost = postService.bestThreePost(storeNo);
		
		List<Post> pList = postService.postList(storeNo, detailOrderBy);

		model.addAttribute("store", store);
		model.addAttribute("bestOnePost", bestOnePost);
		model.addAttribute("bestTwoPost", bestTwoPost);
		model.addAttribute("bestThreePost", bestThreePost);
		model.addAttribute("pList", pList);
		model.addAttribute("detailOrderBy", detailOrderBy);

		return "store/storeDetail";
	}
	
	// 가게 상세 and 리뷰리스트
		@RequestMapping("/storeDetailList")
		public String storeDetailList(Model model, int storeNo,
				@RequestParam(value="detailOrderBy", required=false, defaultValue="null") String detailOrderBy) {
			
			Store store = storeService.getStore(storeNo);
			model.addAttribute("store", store);
			
			List<Post> pList = postService.postList(storeNo, detailOrderBy); 
			model.addAttribute("pList", pList);
			
			return "store/storeDetailList";
		}
	
	// 가게 상세 and 댓글 리스트
	@RequestMapping("/storeDetailReply")
	public String StoreDetailReply(Model model, int storeNo) {
		
		Store store = storeService.getStore(storeNo);
		model.addAttribute("store", store);
		
		List<Post> rList = postService.postListReply(storeNo); 
		model.addAttribute("rList", rList);
		
		return "store/storeDetailReply";
	}
	
	// 가게 상세 and 포스트 글 상세
	@RequestMapping("/storeDetailContent")
	public String StoreDetailContent(Model model, int storeNo, int postNo)  {
		
		Store store = storeService.getStore(storeNo);
		model.addAttribute("store", store);
		
		Post post = postService.getPost(postNo);
		model.addAttribute("post", post);
		
		return "store/storeDetailContent";
	}
	
	
	// 가게 정보 글쓰기 폼
	@RequestMapping(value="/storeWriteForm")
	public String insertStoreFrom() {
		
		return "store/storeWriteForm";
	}

	
	 // 가게 정보 글쓰기 프로세스
	@RequestMapping(value="/storeWriteProcess", method=RequestMethod.POST)
	public String insertStoreProcess(String memberId, String storeName, 
			String phone1, String phone2, String phone3, String storeLatitude,
			String storeLongitude,String address2, String address1, String storeTime,
			String storeBookmarks, String storeDayOff, String storeParking, int categoryNo,
			@RequestParam(value="fileMain", required=false) MultipartFile multipartFile,
			@RequestParam(value="fileMenu", required=false) MultipartFile multipartFile2,
			HttpServletResponse response, HttpServletRequest request, HttpSession session) 
		throws IllegalStateException, IOException { 
		
		System.out.println("스토어 작성 시작");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Store store =  new Store();
		
		memberId = (String)session.getAttribute("memberId");
		
		store.setMemberId(memberId);
		store.setStoreName(storeName);
		store.setStorePhone(phone1 + "-" + phone2 + "-" +phone3);
		store.setStoreAddress(address1 + " " + address2);
		store.setStoreLatitude(storeLatitude);
		store.setStoreLongitude(storeLongitude);
		store.setStoreTime(storeTime);
		store.setCategoryNo(categoryNo);
		store.setStoreDayOff(storeDayOff);
		store.setStoreParking(storeParking);
		
		System.out.println("store_name :" + storeName);
		System.out.println("글작성하는 친구 : " + memberId);
		
		if(!multipartFile.isEmpty()) {
			
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid  = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("file : " + file.getName());

			multipartFile.transferTo(file);
			store.setStoreFileMain(saveName);
			
			System.out.println(saveName);
		}
		
		if(!multipartFile2.isEmpty()) {
			
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid  = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile2.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("file : " + file.getName());

			multipartFile2.transferTo(file);
			store.setStoreFileMenu(saveName);
			
			System.out.println(saveName);
		}
		
		storeService.insertStore(store);
		
		return "redirect:storeList"; 
	 }

	
}
