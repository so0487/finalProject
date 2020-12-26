package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.request.SearchCriteria;

public interface AttachDAO {
	List<AttachVO> selectAttachByPostNo(String post_no) throws SQLException;
	
	AttachVO selectAttachByAttachNo(String attach_no) throws SQLException;;
	
	void insertAttach(AttachVO attach) throws SQLException;
	
	void deleteAttach(String attach_no) throws SQLException;
	
	void deleteAllAttach(String post_no) throws SQLException;

	String selectBoardNo() throws SQLException;
	
	String selectPostNo() throws SQLException;
}
