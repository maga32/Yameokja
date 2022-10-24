package com.project.yameokja.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.category.CategoryDao;
import com.project.yameokja.domain.Category;

@Service
public class AdminServiceImpl implements AdminService {

	private CategoryDao categoryDao;

	@Autowired
	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	@Override
	public List<Category> categoryList(String type) {
		return categoryDao.categoryList(type);
	}

	@Override
	public void addCategory(String type, String categoryName) {
		int lastNo = categoryDao.getLastNo(type);
		int lastOrder = categoryDao.getLastOrder(type);
		Category newCategory = new Category(lastNo+1, categoryName, lastOrder+1);
		categoryDao.addCategory(newCategory);
	}

	@Override
	public void deleteCategory(int categoryNo) {
		categoryDao.deleteCategory(categoryNo);
	}
	

}
