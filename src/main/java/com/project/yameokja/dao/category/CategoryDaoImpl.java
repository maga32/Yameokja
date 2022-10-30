package com.project.yameokja.dao.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Category> categoryList(String type) {
		return sqlSession.selectList(NAME_SPACE + ".categoryList", type);
	}
	
	@Override
	public Integer getLastNo(String type) {
		return sqlSession.selectOne(NAME_SPACE + ".getLastNo", type);
	}

	@Override
	public Integer getLastOrder(String type) {
		return sqlSession.selectOne(NAME_SPACE + ".getLastOrder", type);
	}
	
	// (CategoryNo, "byNo") 로 받아오거나, (CategoryOrder, "type") 으로 받아옴
	@Override
	public Category getCategory(int categoryNo) {
		return sqlSession.selectOne(NAME_SPACE + ".getCategory", categoryNo);
	}
	
	@Override
	public void addCategory(Category newCategory) {
		sqlSession.insert(NAME_SPACE + ".addCategory", newCategory);
	}

	@Override
	public void deleteCategory(int categoryNo) {
		sqlSession.delete(NAME_SPACE + ".deleteCategory", categoryNo);
	}

	@Override
	public void updateCategory(Category category) {
		sqlSession.update(NAME_SPACE + ".updateCategory", category);
	}

}
