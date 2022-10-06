package com.project.yameokja.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.MemberLoginDao;
import com.project.yameokja.domain.Member;

@Service
public class MemberLoginService {

	@Autowired
	MemberLoginDao memberLoginDao;
	
	// 로그인
	public int login(String memberId, String password) {
		
		return memberLoginDao.login(memberId, password);
	}
	
	// 회원정보 불러오기
	public Member getMember(String memberId) {
		
		return memberLoginDao.getMember(memberId);
	}
	
	

}
