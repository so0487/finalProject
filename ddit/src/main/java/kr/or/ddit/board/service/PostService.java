package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.PostVO;
import kr.or.ddit.request.SearchCriteria;

public interface PostService {
	Map<String,Object> getPostList(SearchCriteria cri, String board_no) throws SQLException;
	
	//상세보기
	PostVO getPostByNo(String post_no) throws SQLException;
	PostVO getPostForModyfy(String post_no) throws SQLException;
	
	//등록
	void registPost(PostVO post) throws SQLException;
	
	//수정
	void modifyPost(PostVO post) throws SQLException;
	
	//삭제
	void removePost(PostVO post) throws SQLException;
	
	//최대 POST번호 가져오기
	String getMaxPost_no() throws SQLException;

	//게시판별 등록번호 설정
	void noticeRegistPost(PostVO post) throws SQLException;
	
	void qnaRegistPost(PostVO post) throws SQLException;
	
	void freeRegistPost(PostVO post) throws SQLException;

	void impRegistPost(PostVO post) throws SQLException;
	
	void pdsRegistPost(PostVO post) throws SQLException;
	
	void faqRegistPost(PostVO post) throws SQLException;
	
	void declarePost(PostVO post) throws SQLException;
	
	List<PostVO> getBoardRownum() throws SQLException;
}
