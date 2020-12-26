package kr.or.ddit.interviewHistoryStu.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.InterviewHistoryStuVO;
import kr.or.ddit.request.SearchCriteria;

public interface InterviewHistoryStuService {
	List<InterviewHistoryStuVO> getInterviewHistoryStuList(String interview_no) throws SQLException;
	
	InterviewHistoryStuVO getInterviewHistoryStuByNo(String interview_history_stu_no) throws SQLException;

	List<InterviewHistoryStuVO> getInterviewHistoryStuByStu(String student_id) throws SQLException;
	
	void registInterviewHistoryStu(InterviewHistoryStuVO interviewhistorystu) throws SQLException;
	
	void modifyInterviewHistoryStu(Map<String, String> param) throws SQLException;
	
	void removeInterviewHistoryStu(String interview_history_stu_no) throws SQLException;
	
	 List<InterviewHistoryStuVO> getInterviewHistoryStuByCno(String class_no) throws SQLException;
	
}
