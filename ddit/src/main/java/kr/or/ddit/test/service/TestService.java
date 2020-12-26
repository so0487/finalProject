package kr.or.ddit.test.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.TestVO;
import kr.or.ddit.request.SearchCriteria;

public interface TestService {
	List<TestVO> getTestList(SearchCriteria cri) throws SQLException;
	
	List<TestVO> getTestListByLectureNo(String lecture_no) throws SQLException;

	List<TestVO> getTestStuListByLectureNo(String lecture_no) throws SQLException;
	
	List<Map<String, Object>> getTestSubmitList(Map<String, String> dataMap) throws SQLException;
	
	TestVO getTestByNo(String test_no) throws SQLException;;
	
	void registTest(TestVO test) throws SQLException;
	
	void modifyTest(TestVO test) throws SQLException;
	
	void removeTest(String test_no) throws SQLException;
	
	
}
