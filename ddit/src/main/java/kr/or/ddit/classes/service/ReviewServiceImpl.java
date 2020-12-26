package kr.or.ddit.classes.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.classes.dao.ReviewDAO;
import kr.or.ddit.dto.ClassVO;
import kr.or.ddit.dto.ReviewVO;
import kr.or.ddit.request.PageMaker;
import kr.or.ddit.request.SearchCriteria;

public class ReviewServiceImpl implements ReviewService {
	private ReviewDAO reviewDAO;

	public void setReviewDAO(ReviewDAO reviewDAO) {
		this.reviewDAO = reviewDAO;
	}

	@Override
	public Map<String, Object> getReviewList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ReviewVO> reviewList = reviewDAO.selectReviewList(cri);
		
		int totalCount=reviewDAO.selectSearchReviewListCount2(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("reviewList", reviewList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;		
		
	}

	@Override
	public ReviewVO getReviewByNo(String review_no) throws SQLException {
		ReviewVO review = reviewDAO.selectReviewByNo(review_no);
		return review;
	}

	@Override
	public void registReview(ReviewVO review) throws SQLException {
		reviewDAO.insertReview(review);
		
	}

	@Override
	public void modifyReview(ReviewVO review) throws SQLException {
		reviewDAO.updateReview(review);
		
	}

	@Override
	public void removeReview(String review_no) throws SQLException {
		reviewDAO.deleteReview(review_no);
		
	}

	@Override
	public String getReviewNo() throws SQLException {
		String review_no =reviewDAO.selectReviewNo();
		return review_no;
	}

	@Override
	public Map<String,Object> getReviewListByCurriculum_no(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		int totalCount=reviewDAO.selectSearchReviewListCount(cri);
		List<ReviewVO> reviewList = reviewDAO.selectReviewListByCurriculum_no(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("reviewList", reviewList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public int getReviewExist(Map<String, String> dataMap) throws SQLException {
		int cnt = 0;
		cnt = reviewDAO.selectReviewExist(dataMap);
		return cnt;
	}

	
}
