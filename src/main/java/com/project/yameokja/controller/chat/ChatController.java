package com.project.yameokja.controller.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.yameokja.domain.Chat;
import com.project.yameokja.domain.Member;
import com.project.yameokja.service.chat.ChatService;

@Controller
public class ChatController {

	@Autowired
	ChatService chatService;
	
	@RequestMapping("chat/chatList")
	public String chatList(Model model, HttpSession session) {
		Map<String, Object> chatList = chatService.chatList((String)session.getAttribute("memberId"));
		
		model.addAllAttributes(chatList);
		
		return "chat/chatList";
	}
}
