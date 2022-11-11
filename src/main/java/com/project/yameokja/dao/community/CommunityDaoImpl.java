package com.project.yameokja.dao.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Community;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.project.yameokja.mappers.CommunityMapper";
	
	// 커뮤니티 글 목록
	@Override
	public List<Community> getCommunity(int startRow, int num, String type, String keyword, String categoryNo, String location) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("type", type);
		params.put("keyword", keyword);
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("cNo", categoryNo);
		params.put("location", location);
		
		System.out.println("dao - cNo : " + categoryNo);
		
		return sqlSession.selectList(NAME_SPACE+".getCommunity", params);
	}

	// 커뮤니티 글 개수
	@Override
	public int getCommunityCount(String type, String keyword, String categoryNo, String location) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("type", type);
		param.put("keyword", keyword);
		param.put("cNo", categoryNo);
		param.put("location", location);
		
		return sqlSession.selectOne(NAME_SPACE + ".getCommunityCount", param);
	}
	
	// 커뮤니티 수다글 작성
	@Override
	public void addCommunity101(Community co) {
		sqlSession.insert(NAME_SPACE + ".addCommunity101", co);
	}
	
	// 커뮤니티 수다글 수정
	@Override
	public void updateCommunity101(Community co) {
		sqlSession.update(NAME_SPACE + ".updateCommunity101", co);
	}
		
	// 커뮤니티 모집글 작성
	@Override
	public void addCommunity102(Community co) {
		sqlSession.insert(NAME_SPACE + ".addCommunity102", co);
	}

	// 커뮤니티 모집글 수정
	@Override
	public void updateCommunity102(Community co) {
		sqlSession.update(NAME_SPACE + ".updateCommunity102", co);
	}

	// 커뮤니티 글 상세보기
	@Override
	public Community getCommunityOne(int coNo) {
		return sqlSession.selectOne(NAME_SPACE + ".getCommunityOne", coNo);
	}

	// 커뮤니티 글 삭제
	@Override
	public void deleteCommunity(int coNo) {
		sqlSession.delete(NAME_SPACE + ".deleteCommunity", coNo);
	}

	// 커뮤니티 글 조회수 증가
	@Override
	public void addReadCount(int coNo) {
		sqlSession.update(NAME_SPACE + ".addReadCount", coNo);
	}
	
	// 커뮤니티 댓글 입력
	@Override
	public void addCommunityReply(Community co) {
		sqlSession.insert(NAME_SPACE + ".addCommunityReply", co);
		sqlSession.update(NAME_SPACE + ".addCommunityReplyCount", co.getCommunityParentNo());
	}
	
	//커뮤니티 댓글 수정
	@Override
	public void updateCommunityReply(Community co) {
		sqlSession.update(NAME_SPACE + ".updateCommunityReply", co);
	}

	// 커뮤니티 댓글 출력
	@Override
	public List<Community> getCommunityReply(Community co) {
		return sqlSession.selectList(NAME_SPACE + ".getCommunityReply", co);
	}

	// 커뮤니티 댓글 삭제
	@Override
	public void delCommunityReply(int no,  int communityParentNo) {
		
		int reReplyCount = sqlSession.selectOne(NAME_SPACE + ".countCommunityReReply", no); 
		if( reReplyCount < 1) {
			System.out.println("답글 없음, 답글 갯수 : " + reReplyCount);
			sqlSession.delete(NAME_SPACE + ".delCommunityReply", no);
			sqlSession.update(NAME_SPACE + ".deleteCommunityReplyCount", communityParentNo);
			
		}else {
			System.out.println("답글 있음, 답글 갯수 : " + reReplyCount);
			sqlSession.update(NAME_SPACE + ".delCommunityReplyType2", no);
		}

	}

	// 커뮤니티 댓글 작성자 출력
	@Override
	public String getCommunityReplyMemberId(int no) {
		return sqlSession.selectOne(NAME_SPACE + ".getCommunityReplyMemberId", no);
	}

	// 모집글 참여 여부 수정
	@Override
	public void update102PartyMemberIds(String partyMemberIds, int communityNo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("partyMemberIds", partyMemberIds);
		params.put("communityNo", communityNo);
		
		sqlSession.update(NAME_SPACE + ".update102PartyMemberIds", params);
	}

}

