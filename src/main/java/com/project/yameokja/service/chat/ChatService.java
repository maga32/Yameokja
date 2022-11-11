package com.project.yameokja.service.chat;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.project.yameokja.domain.Chat;

public interface ChatService {

	Chat getChat(int chatNo);
	
	Map<String, Object> chatList(String memberId);
	
	List<Chat> chatTargetList(String chatIds, String orderCheck);
	
	void chatSend(Chat chat);

	void chatReadUpdate(String chatIds, String chatReceiver);

	void chatDelete(int chatNo);

	void chatLeave(int chatNo, String orderCheck);

	void chatLeave(String chatIds, String orderCheck);
	
}
