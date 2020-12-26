package kr.or.ddit.exam.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.ExamVO;
import kr.or.ddit.exam.dao.ExamDAO;
import kr.or.ddit.request.SearchCriteria;

public class ExamServiceImpl implements ExamService {
	private ExamDAO examDAO;

	public void setExamDAO(ExamDAO examDAO) {
		this.examDAO = examDAO;
	}

	@Override
	public List<ExamVO> getExamList() throws SQLException {
		
		return examDAO.selectExamList();
	}

	@Override
	public ExamVO getExamByNo(String exam_no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registExam(ExamVO exam) throws SQLException {
		exam.setExam_no(examDAO.selectExamNo());//시퀀스 NO
		examDAO.insertExam(exam);		
	}

	@Override
	public void modifyExam(ExamVO exam) throws SQLException {
		examDAO.updateExam(exam);
		
	}

	@Override
	public void removeExam(String exam_no) throws SQLException {
		examDAO.deleteExam(exam_no);
		
	}

	@Override
	public String getExamByNumber(Map<String, Object> ExampleExam_no) throws SQLException {
		
		return examDAO.selectExamByNumber(ExampleExam_no);
	}

	@Override
	public List<ExamVO> getExamByTestNo(String test_no) throws SQLException {		
		return examDAO.selectExamByTestNo(test_no);
	}
	
}
