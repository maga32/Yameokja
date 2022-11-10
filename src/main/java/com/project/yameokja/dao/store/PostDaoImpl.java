package com.project.yameokja.dao.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Post;

@Repository
public class PostDaoImpl implements PostDao {

	private final String NAME_SPACE = "com.project.yameokja.mappers.PostMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//가게 리뷰글 리스트
	@Override
	public List<Post> postList(int storeNo, int num, int startRow, String detailOrderBy) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		
		param.put("storeNo", storeNo);
		param.put("detailOrderBy", detailOrderBy);
		
		param.put("num", num);
		param.put("startRow", startRow);
		
		System.out.println("detailOrderBy : " + detailOrderBy);
		
		return sqlSession.selectList(NAME_SPACE + ".postList", param); 
	}
	
	// 가게 별점댓글 리스트
	@Override
	public List<Post> postListReply(int startRow, int storeNo, int num) {
		
		Map<String, Object> param = new HashMap<String,Object>();
		
		param.put("startRow", startRow);
		param.put("storeNo", storeNo);
		
		// 페이지 사이즈
		param.put("num", num);
		
		System.out.println("댓글 startRow, storeNo, num : " + startRow +", " +  storeNo +", " + num);
		
		return sqlSession.selectList(NAME_SPACE + ".postListReply", param); 
	}
	
	@Override
	public int getPostCount(int storeNo) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("storeNo", storeNo);
		
		return sqlSession.selectOne(NAME_SPACE + ".getPostCount", param);
	}
	
	// 가게 리뷰글 상세보기
	@Override
	public Post getPost(int postNo) {
		
		return sqlSession.selectOne(NAME_SPACE + ".getPost", postNo);
	}

	// 가게 리뷰글 작성
	@Override
	public void insertPost(Post post) {
		sqlSession.insert(NAME_SPACE + ".insertPost", post);
	}
	
	// 가게 리뷰글 수정
	@Override
	public void updatePost(Post post) {
		// TODO Auto-generated method stub

	}
	
	// 가게 리뷰글 삭제
	@Override
	public void deletePost(int postNo) {
		sqlSession.delete(NAME_SPACE + ".deletePost", postNo);
	}
	
	// 가게 별점댓글 카운트
	@Override
	public int getReplyCount(int storeNo) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("storeNo", storeNo);
		
		return sqlSession.selectOne(NAME_SPACE + ".getReplyCount", param);
	}
	
	// 가게 별점댓글 작성
	public void addReply(Post post) {
		sqlSession.insert(NAME_SPACE + ".addReply", post);
	}

	// 가게 별점댓글 삭제
	@Override
	public void deleteReply(int postNo) {
		sqlSession.delete(NAME_SPACE + ".deleteReply", postNo);
	}


	@Override
	public Post bestOnePost(int storeNo) {
		return sqlSession.selectOne(NAME_SPACE + ".bestOnePost", storeNo);
	}


	@Override
	public List<Post> bestTwoPost(int storeNo) {
		return sqlSession.selectList(NAME_SPACE + ".bestTwoPost", storeNo);
	}


	@Override
	public List<Post> bestThreePost(int storeNo) {
		return sqlSession.selectList(NAME_SPACE + ".bestThreePost", storeNo);
	}

	

	

	


	


}
