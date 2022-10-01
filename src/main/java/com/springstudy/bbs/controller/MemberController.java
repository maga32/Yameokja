package com.springstudy.bbs.controller;

import java.io.Console; 
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springstudy.bbs.domain.Board;
import com.springstudy.bbs.domain.Member;
import com.springstudy.bbs.domain.Post;
import com.springstudy.bbs.service.MemberService;

//스프링 MVC의 컨트롤러임을 선언하고 있다.
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value="/MyPostList", method=RequestMethod.GET)
	public String MyPostList(Model model, 
			@RequestParam(defaultValue = "memberId03")String mbId) {		
		
		List<Member> post = memberService.myPostList(mbId);
		model.addAttribute("post", post);
		
		return "MyPostList";
	}

}
