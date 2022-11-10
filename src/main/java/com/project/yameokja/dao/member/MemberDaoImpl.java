package com.project.yameokja.dao.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	private static final String NAME_SPACE = "com.project.yameokja.mappers.MemberMapper";
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//로그인
	@Override
	public int login(String memberId, String password) {
	
		Member m = sqlSession.selectOne(NAME_SPACE + ".login", memberId);
		int result = 2;
		
		if(m == null) {
			return result;
		}
		
		if(m.getMemberPassword().equals(password)) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	
	// 회원정보 불러오기
	@Override
	public Member getMember(String memberId) {
		return sqlSession.selectOne(NAME_SPACE + ".getMember", memberId);
	}
	
	// 회원가입
	@Override
	public void addMember(Member member) {
		sqlSession.insert(NAME_SPACE + ".addMember", member);
	}

	
	// 아이디 중복확인
	@Override
	public boolean idOverlapCheck(String mbId) {
		
		boolean overlap = false;
				
		String checkId = sqlSession.selectOne(NAME_SPACE + ".idOverlapCheck", mbId);
		
		System.out.println("MemberJoinDao - mbId : " + mbId);
		System.out.println("MemberJoinDao - checkId : " + checkId);
		
		if(checkId != null) {
			overlap = true;
		}
		
		System.out.println("MemberJoinDao - overlap : " + overlap);
		
		return  overlap;
	}
	
	// 아이디 중복확인
	@Override
	public boolean nicknameOverlapCheck(String mbNickname) {
		
		boolean overlap = false;
						String checkNickname = sqlSession.selectOne(NAME_SPACE + ".nicknameOverlapCheck", mbNickname);
		
		System.out.println("MemberJoinDao - mbNickname : " + mbNickname);
		System.out.println("MemberJoinDao - checkNickname : " + checkNickname);
		
		if(checkNickname != null) {
			overlap = true;
		}
		
		System.out.println("MemberJoinDao - overlap : " + overlap);
		
		return  overlap;
	}

	// 차단회원 추가/해제
	@Override
	public void memberBlock(String memberId, String memberBlockIds) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("memberBlockIds", memberBlockIds);
		
		sqlSession.selectList(NAME_SPACE + ".memberBlock", map);
	}

	// 회원정보 조회(아이디 > 닉네임, 프사)
	@Override
	public Member getMemberFor102(String memberId) {
		return sqlSession.selectOne(NAME_SPACE + ".getMemberFor102", memberId);
	}

	// 회원리스트 조회
	@Override
	public List<Member> getMemberList(int startMember, int limit, String sort, String order, String searchBy, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startMember", startMember);
		map.put("sort", sort);
		map.put("order", order);
		map.put("limit", limit);
		map.put("searchBy", searchBy);
		map.put("keyword", keyword);

		return sqlSession.selectList(NAME_SPACE + ".getMemberList", map);
	}
	
	// 총 회원수 조회
	@Override
	public int getMemberCount(String searchBy, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchBy", searchBy);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(NAME_SPACE + ".getMemberCount", map);
	}
	
	// 회원 레벨 수정
	@Override
	public void updateMemberLevel(String memberId, int memberLevel) {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberLevel(memberLevel);
		
		sqlSession.update(NAME_SPACE + ".updateMemberLevel", member);
	}
	// 회원수정
	@Override
	public void updateMember(Member member) {
		sqlSession.update(NAME_SPACE + ".updateMember", member);
	}

	// 회원탈퇴
	@Override
	public void deleteMember(String memberId) {
		sqlSession.delete(NAME_SPACE + ".delMember", memberId);

	}
	// 회원 즐겨찾기 가게 추가
	@Override
	public void addMemberBookmarks(String memberId, String strStoreNo) {
		Map<String, Object>param = new HashMap<String, Object>();
		param.put("memberId", memberId);
		param.put("strStoreNo", strStoreNo);
		System.out.println("dao strStoreNo : " + strStoreNo);
		
		sqlSession.update(NAME_SPACE+".addMemberBookmarks", param);
	}

	// 회원 즐겨찾기 가게 삭제
	@Override
	public void deleteMemberBookmarks(String memberId, String strStoreNo) {
		Map<String, Object>param = new HashMap<String, Object>();
		param.put("memberId", memberId);
		param.put("strStoreNo", strStoreNo);
		
		sqlSession.update(NAME_SPACE+".deleteMemberBookmarks", param);
	}
}