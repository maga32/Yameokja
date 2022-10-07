package com.project.yameokja.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.MyPageDao;
import com.project.yameokja.domain.Community;
import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDao memberDao;
	
	public void setMemberDao(MyPageDao memberDao) {
		this.memberDao = memberDao;
	}
	
	@Override
	public Member getMember(String memberId) {
		return memberDao.getMember(memberId);
	}

	@Override
	public List<Post> myPagePost(String memberId) {
		return memberDao.myPagePost(memberId);
		
	}

	@Override
	public List<Community> myPageCommunity(String memberId) {
		return memberDao.myPageCommunity(memberId);
	}

}

//@Override
//public List<Post> myPostList(String memberId, int pNo) {
//	return memberDao.myPostList(memberId, pNo);
//}
