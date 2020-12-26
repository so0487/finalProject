package kr.or.ddit.exam.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.ExamVO;
import kr.or.ddit.request.SearchCriteria;

public interface ExamService {
	List<ExamVO> getExamList() throws SQLException;
	
	ExamVO getExamByNo(String exam_no) throws SQLException;;
	
	void registExam(ExamVO exam) throws SQLException;
	
	void modifyExam(ExamVO exam) throws SQLException;
	
	void removeExam(String exam_no) throws SQLException;
	
	String getExamByNumber(Map<String,Object> ExampleExam_no) throws SQLException;
	
	List<ExamVO> getExamByTestNo(String test_no) throws SQLException;
}
