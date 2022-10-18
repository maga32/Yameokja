package com.project.yameokja.service.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.member.MemberDao;
import com.project.yameokja.dao.chat.ChatDao;
import com.project.yameokja.domain.Chat;
import com.project.yameokja.domain.Member;

@Service
public class ChatServiceImpl implements ChatService {
	
	ChatDao chatDao;
	MemberDao memberLoginDao;
	
	@Autowired
	public void setChatDao(ChatDao chatDao) {
		this.chatDao = chatDao;
	}

	@Autowired
	public void setMemberLoginDao(MemberDao memberLoginDao) {
		this.memberLoginDao = memberLoginDao;
	}


	@Override
	public Chat getChat(int chatNo) {
		return chatDao.getChat(chatNo);
	}
	
	@Override
	public Map<String, Object> chatList(String memberId) {
		Map<String, Object> chatList = new HashMap<String, Object>();
		ArrayList<Chat> chats = new ArrayList<Chat>();
		ArrayList<Member> members = new ArrayList<Member>();
		
		// 멤버id가 갖는 대화방(chatIds)목록을 리스트로 받아옴
		List<String> chatIds = chatDao.chatIds(memberId);
		
		String tempId = "";
		
		//가져온 대화방별로 가장 최근대화, 상대방의 아이디를 가져옴
		for(int i=0; i < chatIds.size(); i++) {
			chats.add(chatDao.chatLists(chatIds.get(i)));
			
			tempId = chats.get(i).getChatSender().equals(memberId) ? chats.get(i).getChatReceiver() : chats.get(i).getChatSender(); 			
			members.add(memberLoginDao.getMember(tempId));
		}
		
		
		chatList.put("chats", chats);
		chatList.put("members", members);
		
		return chatList;
	}

	@Override
	public List<Chat> chatTargetList(String chatIds, String orderCheck) {
		return chatDao.chatTargetList(chatIds, orderCheck);
	}

	@Override
	public void chatSend(Chat chat) {
		chatDao.chatSend(chat);
	}

	@Override
	public void chatReadUpdate(String chatIds, String chatReceiver) {
		chatDao.chatReadUpdate(chatIds, chatReceiver);
		
	}

	@Override
	public void chatDelete(int chatNo) {
		chatDao.chatDelete(chatNo);
	}

	@Override
	public void chatLeave(int chatNo, String orderCheck) {
		chatDao.chatLeave(chatNo, orderCheck);
	}

	@Override
	public void chatLeave(String chatIds, String orderCheck) {
		chatDao.chatLeave(chatIds, orderCheck);
	}

}
