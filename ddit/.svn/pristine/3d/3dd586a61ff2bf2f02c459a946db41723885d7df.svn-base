package kr.or.ddit.test.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.TestHistoryVO;
import kr.or.ddit.request.SearchCriteria;

public interface TestHistoryService {
	List<TestHistoryVO> getTestHistoryList(SearchCriteria cri) throws SQLException;

	List<Map<String, String>> getTestHistoryByTestNo(String test_no) throws SQLException;
	
	TestHistoryVO getTestHistoryByNo(String test_history_no) throws SQLException;
	
	TestHistoryVO getMemberTestHistory(TestHistoryVO testhistory) throws SQLException;
	
	void registTestHistory(TestHistoryVO testhistory) throws SQLException;
	
	void modifyTestHistory(TestHistoryVO testhistory) throws SQLException;
	
	void removeTestHistory(TestHistoryVO testhistory) throws SQLException;
	
	void modifyTestScore(String test_history_no) throws SQLException;	
	
	int getTestFinalScoreByLectureNo(Map<String, String> params) throws SQLException;
	
	void modifyTestSubmit(String test_no) throws SQLException;
	
}
