package kr.or.ddit.interview.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.InterviewVO;
import kr.or.ddit.request.SearchCriteria;

public interface InterviewDAO {
	List<InterviewVO> selectInterviewList(String class_no) throws SQLException;
	
	InterviewVO selectInterviewByNo(String interview_no) throws SQLException;;
	
	void insertInterview(InterviewVO interview) throws SQLException;
	
	void updateInterview(InterviewVO interview) throws SQLException;
	
	void deleteInterview(InterviewVO interview) throws SQLException;

	String selectInterviewNo() throws SQLException;
	
	void increaseApplyCnt(String interview_no)throws SQLException;
	
	List<InterviewVO> selectSearchInterviewList(SearchCriteria cri) throws SQLException;
	
	int selectSearchInterviewListCount(SearchCriteria cri) throws SQLException;
}

