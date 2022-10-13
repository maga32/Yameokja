package com.project.yameokja.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.yameokja.domain.Community;
import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;
import com.project.yameokja.service.MyPageService;

//스프링 MVC의 컨트롤러임을 선언하고 있다.
@Controller
public class MyPageController {

	@Autowired
	private MyPageService memberService;
	
	@RequestMapping(value="/mainmain", method=RequestMethod.GET)
	public String main(Model model, String memberId) {
		memberId = "memberId01";  
		model.addAttribute("memberId", memberId);
		return "mainmain";
	}

//	@RequestMapping(value="/userPostList", method=RequestMethod.GET)
//	public String userPostList(Model model, String mId) {
//		
//		return "";
//	}
//	
	// 로그인 상태에서 동작
	@RequestMapping(value="/myPagePost")
	public String myPagePost(Model model, 
//			@RequestParam(value="mbId", required=false, defaultValue = "null") 
	String memberId) {
		
//		if(mbId.equals("null")) { // 자신
//			
//		} else {	// 타인
//			
//		}
		//프로필 페이지를 통해 접근하면 mbId가 있는 거고,
		//로그인이 안 됬을 때는 
		
		
		// 로그인 상태라고 작업
		memberId = "memberId01";	
		
//		 회원정보 하나 
		Member member = memberService.getMember(memberId);
		
		// 회원이 쓴 글 리스트
		 List<Post> postList = memberService.myPagePost(memberId);
		
		model.addAttribute("member", member);
		model.addAttribute("postList", postList);
		
		return "myPagePost";
	}
	
	@RequestMapping(value="/myPageCommunity")
	public String myPageCommunity(Model model, String memberId) {

		memberId = "memberId01";	

		Member member = memberService.getMember(memberId);

		 List<Community> communityList = memberService.myPageCommunity(memberId);
		
		model.addAttribute("member", member);
		model.addAttribute("communityList", communityList);
		
		return "myPageCommunity";
	}

}
