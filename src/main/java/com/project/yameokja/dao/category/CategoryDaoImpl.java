package com.project.yameokja.dao.category;

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
	public List<Category> categoryList(String type) {
		return sqlSession.selectList(NAME_SPACE + ".categoryList", type);
	}

	@Override
	public int getLastNo(String type) {
		return sqlSession.selectOne(NAME_SPACE + ".getLastNo", type);
	}

	@Override
	public int getLastOrder(String type) {
		return sqlSession.selectOne(NAME_SPACE + ".getLastOrder", type);
	}

	@Override
	public void addCategory(Category newCategory) {
		sqlSession.insert(NAME_SPACE + ".addCategory", newCategory);
		
	}

	@Override
	public void deleteCategory(int categoryNo) {
		sqlSession.delete(NAME_SPACE + ".deleteCategory", categoryNo);
	}

}
