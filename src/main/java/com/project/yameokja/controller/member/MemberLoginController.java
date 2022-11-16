package com.project.yameokja.controller.member;

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
import com.project.yameokja.domain.Member;
import com.project.yameokja.service.member.MemberService;

@Controller
public class MemberLoginController {

	@Autowired
	MemberService memberService;
	
	// 로그인 뷰
	@RequestMapping("/loginForm")
	public String loginForm() {
		
		return "forward:WEB-INF/views/loginForm.jsp";
	}
	
	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST )
	public String login(Model model,
			@RequestParam("memberId") String id,
			@RequestParam("memberPassword") String password,
			HttpSession session, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int result = memberService.login(id, password);
		
		if(result == 2) {
			out.println("<script>");
			out.println("	alert('존재하지 않는 아이디 입니다.');");
			out.println("	history.back();");
			out.println("</script>");
			
			return null;
			
		}else if(result == 0) {
			out.println("<script>");
			out.println("	alert('비밀번호가 다릅니다.');");
			out.println("	location.href='loginForm';");
			out.println("</script>");
			
			return null;
		}
		Member member = memberService.getMember(id);
		
		if(member.getMemberDelDate() != null) {
			out.println("<script>");
			out.println("	alert('탈퇴한 사용자입니다.');");
			out.println("	location.href='loginForm';");
			out.println("</script>");
			
			return null;
		}
		
		if(member.getMemberLevel() == 0) {
			out.println("<script>");
			out.println("	alert('이용 제한된 사용자입니다.');");
			out.println("	location.href='loginForm';");
			out.println("</script>");
			
			return null;
		}
		
		session.setAttribute("member", member);
		session.setAttribute("memberId", member.getMemberId());
		session.setAttribute("memberNickname", member.getMemberNickname());
		
		System.out.println("memberLoginController - memberid : " + member.getMemberId());
		System.out.println("memberLoginController - memberNickname : " + member.getMemberNickname());
		
		out.println("<script>");
		out.println("opener.location.href=opener.location.href;");
		out.println("window.close();");
		out.println("</script>");
				
		return null;
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:main";
	}
}
