package com.project.yameokja.dao.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Report;

@Repository
public class ReportDaoImpl implements ReportDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.project.yameokja.mappers.ReportMapper";

	// 신고 입력
	@Override
	public void addReport(Report report) {
		sqlSession.insert(NAME_SPACE + ".addReport", report);
	}

	// 신고 목록 조회
	@Override
	public List<Report> getReportList(String reportType, int reportPunishCheck, String type, String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reportType", reportType);
		map.put("reportPunishCheck", reportPunishCheck);
		map.put("type", type);
		map.put("keyword", keyword);
		//map.put("pageNum", pageNum);
		
		System.out.println("dao - keyword : " + keyword + ", type : " + type + ", reportType : " + reportType + ", reportPunishCheck : " + reportPunishCheck);
		
		return sqlSession.selectList(NAME_SPACE + ".getReportList", map);
	}

	
	
	
	// 신고목록 수 조회
	@Override
	public int reportCount(String reportType, int reportPunishCheck, String type, String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reportType", reportType);
		map.put("reportPunishCheck", reportPunishCheck);
		map.put("type", type);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(NAME_SPACE + ".reportCount" + map);
	}
	
}
