package kr.or.ddit.interviewHistoryPro.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.InterviewHistoryProVO;
import kr.or.ddit.request.SearchCriteria;

public interface InterviewHistoryProService {
	List<InterviewHistoryProVO> getInterviewHistoryProList(SearchCriteria cri) throws SQLException;
	
	InterviewHistoryProVO getInterviewHistoryProByNo(String interview_history_pro_no) throws SQLException;;
	
	void registInterviewHistoryPro(InterviewHistoryProVO interviewhistorypro) throws SQLException;
	
	void modifyInterviewHistoryPro(InterviewHistoryProVO interviewhistorypro) throws SQLException;
	
	void removeInterviewHistoryPro(InterviewHistoryProVO interviewhistorypro) throws SQLException;
}
