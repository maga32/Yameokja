package com.project.yameokja.service.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.yameokja.dao.report.ReportDao;
import com.project.yameokja.domain.Report;
@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportDao reportDao;	
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;

	@Override
	public void addReport(Report report) {
		reportDao.addReport(report);
	}

	@Override
	public Map<String, Object> reportList(int categoryNo, String reportPunishCheck,String type, String keyword, int pageNum) {
		int currentPage = pageNum;		
		int startRow = (currentPage -1) * PAGE_SIZE;
		int listCount = reportDao.reportCount(categoryNo, reportPunishCheck, type, keyword);
		
		if(listCount > 0) {
			List<Report> reportList = reportDao.reportList(categoryNo, reportPunishCheck, type, keyword, startRow, PAGE_SIZE);
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			int startPage = currentPage / PAGE_GROUP * PAGE_GROUP
									- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0) + 1;
			int endPage = startPage + PAGE_GROUP - 1;
			if(endPage > pageCount) endPage = pageCount;
			
			Map<String, Object> reportMap = new HashMap<String, Object>();
			reportMap.put("reportList", reportList);
			reportMap.put("currentPage", currentPage);
			reportMap.put("listCount", listCount);
			reportMap.put("pageCount", pageCount);
			reportMap.put("startPage", startPage);
			reportMap.put("endPage", endPage);			
			reportMap.put("pageGroup", PAGE_GROUP);
			reportMap.put("categoryNo", categoryNo);
			reportMap.put("reportPunishCheck", reportPunishCheck);
			reportMap.put("type", type);
			reportMap.put("keyword", keyword);
			
			return reportMap;
		}	
			
		return null;		
	}
	
	@Override
	public int reportFormCategoryNo(
			@RequestParam(value="userId", required=false, defaultValue="null")String userId,
			@RequestParam(value="categoryNo", required=false, defaultValue="-7") int categoryNo, 
			@RequestParam(value="postNo", required=false)String postNo) {
//		 카테고리 번호로 분류 나누기
//			store
			if(categoryNo >=1 && categoryNo <=12 && postNo == null) {
				System.out.println("categoryNo : "+categoryNo + ", postNo : "+postNo);
				categoryNo = 301;
//			post
			}else if(categoryNo >=1 && categoryNo <=12 && postNo != null) {
				System.out.println("categoryNo : "+categoryNo + ", postNo : "+postNo);
				categoryNo = 302;
//			community
			}else if( categoryNo == 101 || categoryNo == 102 ){
				System.out.println("categoryNo : "+categoryNo + ", postNo : "+postNo);
				categoryNo = 303;		
//			user
			}else if( categoryNo == -7 && userId != "null" ){
				System.out.println("categoryNo : "+categoryNo + ", postNo : "+postNo);
				categoryNo = 304;
			}
		return categoryNo;
	}

	@Override
	public Report getReport(int reportNo) {
		return reportDao.getReport(reportNo);
	}

	@Override
	public void reportUpdate(Report report) {
		reportDao.reportUpdate(report);
	}

	@Override
	public void deleteReport(int reportNo) {
		reportDao.deleteReport(reportNo);
	}

}
