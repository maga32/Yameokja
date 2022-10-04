package com.project.yameokja.controller;

import java.io.Console; 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.yameokja.domain.Member;
import com.project.yameokja.service.MemberService;

//스프링 MVC의 컨트롤러임을 선언하고 있다.
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String main(Model model, 
			@RequestParam(defaultValue = "memberId03")String mbId) {
		model.addAttribute("mbId", mbId);
		System.out.println(mbId);
		return "main";
	}

	@RequestMapping(value="/userPostList", method=RequestMethod.GET)
	public String userPostList(Model model, String mId) {
		
		return "";
	}
	
	// 로그인 상태에서 동작
	@RequestMapping(value="/myPostList", method=RequestMethod.GET)
	public String myPostList(Model model, 
			@RequestParam(value="mId", required=false, defaultValue = "null") String mId) {
		
		if(mId.equals("null")) { // 자신
			
		} else {	// 타인
			
		}
		//프로필 페이지를 통해 접근하면 mbId가 있는 거고,
		//로그인이 안 됬을 때는 
		
		
		// 로그인 상태라고 작업
		String mbId = "memberId01";		
		System.out.println("mbId : "+mbId);

		// 회원정보 하나 
		//Member member = memberService.getMember(mbId);
		
		// 회원이 쓴 글 리스트
		// List<Post> postList = memberService.myPostList(mbId);
		
		model.addAttribute("mbId", mbId);
		//model.addAttribute("post", post);
		
		return "myPostList";
	}

}
