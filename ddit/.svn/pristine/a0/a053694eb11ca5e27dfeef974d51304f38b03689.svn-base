package kr.or.ddit.assign.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.AssignmentHistoryVO;
import kr.or.ddit.request.SearchCriteria;

public interface AssignmentHistoryDAO {
	List<Map<String, Object>> selectAssignmentHistoryList(SearchCriteria cri, String loginID, String lecture_no) throws SQLException;
	
	List<Map<String, Object>> selectAssignSubmitList(SearchCriteria cri, String assignment_no);
	
	int selectAssignSubmitCriteriaTotalCount(Map<String, Object> dataMap) throws SQLException;
	
	AssignmentHistoryVO selectAssignmentHistoryByNo(String assignment_history_no) throws SQLException;
	
	void insertAssignmentHistory(AssignmentHistoryVO assignmentHistory) throws SQLException;
	
	void updateAssignmentHistory(AssignmentHistoryVO assignmentHistory) throws SQLException;

	void updateScoreAssignmentHistory(AssignmentHistoryVO assignmentHistory) throws SQLException;
	
	void deleteAssignmentHistory(AssignmentHistoryVO AssignmentHistoryVO) throws SQLException;
	
	String selectAssignmentHistoryNo() throws SQLException;
	
	int selectAssignHistoryCriteriaTotalCount(Map<String, Object> dataMap) throws SQLException;
	
	AssignmentHistoryVO selectAssignmentHistoryCheck(AssignmentHistoryVO assignmentHistory) throws SQLException;
	
	
}
