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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// 가게리스트를 전부 받는다
	@RequestMapping("/storeListAll")
	public String StoreListAll(Model model) {
		
		List<Store> sList = storeService.storeListAll();
		model.addAttribute("sList", sList);
		
		return "store/storeListAll";
	}

	// 가게 리스트
	@RequestMapping("/storeList")
	public String StoreList(Model model, int categoryNo) {

		List<Store> sList = storeService.storeList(categoryNo);
		model.addAttribute("sList", sList);

		return "store/storeList";
	}
	
	
	// 가게 상세 and 리뷰 리스트
	@RequestMapping("/storeDetail")
	public String StoreDetail(Model model, int storeNo) {

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
			HttpServletResponse response) throws IOException {
		
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
	 
}
