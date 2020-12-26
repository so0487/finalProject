package kr.or.ddit.test.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.TestVO;
import kr.or.ddit.request.SearchCriteria;

public interface TestDAO {
	List<TestVO> selectTestList(SearchCriteria cri) throws SQLException;
	
	List<TestVO> selectTestListByLectureNo(String lecture_no) throws SQLException;

	List<TestVO> selectTestStuListByLectureNo(String lecture_no) throws SQLException;

	List<Map<String,Object>> selectTestSubmitList(Map<String, String> dataMap) throws SQLException;
	
	TestVO selectTestByNo(String test_no) throws SQLException;;
	
	void insertTest(TestVO test) throws SQLException;
	
	void updateTest(TestVO test) throws SQLException;
	
	void deleteTest(String test_no) throws SQLException;
	
	String selectTestNo() throws SQLException;
}
