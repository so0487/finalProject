package kr.or.ddit.assign.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.AssignmentVO;
import kr.or.ddit.request.SearchCriteria;

public interface AssignmentDAO {
	
	List<AssignmentVO> selectAssignmentList(SearchCriteria cri, String lecture_no) throws SQLException;
	
	AssignmentVO selectAssignmentByNo(String assignment_no) throws SQLException;;
	
	void insertAssignment(AssignmentVO assignment) throws SQLException;
	
	void updateAssignment(AssignmentVO assignment) throws SQLException;
	
	void deleteAssignment(String assignment_no) throws SQLException;	
	
	int selectAssignCriteriaTotalCount(Map<String, Object> dateMap) throws SQLException;
	
	String selectAssignmentNo() throws SQLException;
	
	int selectAssignmentScore(Map<String, String>param)throws SQLException;
}
