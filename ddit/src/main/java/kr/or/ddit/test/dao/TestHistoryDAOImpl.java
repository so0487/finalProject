package kr.or.ddit.test.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.TestHistoryVO;
import kr.or.ddit.request.SearchCriteria;

public class TestHistoryDAOImpl implements TestHistoryDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<TestHistoryVO> selectTestHistoryList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TestHistoryVO selectTestHistoryByNo(String test_history_no) throws SQLException {		
		return sqlSession.selectOne("TestHistory-Mapper.selectTestHistoryByNo", test_history_no);
	}

	@Override
	public void insertTestHistory(TestHistoryVO testhistory) throws SQLException {
		sqlSession.update("TestHistory-Mapper.insertTestHistoryVO", testhistory);		
	}

	@Override
	public void updateTestHistory(TestHistoryVO testhistory) throws SQLException {
		sqlSession.update("TestHistory-Mapper.updateTestHistoryVO", testhistory);
		
	}

	@Override
	public void deleteTestHistory(TestHistoryVO testhistory) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	@Override
    public String selectTestHistoryNo() throws SQLException {
	    String test_history_no=sqlSession.selectOne("TestHistory-Mapper.selectTestHistoryNo");
	    return test_history_no;
    }

	@Override
	public TestHistoryVO selectMemberTestHistory(TestHistoryVO testhistory) throws SQLException {
		return sqlSession.selectOne("TestHistory-Mapper.selectMemberTestHistory", testhistory);
	}

	@Override
	public List<Map<String, String>> selectTestHistoryByTestNo(String test_no) throws SQLException {		
		return sqlSession.selectList("TestHistory-Mapper.selectTestHistoryByTestNo", test_no);
	}

	@Override
	public void updateTestScore(String test_history_no) throws SQLException {
		sqlSession.update("TestHistory-Mapper.selectTestScore", test_history_no);		
	}

	@Override
	public int selectTestFinalScoreByLectureNo(Map<String, String> param) throws SQLException {
		return sqlSession.selectOne("TestHistory-Mapper.selectTestFinalScoreByLectureNo", param);
		
	}

	@Override
	public void updateTestSubmit(String test_no) throws SQLException {
		sqlSession.update("TestHistory-Mapper.updateTestSubmit",test_no);
	}
	
	
	
	

}
