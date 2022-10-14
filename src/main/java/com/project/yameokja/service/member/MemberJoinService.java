package com.project.yameokja.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.member.MemberJoinDao;
import com.project.yameokja.domain.Member;

@Service
public class MemberJoinService {

	@Autowired
	MemberJoinDao memberJoinDao;
	
	// 회원가입
	public void addMember(Member member) {
		
		memberJoinDao.addMember(member);
	};
	
	// 아이디 중복확인
	public Boolean idOverlapCheck(String mbId) {
		
		return memberJoinDao.idOverlapCheck(mbId);
	}
	
	// 닉네임 중복확인
		public Boolean nicknameOverlapCheck(String mbNickname) {
			
			return memberJoinDao.nicknameOverlapCheck(mbNickname);
		}
	
	
}
