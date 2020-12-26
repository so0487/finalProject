package kr.or.ddit.boardReply.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.ReplyVO;
import kr.or.ddit.request.SearchCriteria;

public interface ReplyService {
	Map<String, Object> getReplyList(String post_no, SearchCriteria cri) throws SQLException;

	void registReply(ReplyVO reply) throws SQLException;

	void modifyReply(ReplyVO reply) throws SQLException;

	void deleteReply(String reply_no) throws SQLException;
}
