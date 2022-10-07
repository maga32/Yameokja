package com.project.yameokja.dao.chat;

import java.util.List;

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

}
