package com.project.yameokja.dao.chat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Chat;

@Repository
public class ChatDaoImpl implements ChatDao {

	private static final String NAME_SPACE = "com.project.yameokja.mappers.chat.ChatMapper";
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<String> chatIds(String memberId) {
		return sqlSession.selectList(NAME_SPACE + ".chatIds", memberId);
	}

	@Override
	public Chat chatLists(String chatIds) {
		return sqlSession.selectOne(NAME_SPACE + ".chatLists", chatIds);
	}

	@Override
	public List<Chat> chatTargetList(String chatIds, String orderCheck) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("chatIds", chatIds);
		map.put("orderCheck", orderCheck);
		
		return sqlSession.selectList(NAME_SPACE + ".chatTargetList", map);
	}

	@Override
	public void chatSend(Chat chat) {
		sqlSession.insert(NAME_SPACE + ".chatSend", chat);
	}

	@Override
	public void chatReadUpdate(String chatIds, String chatReceiver) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("chatIds", chatIds);
		map.put("chatReceiver", chatReceiver);
		
		sqlSession.update(NAME_SPACE + ".chatReadUpdate", map);
	}

}
