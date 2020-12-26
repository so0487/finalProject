package kr.or.ddit.test.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.TestHistoryVO;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.test.dao.TestHistoryDAO;

public class TestHistoryServiceImpl implements TestHistoryService {
	private TestHistoryDAO testHistoryDAO;

	public void setTestHistoryDAO(TestHistoryDAO testHistoryDAO) {
		this.testHistoryDAO = testHistoryDAO;
	}

	@Override
	public List<TestHistoryVO> getTestHistoryList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TestHistoryVO getTestHistoryByNo(String test_history_no) throws SQLException {
		return testHistoryDAO.selectTestHistoryByNo(test_history_no);		
	}

	@Override
	public void registTestHistory(TestHistoryVO testhistory) throws SQLException {
		
		if(testHistoryDAO.selectMemberTestHistory(testhistory)==null) {
			String test_history_no = testHistoryDAO.selectTestHistoryNo();		
			testhistory.setTest_history_no(test_history_no);
			System.out.println(testhistory+"@@@@@@@@@@@@@@@@@@");
			testHistoryDAO.insertTestHistory(testhistory);
		}
				
	}

	@Override
	public void modifyTestHistory(TestHistoryVO testhistory) throws SQLException {
		testHistoryDAO.updateTestHistory(testhistory);		
	}

	@Override
	public void removeTestHistory(TestHistoryVO testhistory) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public TestHistoryVO getMemberTestHistory(TestHistoryVO testhistory) throws SQLException {
		
		return testHistoryDAO.selectMemberTestHistory(testhistory);
	}

	@Override
	public List<Map<String, String>> getTestHistoryByTestNo(String test_no) throws SQLException {		
		return testHistoryDAO.selectTestHistoryByTestNo(test_no);
	}

	@Override
	public void modifyTestScore(String test_history_no) throws SQLException {
		testHistoryDAO.updateTestScore(test_history_no);		
	}

	@Override
	public int getTestFinalScoreByLectureNo(Map<String, String>params) throws SQLException {
		return testHistoryDAO.selectTestFinalScoreByLectureNo(params);		
	}

	@Override
	public void modifyTestSubmit(String test_no) throws SQLException {
		testHistoryDAO.updateTestSubmit(test_no);		
	}


	
}