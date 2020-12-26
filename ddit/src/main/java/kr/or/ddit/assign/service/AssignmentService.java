package kr.or.ddit.assign.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.AssignmentVO;
import kr.or.ddit.request.SearchCriteria;

public interface AssignmentService {
	
	Map<String, Object> getAssignmentList(SearchCriteria cri, String lecture_no) throws SQLException;
	
	AssignmentVO getAssignmentByNo(String assignment_no) throws SQLException;;
	
	void registAssignment(AssignmentVO assignment) throws SQLException;
	
	void modifyAssignment(AssignmentVO assignment) throws SQLException;
	
	void removeAssignment(String assignment_no) throws SQLException;

	void assignRegist(AssignmentVO assignment) throws SQLException;		
	
	int getAssignmentScore(Map<String, String> param) throws SQLException;
}
