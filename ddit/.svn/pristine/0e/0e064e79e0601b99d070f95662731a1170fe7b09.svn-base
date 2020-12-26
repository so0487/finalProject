package kr.or.ddit.classes.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.ReviewVO;
import kr.or.ddit.request.SearchCriteria;

public interface ReviewService {
	Map<String, Object> getReviewList(SearchCriteria cri) throws SQLException;
	
	ReviewVO getReviewByNo(String review_no) throws SQLException;
	
	void registReview(ReviewVO review) throws SQLException;
	
	void modifyReview(ReviewVO review) throws SQLException;
	
	void removeReview(String review_no) throws SQLException;
	
	String getReviewNo() throws SQLException;
	
	Map<String,Object> getReviewListByCurriculum_no(SearchCriteria cri) throws SQLException;
	
	int getReviewExist(Map<String, String> dataMap) throws SQLException;
}	
