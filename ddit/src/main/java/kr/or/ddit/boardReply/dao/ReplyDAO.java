package kr.or.ddit.boardReply.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.ReplyVO;
import kr.or.ddit.request.SearchCriteria;

public interface ReplyDAO {
	void insertReply(ReplyVO reply) throws SQLException;

	void updateReply(ReplyVO reply) throws SQLException;

	void deleteReply(String reply_no) throws SQLException;

	String selectReplySeqNextValue() throws SQLException;

	List<ReplyVO> selectReplyListPage(String post_no, SearchCriteria cri) throws SQLException;

	int countReply(String reply_no) throws SQLException;
	
	String getPostNo(String reply_no) throws SQLException;
}
