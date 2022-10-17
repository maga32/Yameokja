package com.project.yameokja.dao.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Community;

@Repository
public class CommunityListDaoImpl implements CommunityListDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.project.yameokja.mappers.CommunityListMapper";
	
	// 커뮤니티 글 목록
	@Override
	public List<Community> getCommunity(int startRow, int num, String type, String keyword, String categoryNo) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("type", type);
		params.put("keyword", keyword);
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("cNo", categoryNo);
		
		return sqlSession.selectList(NAME_SPACE+".getCommunity", params);
	}

	// 커뮤니티 글 개수
	@Override
	public int getCommunityCount(String type, String keyword, String categoryNo) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("type", type);
		param.put("keyword", keyword);
		param.put("cNo", categoryNo);
		
		return sqlSession.selectOne(NAME_SPACE + ".getCommunityCount", param);
	}
	
	// 커뮤니티 수다글 작성 프로세스
	@Override
	public void addCommunity101(Community co) {
		sqlSession.insert(NAME_SPACE + ".addCommunity101", co);
	}

	// 커뮤니티 글 상세보기
	@Override
	public Community getCommunityOne(int coNo) {
		return sqlSession.selectOne(NAME_SPACE + ".getCommunityOne", coNo);
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
	}

	// 커뮤니티 댓글 출력
	@Override
	public List<Community> getCommunityReply(Community co) {
		return sqlSession.selectList(NAME_SPACE + ".getCommunityReply", co);
	}

	// 커뮤니티 댓글 삭제
	@Override
	public void delCommunityReply(int no) {
		/*List<Object> reReplyList = sqlSession.selectList(NAME_SPACE + ".getCommunityReReply", no); 
		
		String str = "";
		for( int i=0; i < reReplyList.size(); i++) {
			str += reReplyList.get(i);
		}*/
		sqlSession.delete(NAME_SPACE + ".delCommunityReply", no);
	}

	// 커뮤니티 댓글 삭제 - 답글이 있는 경우
	@Override
	public void updateCommunityReply(int no) {
		
		/*List<Integer> reReplyList = sqlSession.selectList(NAME_SPACE + ".getCommunityReReply", no); 
		
		String str = "";
		for( int i=0; i < reReplyList.size(); i++) {
			str += reReplyList.get(i);
		}
		System.out.println("communityListDao - reReplyList : " + str);
		*/
		sqlSession.update(NAME_SPACE + ".updateCommunityReply", no);
	}
	

	
	

	
	
}

