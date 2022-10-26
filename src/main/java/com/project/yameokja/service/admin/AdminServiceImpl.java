package com.project.yameokja.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.category.CategoryDao;
import com.project.yameokja.dao.member.MemberDao;
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
		int lastNo = 0;
		int lastOrder = 0;
		
		// db카테고리가 존재하는 경우
		if(categoryDao.getLastNo(type) != null) { 
			lastNo = categoryDao.getLastNo(type);
			lastOrder = categoryDao.getLastOrder(type);
		} else { // db카테고리에 하나도 없는경우
			if(type.equals("community")) {
				lastNo = 100;
			} else if(type.equals("report")) {
				lastNo = 300;
			}
			lastOrder = 0;
		}
		
		Category newCategory = new Category(lastNo + 1, categoryName, lastOrder+1);
		categoryDao.addCategory(newCategory);
	}

	@Override
	public void deleteCategory(int categoryNo) {
		categoryDao.deleteCategory(categoryNo);
	}

	@Override
	public void updateCategory(Category category) {
		categoryDao.updateCategory(category);
	}

}
