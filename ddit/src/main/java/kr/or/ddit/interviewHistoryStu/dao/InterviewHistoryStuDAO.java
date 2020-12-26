package kr.or.ddit.interviewHistoryStu.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.InterviewHistoryStuVO;

public interface InterviewHistoryStuDAO {
	List<InterviewHistoryStuVO> selectInterviewHistoryStuList(String interview_no) throws SQLException;
	
	InterviewHistoryStuVO selectInterviewHistoryStuByNo(String interview_history_stu_no) throws SQLException;
	
	List<InterviewHistoryStuVO> selectInterviewHistoryStuByStu(String student_id) throws SQLException;
	
	void insertInterviewHistoryStu(InterviewHistoryStuVO interviewhistorystu) throws SQLException;
	
	void updateInterviewHistoryStu(Map<String, String> param) throws SQLException;
	
	void deleteInterviewHistoryStu(String interview_history_stu_no) throws SQLException;

	String selectInterviewHistoryStuNo() throws SQLException;
	
	int selectCntInterviewHistoryStuByNo(Map<String, String> param);
	
	List<InterviewHistoryStuVO> selectInterviewHistoryStuByCno(String class_no) throws SQLException;
	
}
