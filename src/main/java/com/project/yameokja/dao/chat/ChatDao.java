package com.project.yameokja.dao.chat;

import java.util.List;

import com.project.yameokja.domain.Chat;

public interface ChatDao {

	List<String> chatIds(String memberId);

	Chat chatLists(String chatIds);
	
	List<Chat> chatTargetList(String chatIds, String leaveCheck);
	
	void chatSend(Chat chat);
	
}
