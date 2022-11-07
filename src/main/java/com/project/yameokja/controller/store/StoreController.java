package com.project.yameokja.controller.store;

import java.io.File; 
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Store;
import com.project.yameokja.service.member.MemberService;
import com.project.yameokja.service.store.PostService;
import com.project.yameokja.service.store.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private MemberService memberSerivce;
	
	@Autowired
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	// 가게 리스트
	@RequestMapping("/storeList")
	public String StoreList(Model model, String type1, String type2,
			@RequestParam(value="categoryNo", required=false, defaultValue="99") int categoryNo,
			@RequestParam(value="keyword", required=false, defaultValue="null") String keyword,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="orderBy", required=false, defaultValue="null") String orderBy,
			HttpServletResponse response, PrintWriter out) {
		
		response.setContentType("text/html; charset=utf-8");
		
		String type = "";
		
		if(type1 != null) {
			
			switch(type1) {
				case "seoul":
					type1 = "서울시";
					 break;
				case "kyeonggi":
					type1 = "경기";
					break;
				case "incheon":
					type1 = "인천";
					 break;
				case "daejeon":
					type1 = "대전";
					break;
				case "daegu":
					type1 = "대구";
					 break;
				case "busan":
					type1 = "부산";
					break;
				case "ulsan":
					type1 = "울산";
					 break;
				case "gwangju":
					type1 = "광주";
					break;
				case "gangwon":
					type1 = "강원";
					 break;
				case "sejong":
					type1 = "세종";
					break;
				case "chungbuk":
					type1 = "충북";
					 break;
				case "chungnam":
					type1 = "충남";
					break;
				case "gyeongbuk":
					type1 = "경북";
					 break;
				case "gyeongnam":
					type1 = "경남";
					break;
				case "jeonbuk":
					type1 = "전북";
					 break;
				case "jeonnam":
					type1 = "전남";
					break;
				case "jeju":
					type1 = "세종";
					break;
			}
			type = type1+ "," + type2;
		}
		
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
	public String StoreDetail(Model model, int storeNo, HttpSession session) {

		String memberId = (String) session.getAttribute("memberId");
		
		if(memberId != null) {
			Member user = (Member) memberSerivce.getMember(memberId);
			model.addAttribute("userBookmarks", user.getMemberBookmarks());
		}
		
		Store store = storeService.getStore(storeNo);
		List<Post> bestOnePost = postService.bestOnePost(storeNo);
		List<Post> bestTwoPost = postService.bestTwoPost(storeNo);
		List<Post> bestThreePost = postService.bestThreePost(storeNo);
		List<Post> pList = postService.postList(storeNo); 

		model.addAttribute("store", store);
		model.addAttribute("bestOnePost", bestOnePost);
		model.addAttribute("bestTwoPost", bestTwoPost);
		model.addAttribute("bestThreePost", bestThreePost);
		model.addAttribute("pList", pList);

		return "store/storeDetail";
	}
	
	// 가게 상세 and 리뷰리스트
		@RequestMapping("/storeDetailList")
		public String storeDetailList(Model model, int storeNo) {
			
			Store store = storeService.getStore(storeNo);
			model.addAttribute("store", store);
			
			List<Post> pList = postService.postList(storeNo); 
			model.addAttribute("pList", pList);
			
			return "store/storeDetailList";
		}
	
		
	// 가게 상세 and 댓글 리스트
	@RequestMapping("/storeDetailReply")
	public String StoreDetailReply(
			Model model, 
			@RequestParam(value = "storeNo", required = false, defaultValue = "1")int storeNo,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1")int pageNum) {
		
		Store store = storeService.getStore(storeNo);
		
		Map<String, Object> postListReply = postService.postListReply(storeNo, pageNum);
		model.addAllAttributes(postListReply);
		model.addAttribute("store", store);
		model.addAttribute("pageNum", pageNum);
		
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
	public String insertStoreProcess(
			@RequestParam(value="fileMain", required=false) MultipartFile multipartFile) 
		throws IllegalStateException, IOException { 
		
		Store store =  new Store();
	
		storeService.insertStore(store);
	 
		return "store/storeWriteFrom"; 
	 }

	@RequestMapping(value="/storeDatailReplyForm", method=RequestMethod.POST)
	public String insertStoreProcess(
			RedirectAttributes reAttr, int storeNo, HttpSession session,
			String postContent, int postStar, HttpServletRequest request,
			@RequestParam(value="postFile2", required=false) MultipartFile multipartFile) 
		throws IllegalStateException, IOException { 
		
		Post post =  new Post();
		String memberId = (String) session.getAttribute("memberId");
		String memberNickname = (String) session.getAttribute("memberNickname");
		
		post.setMemberId(memberId);
		post.setMemberNickname(memberNickname);
		post.setStoreNo(storeNo);
		post.setPostContent(postContent);
		post.setPostStar(postStar);
		
		if( !multipartFile.isEmpty()) {
			
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid  = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("file : " + file.getName());
			 
			multipartFile.transferTo(file);
			post.setPostFile1(saveName);
		}	
		postService.postReplyAdd(post);
		reAttr.addAttribute("storeNo", storeNo);
	 
		return "redirect:store/postListReply"; 
	 }

	
	// 스토어 즐겨찾기 추가
	@RequestMapping("/bookmarksAdd")
	public String addBookmarks(String memberId, int storeNo,
			HttpServletResponse response, Model model) throws IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 가게 즐겨찾기 확인
		Member user = memberSerivce.getMember(memberId);
		
		if(user != null) {
			String userBookmarks = user.getMemberBookmarks();
			
			if(userBookmarks.contains(Integer.toString(storeNo))) {
				out.print("<script>");
				out.print("alert('이미 찜한 가게입니다');");
				out.print("</script>");
				
				System.out.println("con - 이미 찜한 가게입니다.");
				
				return "redirect:storeDetail?storeNo=" + storeNo;
			}
		}
		
		// member > member_bookmarks 추가
		memberSerivce.addMemberBookmarks(memberId, storeNo);
		
		System.out.println("con-AddBookmarks end");
		
		// store > store_bookmarks 추가
		storeService.addBookmarks(storeNo);
		
		return "redirect:storeDetail?storeNo=" + storeNo;
	}
	
	// 스토어 즐겨찾기 삭제
	@RequestMapping("/bookmarksDelete")
	public String deleteBookmarks(String memberId, int storeNo,
			HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		// member > member_bookmarks 삭제, 가게 즐겨찾기 확인
		Member user = memberSerivce.getMember(memberId);
		
		if(user != null) {
			
			String userBookmarks = user.getMemberBookmarks();
			
			if(!userBookmarks.contains(Integer.toString(storeNo))) {
				out.print("<script>");
				out.print("alert('찜하지 않은 가게입니다');");
				out.print("</script>");
				
				System.out.println("con - 찜하지 않은 가게입니다.");
				
				return "redirect:storeDetail?storeNo=" + storeNo;
			}
			
			String strStoreNo = "";
			
			if(!userBookmarks.contains(",")) {
				strStoreNo =  Integer.toString(storeNo);
			}else {
				strStoreNo = "," + storeNo;
			}
			
			memberSerivce.deleteMemberBookmarks(memberId, strStoreNo);
		}
		
		// store > store_bookmarks 삭제
		storeService.deleteBookmarks(storeNo);
		
		System.out.println("con-deleteBookmarks end");
		
		return "redirect:storeDetail?storeNo=" + storeNo;
	}
	 
	@RequestMapping(value="/delete")
	public String deleteDetailReply(HttpServletResponse respnonse) {
		return "";
	}
	
}
