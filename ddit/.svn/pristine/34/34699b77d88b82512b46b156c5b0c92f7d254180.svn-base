package kr.or.ddit.boardReply.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.board.dao.PostDAO;
import kr.or.ddit.boardReply.dao.ReplyDAO;
import kr.or.ddit.dto.ReplyVO;
import kr.or.ddit.request.PageMaker;
import kr.or.ddit.request.SearchCriteria;

public class ReplyServiceImpl implements ReplyService {
	private ReplyDAO replyDAO;
	
	private PostDAO postDAO;
	
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	public void setPostDAO(PostDAO postDAO) {
		this.postDAO = postDAO;
	}

	@Override
	public Map<String, Object> getReplyList(String post_no, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ReplyVO> replyList = replyDAO.selectReplyListPage(post_no, cri);
		
		int count = replyDAO.countReply(post_no);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		
		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public void registReply(ReplyVO reply) throws SQLException {
		String reply_no = replyDAO.selectReplySeqNextValue();
		reply.setReply_no(reply_no);
		
		replyDAO.insertReply(reply);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws SQLException {
		replyDAO.updateReply(reply);
	}
	
	@Override
	public void deleteReply(String reply_no) throws SQLException {
		replyDAO.deleteReply(reply_no);
	}

}
