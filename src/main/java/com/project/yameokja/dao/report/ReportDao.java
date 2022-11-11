package com.project.yameokja.dao.report;
import java.util.List;
import com.project.yameokja.domain.Report;


public interface ReportDao {

	// 신고 입력
	public void addReport(Report report);
	
	// 신고목록 조회
	public List<Report> reportList(int memberLevel, String memberId, int categoryNo, String reportPunishCheck, String type, String keyword, int startRow, int num);
	
	// 신고 목록 수 조회
	public int reportCount(int memberLevel, String memberId, int categoryNo, String reportPunishCheck, String type, String keyword);
	
	//신고 디테일 페이지
	public Report getReport(int reportNo);
	
	//신고 디테일 수정
	public void reportUpdate(Report report);
	
	//삭제
	public void deleteReport(int reportNo);
	
	void memberPermanenSuspension(String memberId);
}

