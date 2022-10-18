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
	
	// targetId 가 memberId를 차단했는지 확인
	public boolean isBlockedMe(String memberId, String targetId) {
		boolean isBlockedMe = false;
		
		String memberBlockIds = memberDao.getMember(targetId).getMemberBlockIds();
		if(memberBlockIds == null) return false;

		String[] blockIds = memberBlockIds.split(",");
		for(int i=0; i < blockIds.length; i++) {
			if(blockIds[i].equals(memberId)) isBlockedMe = true;
		}
		
		return isBlockedMe;
	}
	
	

}
