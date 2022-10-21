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
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.yameokja.domain.Chat;
import com.project.yameokja.domain.Member;
import com.project.yameokja.service.chat.ChatService;
import com.project.yameokja.service.member.MemberService;

@Controller
public class ChatController {

	@Autowired
	ChatService chatService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("chat/chatList")
	public String chatList(Model model, HttpSession session) {
		Map<String, Object> chatList = chatService.chatList((String)session.getAttribute("memberId"));
		
		model.addAllAttributes(chatList);
		
		return "forward:/WEB-INF/views/chat/chatList.jsp";
	}
	
	// 채팅방 뷰
	@RequestMapping("chat/chatDetail")
	public String chatDetail(Model model, HttpSession session, HttpServletResponse response, String targetId) throws IOException {
		String memberId = (String)session.getAttribute("memberId");
		Member target = memberService.getMember(targetId);
		String chatIds = "";
		
		if(targetId.compareTo(memberId) < 0) {	// 타겟아이디가 내아이디보다 사전순으로 앞인 경우
			chatIds = targetId + "," + memberId;
		} else if(targetId.compareTo(memberId) > 0) { 	// 타겟아이디가 내아이디보다 사전순으로 뒤인 경우
			chatIds = memberId + "," + targetId;
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('본인과는 채팅할 수 없습니다.');");
			out.println("	history.back();");
			out.println("</script>");
			
			return null;
		}
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("chatIds", chatIds);
		model.addAttribute("target", target);
		model.addAttribute("isBlockedMe", memberService.isBlockedMe(memberId, targetId));
		model.addAttribute("isBlockedTarget", memberService.isBlockedMe(targetId,memberId));
		
		return "forward:/WEB-INF/views/chat/chatDetail.jsp";
	}
	
	//채팅방 내 채팅내용 뷰
	@RequestMapping("chat/chatting")
	public String chatting(Model model, HttpSession session, String chatIds) {
		String memberId = (String)session.getAttribute("memberId");
		String[] ids = chatIds.split(",");
		String orderCheck = "";
		String targetId = "";
		
		//아이디0이 아이디1보다 사전순으로 큰경우(수동입력 등)
		if(ids[0].compareTo(ids[1]) >= 0) return null;
		
		if(ids[0].equals(memberId)) {
			orderCheck = "id0";
			targetId = ids[1];
		} else if(ids[1].equals(memberId)) {
			orderCheck = "id1";
			targetId = ids[0];
		} else {
			return null;
		}
		
		chatService.chatReadUpdate(chatIds, memberId);
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("chatTargetList", chatService.chatTargetList(chatIds, orderCheck));
		model.addAttribute("target", memberService.getMember(targetId));
		
		return "forward:/WEB-INF/views/chat/chatting.jsp";
	}
	
	// 채팅보내기 ajax
	@RequestMapping("chat/chatSend.ajax")
	@ResponseBody
	public Map<String, Integer> chatSend(HttpSession session, Chat chat) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		String memberId = (String)session.getAttribute("memberId");
		String[] ids = chat.getChatIds().split(",");
		
		if(ids[0].compareTo(ids[1]) >= 0) {
			map.put("result", -1);
			return map;
		}
		
		if(ids[0].equals(memberId)) {
			chat.setChatReceiver(ids[1]);
		} else if(ids[1].equals(memberId)) {
			chat.setChatReceiver(ids[0]);
		} else {
			map.put("result", 0);
			return map;
		}
		
		chat.setChatSender(memberId);
		chatService.chatSend(chat);
		
		map.put("result", 1);
		
		return map;
	}
	
	// 단일채팅 삭제 ajax
	@RequestMapping("chat/chatDelete.ajax")
	@ResponseBody
	public Map<String, Integer> chatDelete(HttpSession session, int chatNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		String memberId = (String)session.getAttribute("memberId");
		Chat chat = chatService.getChat(chatNo);
		String[] ids = chat.getChatIds().split(",");
		String orderCheck = "";
		
		if(ids[0].equals(memberId)) {
			orderCheck = "id0";
		} else if(ids[1].equals(memberId)) {
			orderCheck = "id1";
		} else {
			map.put("result", 0);
			return map;
		}
		
		if(chat.getChatReadCheck() == 0) {
			chatService.chatDelete(chatNo);
		} else {
			chatService.chatLeave(chatNo, orderCheck);			
		}
		map.put("result", 1);
		
		return map;
	}
	
	// 채팅방 나가기
	@RequestMapping("chat/chatLeave")
	public String chatLeave(HttpSession session, HttpServletResponse response, String chatIds) throws IOException {
		String memberId = (String)session.getAttribute("memberId");
		String[] ids = chatIds.split(",");
		String orderCheck = "";
		
		//아이디0이 아이디1보다 사전순으로 큰경우(수동입력 등)
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
			orderCheck = "id0";
		} else if(ids[1].equals(memberId)) {
			orderCheck = "id1";
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('본인의 채팅방만 접근할 수 있습니다.');");
			out.println("	history.back();");
			out.println("</script>");
			
			return null;
		}
		
		chatService.chatLeave(chatIds, orderCheck);
		
		return "redirect:chatList";
	}
}
