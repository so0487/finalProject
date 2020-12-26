package kr.or.ddit.classes.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.ReviewVO;
import kr.or.ddit.request.SearchCriteria;

public interface ReviewDAO {
	List<ReviewVO> selectReviewList(SearchCriteria cri) throws SQLException;
	
	int selectSearchReviewListCount(SearchCriteria cri) throws SQLException; 
	
	int selectSearchReviewListCount2(SearchCriteria cri) throws SQLException; 
	
	ReviewVO selectReviewByNo(String review_no) throws SQLException;;
	
	void insertReview(ReviewVO review) throws SQLException;
	
	void updateReview(ReviewVO review) throws SQLException;
	
	void deleteReview(String review_no) throws SQLException;
	
	String selectReviewNo() throws SQLException;
	
	int selectReviewExist(Map<String, String> dataMap) throws SQLException;
	
	List<ReviewVO> selectReviewListByCurriculum_no(SearchCriteria cri) throws SQLException;
}