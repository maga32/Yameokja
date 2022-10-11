package com.project.yameokja.controller.chat;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.yameokja.domain.Chat;
import com.project.yameokja.domain.Member;
import com.project.yameokja.service.chat.ChatService;
import com.project.yameokja.service.member.MemberLoginService;

@Controller
public class ChatController {

	@Autowired
	ChatService chatService;
	
	@Autowired
	MemberLoginService memberLoginService;
	
	@RequestMapping("chat/chatList")
	public String chatList(Model model, HttpSession session) {
		Map<String, Object> chatList = chatService.chatList((String)session.getAttribute("memberId"));
		
		model.addAllAttributes(chatList);
		
		return "chat/chatList";
	}
	
	@RequestMapping("chat/chatDetail")
	public String chatDetail(Model model, HttpSession session, HttpServletResponse response, String chatIds) throws IOException {
		String memberId = (String)session.getAttribute("memberId");
		String[] ids = chatIds.split(",");
		String leaveCheck = "";
		String targetId = "";
		
		if(ids[0].compareTo(ids[1]) >= 0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('잘못된 접근입니다.');");
			out.println("	history.back();");
			out.println("</script>");
			
			return null;
		}
		
		if(ids[0].equals(memberId)) {
			leaveCheck = "id0";
			targetId = ids[1];
		} else if(ids[1].equals(memberId)) {
			leaveCheck = "id1";
			targetId = ids[0];
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('본인의 채팅방만 접근할 수 있습니다.');");
			out.println("	history.back();");
			out.println("</script>");
			
			return null;
		}
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("chatTargetList", chatService.chatTargetList(chatIds, leaveCheck));
		model.addAttribute("target", memberLoginService.getMember(targetId));
		
		return "chat/chatDetail";
	}
}
