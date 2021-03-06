package kr.or.ddit.interviewHistoryPro.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.InterviewHistoryProVO;
import kr.or.ddit.request.SearchCriteria;

public interface InterviewHistoryProDAO {
	List<InterviewHistoryProVO> selectInterviewHistoryProList(SearchCriteria cri) throws SQLException;
	
	InterviewHistoryProVO selectInterviewHistoryProByNo(String interview_history_pro_no) throws SQLException;;
	
	void insertInterviewHistoryPro(InterviewHistoryProVO interviewhistorypro) throws SQLException;
	
	void updateInterviewHistoryPro(InterviewHistoryProVO interviewhistorypro) throws SQLException;
	
	void deleteInterviewHistoryPro(InterviewHistoryProVO interviewhistorypro) throws SQLException;
	
	String selectInterviewHistoryProNo()throws SQLException;
}
