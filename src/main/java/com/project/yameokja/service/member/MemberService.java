package com.project.yameokja.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.member.MemberDao;
import com.project.yameokja.domain.Member;

@Service
public class MemberService {

	@Autowired
	MemberDao memberDao;
	
	// 로그인
	public int login(String memberId, String password) {
		
		return memberDao.login(memberId, password);
	}
	
	// 회원정보 불러오기
	public Member getMember(String memberId) {
		
		return memberDao.getMember(memberId);
	}
	
	// 회원가입
	public void addMember(Member member) {
		
		memberDao.addMember(member);
	};
	
	// 아이디 중복확인
	public Boolean idOverlapCheck(String mbId) {
		
		return memberDao.idOverlapCheck(mbId);
	}
	
	// 닉네임 중복확인
	public Boolean nicknameOverlapCheck(String mbNickname) {
		
		return memberDao.nicknameOverlapCheck(mbNickname);
	}

	// 회원정보 조회(아이디 > 닉네임, 프사)
	public Member getMemberFor102(String memberId) {
		return memberDao.getMemberFor102(memberId);
	}

	
	

}
