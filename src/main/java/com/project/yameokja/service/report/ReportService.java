package com.project.yameokja.service.report;

import java.util.List;
import java.util.Map;

import com.project.yameokja.domain.Report;

public interface ReportService {
	
	public void addReport(Report report);
	
	public Map<String, Object> reportList(int categoryNo, String reportPunishCheck, String type, String keyword, int pageNum);
	
	public int reportFormCategoryNo(String userId,  int categoryNo, String postNo);
	
	public Report getReport(int reportNo);
	
	public void reportUpdate(Report report);
	
	public void deleteReport(int reportNo);

}
