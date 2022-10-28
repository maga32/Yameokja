package com.project.yameokja.service.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.report.ReportDao;
import com.project.yameokja.domain.Community;
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
	public List<Report> getReportList(String reportType, int reportPunishCheck, 
				String type, String keyword){
		
		List<Report> reportList = reportDao.getReportList(reportType, reportPunishCheck, type, keyword);	
		
		return reportList;
	}
}
