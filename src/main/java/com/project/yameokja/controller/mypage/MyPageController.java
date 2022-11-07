package com.project.yameokja.controller.mypage;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.yameokja.domain.Community;
import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;
import com.project.yameokja.service.mypage.MyPageService;
//스프링 MVC의 컨트롤러임을 선언하고 있다.
@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping(value="/mainmain", method=RequestMethod.GET)
	public String main() {
		return "mypage/mainmain";
	}


	// 로그인 상태에서 동작
	@RequestMapping(value="/myPagePost")
	public String myPagePost(
			Model model, 
			@RequestParam(value = "userId", required = true, defaultValue = "memberId01")String userId,
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
	
	@RequestMapping(value="/deleteMyPagePost")
	public String deleteMyPagePost(
			RedirectAttributes reAttrs,
			@RequestParam(value="postNo", required=false, defaultValue="0")int postNo) {
		myPageService.deleteMyPagePost(postNo);
//		reAttrs.addAttribute("pageNum", pageNum);
		return "redirect:myPagePost";
	}
	
	@RequestMapping(value="/myPageCommunity")
	public String myPageCommunity(
			Model model, 
			@RequestParam(value = "userId", required = false, defaultValue = "memberId01")String userId, 
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
			@RequestParam(value="communityNo", required=false, defaultValue="0")int communityNo) {
		myPageService.deleteMyPagePost(communityNo);
//		reAttrs.addAttribute("pageNum", pageNum);
		return "redirect:myPagePost";
	}
	
	@RequestMapping("/blockList")
	public String blockList(Model model, 
			@RequestParam(value = "memberId", required = false, 
			defaultValue = "memberId01")String memberId) {
		
		model.addAttribute("memberId", memberId);
		return "forward:WEB-INF/views/mypage/blockList.jsp";
	}
	
	@RequestMapping("/userProfile")
	public String userProfile(Model model, 
//			@RequestParam(value = "userId", required = false, defaultValue = "memberId02")String userId,
			@RequestParam(value = "userId", required = false, defaultValue = "null")String userId) {
		Member user = myPageService.getMember(userId);
		model.addAttribute("user", user);
		return "forward:WEB-INF/views/mypage/userProfile.jsp";
	}

}
