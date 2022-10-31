package com.project.yameokja.service.report;

import java.util.List;

import com.project.yameokja.domain.Report;

public interface ReportService {
	
	public void addReport(Report report);
	
	public List<Report> reportList(int categoryNo, String reportPunishCheck, String type, String keyword);
	
	public Report getReport(int reportNo);
	
	public void reportUpdate(Report report);
	
	public void deleteReport(int reportNo);

}
