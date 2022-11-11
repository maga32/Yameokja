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
import org.springframework.web.multipart.MultipartFile;

import com.project.yameokja.dao.member.MemberDao;
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
	
	private final static String DEFAULT_PATH = "/resources/IMG/store";
	
	private final static String DEFAULT_PATH2 = "/resources/IMG/post";
	
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
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="detailOrderBy", required=false, defaultValue="null") String detailOrderBy,  HttpSession session) {

		String memberId = (String) session.getAttribute("memberId");
		
		if(memberId != null) {
			boolean result = memberService.isBookmarks(memberId, storeNo);
			model.addAttribute("result", result);
		}
		
		Store store = storeService.getStore(storeNo);
		
		storeService.addStoreReadCount(storeNo);
		storeService.addStoreReviewCount(storeNo);
		
		Post bestOnePost = postService.bestOnePost(storeNo);
		List<Post> bestTwoPost = postService.bestTwoPost(storeNo);
		List<Post> bestThreePost = postService.bestThreePost(storeNo);
		
		if(bestOnePost != null) {
			Member member = memberSerivce.getMember(bestOnePost.getMemberId());
			String bestMemberPhoto = member.getMemberPhoto();
			model.addAttribute("bestMemberPhoto", bestMemberPhoto);
		}
		
		Map<String,Object> pList = postService.postList(storeNo,pageNum, detailOrderBy); 

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
				@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
				@RequestParam(value="detailOrderBy", required=false, defaultValue="null") String detailOrderBy) {
			
			Store store = storeService.getStore(storeNo);
			model.addAttribute("store", store);
			
			Map<String,Object> list = postService.postList(storeNo, pageNum, detailOrderBy); 
			
			model.addAllAttributes(list);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("detailOrderBy", detailOrderBy);
			
			return "store/storeDetailList";
		}
	
	// 가게 상세 and 댓글 리스트
	@RequestMapping("/storeDetailReply")
	public String StoreDetailReply(Model model, int storeNo,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum) {
		
		Store store = storeService.getStore(storeNo);	
		Map<String, Object> rList = postService.postListReply(storeNo, pageNum); 
		model.addAllAttributes(rList);
		model.addAttribute("store", store);

		return "store/storeDetailReply";
	}
	
	// 가게 상세 and 포스트 글 상세
	@RequestMapping("/storeDetailContent")
	public String StoreDetailContent(Model model, int storeNo, int postNo)  {
		
		Store store = storeService.getStore(storeNo);
		model.addAttribute("store", store);
		
		Post post = postService.getPost(postNo);
		model.addAttribute("post", post);
		
		Member member = memberSerivce.getMember(post.getMemberId());
		String memberPhoto = member.getMemberPhoto();
		model.addAttribute("memberPhoto", memberPhoto);
		
		
		return "store/storeDetailContent";
	}
	
	
	// 가게 정보 글쓰기 폼
	@RequestMapping(value="/storeWriteForm")
	public String insertStoreFrom() {
		
		return "store/storeWriteForm";
	}

	 // 가게 정보 글쓰기 프로세스
	@RequestMapping(value="/storeWriteProcess", method=RequestMethod.POST)
	public String insertStoreProcess(String memberId, String memberNickname, String storeName, 
			String phone1, String phone2, String phone3, String storeLatitude,
			String storeLongitude,String address2, String address1, String storeTime,
			String storeDayOff, String storeParking, int categoryNo,
			@RequestParam(value="fileMain", required=false) MultipartFile multipartFile,
			@RequestParam(value="fileMenu", required=false) MultipartFile multipartFile2,
			HttpServletResponse response, HttpServletRequest request, HttpSession session) 
		throws IllegalStateException, IOException { 
		
		Store store =  new Store();
		
		memberId = (String)session.getAttribute("memberId");
		memberNickname = (String)session.getAttribute("memberNickname");
		
		if(memberId == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('로그인이 필요한 서비스입니다.');");
			out.println("	history.back();");
			out.println("</script>");
			
			return null;
		}
		
		store.setMemberId(memberId);
		store.setStoreName(storeName);
		store.setStorePhone(phone1 + "-" + phone2 + "-" +phone3);
		store.setStoreAddress(address1 + "," + address2);
		store.setStoreLatitude(storeLatitude);
		store.setStoreLongitude(storeLongitude);
		store.setStoreTime(storeTime);
		store.setCategoryNo(categoryNo);
		store.setStoreDayOff(storeDayOff);
		store.setStoreParking(storeParking);
		
		System.out.println("store_name :" + storeName);
		
		System.out.println("위도 : " + storeLatitude);
		System.out.println("경도 : " + storeLongitude);
		
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
	
	// 스토어 즐겨찾기 추가 or 삭제
	@RequestMapping("/bookmarksUpdate")
	public String addBookmarks(String memberId, int storeNo, Model model) {

		boolean result = memberService.isBookmarks(memberId, storeNo);
		memberService.updateMemberBookmarks(memberId, storeNo, result);

		storeService.addBookmarks(storeNo);

		return "redirect:storeDetail?storeNo=" + storeNo;
	}

	// 가게글 수정폼
	@RequestMapping("/storeUpdateForm")
	public String storeUpdateForm(Model model,HttpServletResponse response, HttpSession session, int storeNo)
			throws IOException {
		
		Store store = storeService.getStore(storeNo);

		Member member = (Member) session.getAttribute("member");
		
		if(member == null || member.getMemberLevel() < 7) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('가게정보 수정은 관리자만 가능합니다!');");
			out.println("	history.back();");
			out.println("</script>");
			
			return null;
		}
		
		String phone = store.getStorePhone();
		String phone1, phone2, phone3;
		
		String[] sArray = phone.split("-");
		
		phone1 = sArray[0];
		phone2 = sArray[1];
		phone3 = sArray[2];
		
		System.out.println("번호 나눠진거 확인 : " + phone1 + "/" + phone2 + "/" + phone3);
		
		model.addAttribute("store", store);
		model.addAttribute("phone1", phone1);
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone3", phone3);
		
		return "store/storeUpdateForm";
	}
	
	// 가게 수정
		@RequestMapping("/storeUpdateProcess")
		public String storeUpdateProcess( Store store, String phone1, String phone2, String phone3,
				@RequestParam(value="storeFileMain", required=false)MultipartFile multipartFile,
				@RequestParam(value="storeFileMenu", required=false)MultipartFile multipartFile2,
				HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
			
			System.out.println("store.storeNo" + store.getStoreName() + store.getStoreLatitude() + store.getStoreLongitude() + store.getStoreAddress());
			
			Store oldStore = storeService.getStore(store.getStoreNo());
			store.setStorePhone(phone1 + "-" + phone2 + "-" +phone3);
			
			if(!multipartFile.isEmpty()) {
				
				String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
				UUID uid  = UUID.randomUUID();
				String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
				
				File file = new File(filePath, saveName);
				System.out.println("file : " + file.getName());

				multipartFile.transferTo(file);
				store.setStoreFileMain(saveName);
				
				System.out.println(saveName);
			} else {
				store.setStoreFileMain(oldStore.getStoreFileMain() );
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
			} else {
				store.setStoreFileMenu(oldStore.getStoreFileMenu() );
			}

			storeService.updateStore(store);
			
			return "redirect:storeDetail?storeNo=" + oldStore.getStoreNo();
		}

	// 가게 별점댓글 추가
	@RequestMapping(value="/storeDetailReplyProcess", method=RequestMethod.POST)
	public String addReply(String postContent, int postStar, int storeNo,
			@RequestParam(value="postFile1", required=false) MultipartFile multipartFile,
			HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception {
		
		Post post =  new Post();
		
		String memberId = (String)session.getAttribute("memberId");
		String memberNickname = (String)session.getAttribute("memberNickname");
		
		if(memberId == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('로그인이 필요한 서비스입니다.');");
			out.println("	history.back();");
			out.println("</script>");
			
			return null;
		}
		
		post.setMemberId(memberId);
		post.setMemberNickname(memberNickname);
		post.setPostContent(postContent);
		post.setPostStar(postStar);
		post.setStoreNo(storeNo);
		
		if(postContent.isEmpty()) {
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('댓글내용을 입력해주세요');");
			out.println("	history.back();");
			out.println("</script>");
			
			return null;
		}		
		
		
		if(!multipartFile.isEmpty()) {
			
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH2);
			UUID uid  = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("file : " + file.getName());

			multipartFile.transferTo(file);
			post.setPostFile1(saveName);
			
			System.out.println("댓글 이미지 :" + saveName);
		} else {
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('가게 관련 이미지를 첨부하셔야 합니다.');");
			out.println("	history.back();");
			out.println("</script>");
			
		}
		
		postService.addReply(post);
		
		return "redirect:/storeDetailReply?storeNo="+storeNo;
	}
	
	// 가게 별점댓글 삭제
	@RequestMapping(value="/deleteReplyProcess")
	public String deleteReply(HttpSession session, HttpServletResponse response, int postNo) 
		throws IOException{	
		
		Post post= postService.getPost(postNo);
		
		if(!post.getMemberId().equals(session.getAttribute("memberId"))) {
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('본인의 댓글만 삭제할 수 있습니다.');");
			out.println("	history.back();");
			out.println("</script>");
			
			return null;
		}

		postService.deleteReply(postNo);
		
		return "redirect:storeDetailReply?storeNo=" + post.getStoreNo();
	 }
	
}
