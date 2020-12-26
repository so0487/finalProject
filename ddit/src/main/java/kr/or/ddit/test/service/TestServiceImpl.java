package kr.or.ddit.test.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.TestVO;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.test.dao.TestDAO;

public class TestServiceImpl implements TestService {
	private TestDAO testDAO;

	public void setTestDAO(TestDAO testDAO) {
		this.testDAO = testDAO;
	}

	@Override
	public List<TestVO> getTestList(SearchCriteria cri) throws SQLException {		
		return testDAO.selectTestList(cri);
	}

	@Override
	public TestVO getTestByNo(String test_no) throws SQLException {		
		return testDAO.selectTestByNo(test_no);
	}

	@Override
	public void registTest(TestVO test) throws SQLException {
		String test_no = testDAO.selectTestNo();
		test.setTest_no(test_no);
		testDAO.insertTest(test);
		
	}

	@Override
	public void modifyTest(TestVO test) throws SQLException {
		testDAO.updateTest(test);		
	}

	@Override
	public void removeTest(String test_no) throws SQLException {
		testDAO.deleteTest(test_no);		
	}

	@Override
	public List<TestVO> getTestListByLectureNo(String lecture_no) throws SQLException {
		
		return testDAO.selectTestListByLectureNo(lecture_no);
	}
	
	@Override
	public List<TestVO> getTestStuListByLectureNo(String lecture_no) throws SQLException {
		return testDAO.selectTestListByLectureNo(lecture_no);
	}

	@Override
	public List<Map<String, Object>> getTestSubmitList(Map<String, String> dataMap) throws SQLException {
		return testDAO.selectTestSubmitList(dataMap);
		
	}

	
}