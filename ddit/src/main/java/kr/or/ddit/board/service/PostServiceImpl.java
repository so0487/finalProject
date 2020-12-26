package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.board.dao.AttachDAO;
import kr.or.ddit.board.dao.PostDAO;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.PostVO;
import kr.or.ddit.request.PageMaker;
import kr.or.ddit.request.SearchCriteria;

public class PostServiceImpl implements PostService {
	private PostDAO postDAO;
	private AttachDAO attachDAO;

	public void setPostDAO(PostDAO postDAO) {
		this.postDAO = postDAO;
	}

	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	@Override
	public Map<String, Object> getPostList(SearchCriteria cri, String board_no) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<PostVO> postList = postDAO.selectPostList(cri, board_no);

		int totalCount = postDAO.selectPostCriteriaTotalCount(cri);

		// pageMaker생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("postList", postList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public PostVO getPostByNo(String post_no) throws SQLException {
		PostVO post = postDAO.selectPostByNo(post_no);
		List<AttachVO> attachList = attachDAO.selectAttachByPostNo(post_no);
		post.setAttachList(attachList);
		postDAO.increaseViewCnt(post_no);
		return post;
	}

	@Override
	public void registPost(PostVO post) throws SQLException {
		String post_no = postDAO.selectPostSequenceNextValue();
		post.setPost_no(post_no);
		postDAO.insertPost(post);

	}

	@Override
	public void noticeRegistPost(PostVO post) throws SQLException {
		String post_no = postDAO.selectNoticeSeqNextValue();
		post.setPost_no(post_no);
		postDAO.insertPost(post);
	}

	@Override
	public void modifyPost(PostVO post) throws SQLException {
		
		if(post.getAttachList() == null) {
			
			postDAO.updatePost(post);
		} else {
			// attachDAO.deleteAllAttach(post.getPost_no());
			for (AttachVO attach : post.getAttachList()) {
				attach.setPost_no(post.getPost_no());
				attachDAO.insertAttach(attach);
			}
			postDAO.updatePost(post);
			
		}
		
		
	}

	@Override
	public void removePost(PostVO post) throws SQLException {
		postDAO.deletePost(post);
		attachDAO.deleteAllAttach(post.getPost_no());

	}

	@Override
	public PostVO getPostForModyfy(String post_no) throws SQLException {
		PostVO post = postDAO.selectPostByNo(post_no);
		return post;
	}

	@Override
	public String getMaxPost_no() throws SQLException {
		return postDAO.getMaxPost_no();
	}

	@Override
	public void qnaRegistPost(PostVO post) throws SQLException {
		String post_no = postDAO.selectQnASeqNextValue();
		post.setPost_no(post_no);
		postDAO.insertPost(post);
	}

	@Override
	public void freeRegistPost(PostVO post) throws SQLException {
		String post_no = postDAO.selectFreeSeqNextValue();
		post.setPost_no(post_no);
		postDAO.insertPost(post);

	}

	@Override
	public void impRegistPost(PostVO post) throws SQLException {
		String post_no = postDAO.selectImpSeqNextValue();
		post.setPost_no(post_no);
		postDAO.insertPost(post);

		if (post.getAttachList() != null) {
			for (AttachVO attach : post.getAttachList()) {
				attach.setPost_no(post_no);
				attachDAO.insertAttach(attach);
			}
		}

	}

	@Override
	public void pdsRegistPost(PostVO post) throws SQLException {
		String post_no = postDAO.selectPdsSeqNextValue();
		post.setPost_no(post_no);
		postDAO.insertPost(post);

		if (post.getAttachList() != null) {
			for (AttachVO attach : post.getAttachList()) {
				attach.setPost_no(post_no);
				attachDAO.insertAttach(attach);
			}
		}

	}

	@Override
	public void faqRegistPost(PostVO post) throws SQLException {
		String post_no = postDAO.selectFAQSeqNextValue();
		post.setPost_no(post_no);
		postDAO.insertPost(post);
		
	}

	@Override
	public List<PostVO> getBoardRownum() throws SQLException {
		return postDAO.selectBoardRownum();
	}

	@Override
	public void declarePost(PostVO post) throws SQLException {
		String post_no = postDAO.selectDeclareSeqNextValue();
		post.setPost_no(post_no);
		postDAO.insertPost(post);

		if (post.getAttachList() != null) {
			for (AttachVO attach : post.getAttachList()) {
				attach.setPost_no(post_no);
				attachDAO.insertAttach(attach);
			}
		}

	}

}
