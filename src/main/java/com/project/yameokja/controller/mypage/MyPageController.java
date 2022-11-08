package com.project.yameokja.controller.mypage;

import java.io.IOException;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.project.yameokja.dao.mypage.MyPageDao;
import com.project.yameokja.domain.Member;
import com.project.yameokja.service.member.MemberService;
import com.project.yameokja.service.mypage.MyPageService;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	@Autowired
	private MyPageDao myPageDao;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/mainmain", method=RequestMethod.GET)
	public String main() {
		return "mypage/mainmain";
	}


	// 로그인 상태에서 동작
	@RequestMapping(value="/myPagePost")
	public String myPagePost(
			Model model, 
			@RequestParam(value = "userId", required = true, defaultValue = "")String userId,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1")int pageNum) {
		
//		 회원정보 하나 
		Member user = myPageService.getMember(userId);
		
//		 회원이 쓴 글 리스트
		Map<String, Object> myPagePost = myPageService.myPagePost(userId, pageNum);
		model.addAllAttributes(myPagePost);
		model.addAttribute("user", user);
		model.addAttribute("pageNum", pageNum);
		
		return "mypage/myPagePost";
	}
	
	@RequestMapping(value="/myPageReply")
	public String myPageReply(
			Model model, 
			@RequestParam(value = "userId", required = true, defaultValue = "")String userId,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1")int pageNum) {
		
//		 회원정보 하나 
		Member user = myPageService.getMember(userId);
		
//		 회원이 쓴 글 리스트
		Map<String, Object> myPageReply = myPageService.myPageReply(userId, pageNum);
		model.addAllAttributes(myPageReply);
		model.addAttribute("user", user);
		model.addAttribute("pageNum", pageNum);
		
		return "mypage/myPageReply";
	}
	
	@RequestMapping(value="/deleteMyPagePost")
	public String deleteMyPagePost(
			RedirectAttributes reAttrs,
			@RequestParam(value = "userId", required = false, defaultValue = "")String userId, 
			@RequestParam(value="postNo", required=false, defaultValue="0")int postNo) {
		myPageService.deleteMyPagePost(postNo);
		reAttrs.addAttribute("userId", userId);
		return "redirect:myPagePost";
	}
	
	@RequestMapping(value="/myPageCommunity")
	public String myPageCommunity(
			Model model, 
			@RequestParam(value = "userId", required = false, defaultValue = "")String userId, 
			@RequestParam(value = "pageNum", required = false, defaultValue = "1")int pageNum) {

		Member user = myPageService.getMember(userId);

		Map<String, Object> myPageCommunityList = myPageService.myPageCommunity(userId, pageNum);
		model.addAllAttributes(myPageCommunityList);
		model.addAttribute("user", user);
		model.addAttribute("pageNum", pageNum);
		
		return "mypage/myPageCommunity";
	}
	
	@RequestMapping(value="/deleteMyPageCommunit")
	public String deleteMyPageCommunit(
			RedirectAttributes reAttrs,
			@RequestParam(value = "userId", required = false, defaultValue = "")String userId, 
			@RequestParam(value="communityNo", required=false, defaultValue="0")int communityNo) {
		myPageService.deleteMyPagePost(communityNo);
		reAttrs.addAttribute("userId", userId);
		return "redirect:myPagePost";
	}
	
	@RequestMapping("/userProfile")
	public String userProfile(Model model, 
			@RequestParam(value = "userId", required = false, defaultValue = "")String userId) {
		Member user = myPageService.getMember(userId);
		int myPagePostCount = myPageDao.myPagePostCount(userId);
		int myPageCommunityCount = myPageDao.myPageCommunityCount(userId);
		model.addAttribute("user", user);
		model.addAttribute("myPagePostCount", myPagePostCount);
		model.addAttribute("myPageCommunityCount", myPageCommunityCount);
		return "forward:WEB-INF/views/mypage/userProfile.jsp";
	}
	
	@RequestMapping("/blockList")
	public String blockList(Model model, HttpSession session, 
			HttpServletResponse response) throws IOException {
		
		String memberBlockIds = memberService.getMember((String)session.getAttribute("memberId")).getMemberBlockIds();
		System.out.println("memberBlockIds : "+memberBlockIds);
		model.addAttribute("memberBlockIds", memberBlockIds);
		
		return "forward:WEB-INF/views/mypage/blockList.jsp";
	}
	
	@RequestMapping(value="/myPageLike")
	public String myPageLike(
			Model model, 
			@RequestParam(value = "userId", required = false, defaultValue = "")String userId, 
			@RequestParam(value = "pageNum", required = false, defaultValue = "1")int pageNum) {

		String memberBookmarks = myPageService.getMember(userId).getMemberBookmarks();

//		Map<String, Object> myPageCommunityList = myPageService.myPageCommunity(userId, pageNum);
		model.addAttribute("memberBookmarks", memberBookmarks);
		
		return "mypage/myPageLike";
	}

}
