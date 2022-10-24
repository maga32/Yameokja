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
	public String main(
//			Model model,@RequestParam(value = "pageNum" ,required = false, 
//			defaultValue = "1")int pageNum
//			 
//			HttpSession session,
//			@RequestParam(value="memberId", defaultValue = "memberId01")String memberId
			) {
//		session.getAttribute(memberId);
		
//		model.addAttribute("pageNum", pageNum);
		return "mypage/mainmain";
	}


	// 로그인 상태에서 동작
	@RequestMapping(value="/myPagePost")
	public String myPagePost(
//			HttpSession session,
			Model model, 
			@RequestParam(value = "pageNum" ,required = false, defaultValue = "1")int pageNum,
			@RequestParam(value = "userId", required = true, defaultValue = "memberId01")String userId) 
	{
		
//		 회원정보 하나 
		Member user = myPageService.getMember(userId);
		
//		 회원이 쓴 글 리스트
		Map<String, Object> modelMap = myPageService.myPagePost(pageNum, userId);
		model.addAllAttributes(modelMap);
		model.addAttribute("user", user);
		model.addAttribute("pageNum", pageNum);
		
		return "mypage/myPagePost";
	}
	
	@RequestMapping(value="/myPageCommunity")
	public String myPageCommunity(
			Model model, 
			@RequestParam(value="communityStatus", required=false, defaultValue="all") String status, 
			@RequestParam(value = "memberId", required = false, defaultValue = "memberId01")String memberId, 
			@RequestParam(value = "pageNum", required = false, defaultValue = "1")int pageNum) {

		Member member = myPageService.getMember(memberId);

		Map<String, Object> myPageCommunityList = myPageService.myPageCommunity(memberId, pageNum, status);
		model.addAllAttributes(myPageCommunityList);
		model.addAttribute("member", member);
		
		return "mypage/myPageCommunity";
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
