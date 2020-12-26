package kr.or.ddit.test.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


import kr.or.ddit.dto.TestHistoryVO;
import kr.or.ddit.request.SearchCriteria;

public interface TestHistoryDAO {
	List<TestHistoryVO> selectTestHistoryList(SearchCriteria cri) throws SQLException;
	
	List<Map<String, String>> selectTestHistoryByTestNo(String test_no) throws SQLException;
	
	TestHistoryVO selectTestHistoryByNo(String test_history_no) throws SQLException;;
	
	void insertTestHistory(TestHistoryVO testhistory) throws SQLException;
	
	void updateTestHistory(TestHistoryVO testhistory) throws SQLException;
	
	void deleteTestHistory(TestHistoryVO testhistory) throws SQLException;
	
	String selectTestHistoryNo() throws SQLException;
	
	TestHistoryVO selectMemberTestHistory(TestHistoryVO testhistory) throws SQLException;
	
	void updateTestScore(String test_history_no) throws SQLException;	
	
	int selectTestFinalScoreByLectureNo(Map<String, String> param) throws SQLException;
	
	void updateTestSubmit(String test_no) throws SQLException;
}
