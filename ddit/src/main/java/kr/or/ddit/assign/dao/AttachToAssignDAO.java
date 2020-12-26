package kr.or.ddit.assign.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.AttachToAssignVO;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.request.SearchCriteria;

public interface AttachToAssignDAO {
	
	List<AttachToAssignVO> selectAttachByAssignHistoryNo(String assignment_history_no) throws SQLException;
	
	AttachToAssignVO selectAttachByAttachNo(String attach_no) throws SQLException;;
	
	void insertAttach(AttachToAssignVO attach) throws SQLException;
	
	void deleteAttach(String attach_no) throws SQLException;
	
	void deleteAllAttach(String post_no) throws SQLException;	

}
