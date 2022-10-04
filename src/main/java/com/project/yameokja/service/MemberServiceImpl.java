package com.project.yameokja.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.MemberDao;
import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public List<Member> myPostList(String mbId) {
		return memberDao.myPostList(mbId);
	}

}
//@Override
//public Member getMember(String mbId) {
//	return memberDao.getMember(mbId);
//}
//
//@Override
//public List<Post> myPostList(String mbId, int pNo) {
//	return memberDao.myPostList(mbId, pNo);
//}
