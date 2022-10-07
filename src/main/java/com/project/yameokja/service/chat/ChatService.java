package com.project.yameokja.service.chat;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.project.yameokja.domain.Chat;

public interface ChatService {

	Map<String, Object> chatList(String memberId);
	
}
