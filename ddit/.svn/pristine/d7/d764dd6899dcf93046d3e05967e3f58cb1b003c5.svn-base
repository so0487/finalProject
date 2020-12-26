package kr.or.ddit.assign.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.AssignmentHistoryVO;
import kr.or.ddit.request.SearchCriteria;

public interface AssignmentHistoryService {
	Map<String, Object> getAssignmentHistoryList(SearchCriteria cri, String lecture_no, String loginID) throws SQLException;
	
	Map<String, Object> getAssignSubmitList(SearchCriteria cri, String assignment_no) throws SQLException;
	
	AssignmentHistoryVO getAssignmentHistoryByNo(String assignment_history_no) throws SQLException;
	
	void registAssignmentHistory(AssignmentHistoryVO assignmentHistory) throws SQLException;
	
	void modifyAssignmentHistory(AssignmentHistoryVO assignmentHistory) throws SQLException;
	
	void modifyScoreAssignmentHistory(AssignmentHistoryVO assignmentHistory) throws SQLException;
	
	void removeAssignmentHistory(AssignmentHistoryVO assignmentHistory) throws SQLException;
	
	AssignmentHistoryVO getAssignmentHistoryCheck(AssignmentHistoryVO assignmentHistory) throws SQLException;
}
