package com.project.yameokja.service.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.category.CategoryDao;
import com.project.yameokja.domain.Category;

@Service
public class MainServiceImpl implements MainService {

	private CategoryDao categoryDao;

	@Autowired
	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	
	public List<Category> categoryList(String type) {
		return categoryDao.categoryList(type);
	}
	
}
