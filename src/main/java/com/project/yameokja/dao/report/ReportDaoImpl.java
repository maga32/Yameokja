package com.project.yameokja.dao.report;

import java.util.ArrayList;
import java.util.List;

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
	public List<Report> getReportList() {
		return sqlSession.selectList(NAME_SPACE + ".getReportList");
	}
	
}
