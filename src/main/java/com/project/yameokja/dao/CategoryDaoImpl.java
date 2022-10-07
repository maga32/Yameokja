package com.project.yameokja.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	private final String NAME_SPACE = "com.project.yameokja.mappers.CategoryMapper";
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Category> caList(String type) {
		return sqlSession.selectList(NAME_SPACE + ".caList", type);
	}

}
