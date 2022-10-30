package com.project.yameokja.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.category.CategoryDao;
import com.project.yameokja.dao.member.MemberDao;
import com.project.yameokja.domain.Category;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public List<Category> categoryList(String type) {
		return categoryDao.categoryList(type);
	}
	
	static final int MAX_PAGES = 10;
	static final int MAX_MEMBERS = 10;
	
	// 회원관련 시작 -----------------------------------------------	
	@Override
	public Map<String, Object> getMemberList(int page, String sort, String order, String searchBy, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(sort.equals("id")) { sort = "member_id";
		} else if (sort.equals("nickname")) { sort = "member_nickname";
		} else if (sort.equals("deldate")) { sort = "member_del_date";
		} else if (sort.equals("level")) { sort = "member_level";
		} else { sort = "member_join_date";
		}
		
		if(searchBy != null) {
			if(searchBy.equals("id")) { searchBy = "member_id";
			} else if (searchBy.equals("nickname")) { searchBy = "member_nickname";
			} else if (searchBy.equals("level")) { searchBy = "member_level";
			}
		}
		
		int memberCount = memberDao.getMemberCount(searchBy, keyword);
		int pageCount = memberCount / MAX_MEMBERS + (memberCount % MAX_MEMBERS == 0 ? 0 : 1);
		int startMember = (page-1) * MAX_MEMBERS;
		int limit = (page >= pageCount && memberCount % MAX_MEMBERS != 0) ? (memberCount % MAX_MEMBERS) : MAX_MEMBERS;
		
		int startPage = ((page-1) / MAX_PAGES) * MAX_PAGES + 1;
		int endPage = (startPage + MAX_PAGES -1 > pageCount) ? pageCount : (startPage + MAX_PAGES -1);
				
		map.put("startMember", startMember);
		map.put("limit", limit);
		map.put("memberList", memberDao.getMemberList(startMember, limit, sort, order, searchBy, keyword));
		
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("pageCount", pageCount);
		
		return map;
	}
	

	@Override
	public void updateMemberLevel(String memberId, int memberLevel) {
		memberDao.updateMemberLevel(memberId, memberLevel);
	}
	
	// 회원관련 끝 -----------------------------------------------

	// 카테고리 관련 시작 -----------------------------------------------
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
	// 카테고리 관련 끝 -----------------------------------------------

}
