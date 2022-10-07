package com.project.yameokja.service.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.MemberLoginDao;
import com.project.yameokja.dao.chat.ChatDao;
import com.project.yameokja.domain.Chat;
import com.project.yameokja.domain.Member;

@Service
public class ChatServiceImpl implements ChatService {
	
	ChatDao chatDao;
	MemberLoginDao memberLoginDao;
	
	@Autowired
	public void setChatDao(ChatDao chatDao) {
		this.chatDao = chatDao;
	}

	@Autowired
	public void setMemberLoginDao(MemberLoginDao memberLoginDao) {
		this.memberLoginDao = memberLoginDao;
	}

	@Override
	public Map<String, Object> chatList(String memberId) {
		Map<String, Object> chatList = new HashMap<String, Object>();
		ArrayList<Chat> chats = new ArrayList<Chat>();
		ArrayList<Member> members = new ArrayList<Member>();
		
		List<String> chatIds = chatDao.chatIds(memberId);
		
		String tempId = "";
		
		for(int i=0; i < chatIds.size(); i++) {
			chats.add(chatDao.chatLists(chatIds.get(i)));
			
			tempId = chats.get(i).getChatSender().equals(memberId) ? chats.get(i).getChatReceiver() : chats.get(i).getChatSender(); 			
			members.add(memberLoginDao.getMember(tempId));
		}
		
		
		chatList.put("chats", chats);
		chatList.put("members", members);
		
		return chatList;
	}

}
