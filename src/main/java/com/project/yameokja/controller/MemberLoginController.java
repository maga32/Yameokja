package com.project.yameokja.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.yameokja.domain.Member;
import com.project.yameokja.service.MemberLoginService;

@Controller
public class MemberLoginController {

	@Autowired
	MemberLoginService memberLoginService;
	
	// 로그인 뷰
	@RequestMapping("/loginForm")
	public String loginForm() {
		
		return "loginForm";
	}
	
	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST )
	public String login(Model model,
			@RequestParam("memberId") String id,
			@RequestParam("memberPassword") String password,
			HttpSession session, HttpServletResponse response) throws IOException {
		
		int result = memberLoginService.login(id, password);
		
		if(result == 2) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('존재하지 않는 아이디 입니다.');");
			out.println("	history.back();");
			out.println("</script>");
			
			return null;
			
		}else if(result == 0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('비밀번호가 다릅니다.');");
			out.println("	location.href='loginForm'");
			out.println("</script>");
			
			return null;
		}
		Member member = memberLoginService.getMember(id);
		
		session.setAttribute("member", member);
		session.setAttribute("memberId", member.getMemberId());
		session.setAttribute("memberNickname", member.getMemberNickname());
		
		System.out.println("memberLoginController - memberid : " + member.getMemberId());
		System.out.println("memberLoginController - memberNickname : " + member.getMemberNickname());
		
		
		return "redirect:/main";
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:main";
	}
}
