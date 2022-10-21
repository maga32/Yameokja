package com.project.yameokja.dao.chat;

import java.util.List;

import com.project.yameokja.domain.Chat;

public interface ChatDao {

	Chat getChat(int chatNo);
	
	List<String> chatIds(String memberId);

	Chat chatLists(String chatIds);
	
	List<Chat> chatTargetList(String chatIds, String leaveCheck);
	
	void chatSend(Chat chat);

	void chatReadUpdate(String chatIds, String chatReceiver);

	void chatDelete(int chatNo);

	void chatLeave(int chatNo, String orderCheck);

	void chatLeave(String chatIds, String orderCheck);
	
}
