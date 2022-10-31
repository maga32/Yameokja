package com.project.yameokja.service.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.yameokja.dao.report.ReportDao;
import com.project.yameokja.domain.Report;

@Service
public class ReportService {
	
	@Autowired
	ReportDao reportDao;	
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;
	
	// 신고 입력
	public void addReport(Report report) {
		reportDao.addReport(report);
	}
	
	// 신고 목록 조회
	public List<Report> reportList(int categoryNo, 
			String reportPunishCheck, String type, String keyword){
		
		List<Report> reportList = reportDao.reportList(categoryNo, reportPunishCheck, type, keyword);	

		
		return reportList;
	}
	
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
	
	public Report getReport(int reportNo) {
		return reportDao.getReport(reportNo);
	}
	
	public void reportUpdate(Report report) {
		reportDao.reportUpdate(report);
	};
	
	public void deleteReport(int reportNo) {
		reportDao.deleteReport(reportNo);
	};
	
}
