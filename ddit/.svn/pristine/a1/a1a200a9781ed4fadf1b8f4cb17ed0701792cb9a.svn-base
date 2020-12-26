package kr.or.ddit.test.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.ScoringVO;
import kr.or.ddit.request.SearchCriteria;

public class ScoringDAOImpl implements ScoringDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<ScoringVO> selectScoringList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ScoringVO selectScoringByNo(String scoring_no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertScoring(ScoringVO scoring) throws SQLException {
		sqlSession.update("Scoring-Mapper.insertScoringVO", scoring);		
	}

	@Override
	public void updateScoring(ScoringVO scoring) throws SQLException {
		
		
	}

	@Override
	public void deleteScoring(ScoringVO scoring) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	@Override
    public String selectScoringNo() throws SQLException {
	    String scoring_no=sqlSession.selectOne("Scoring-Mapper.selectScoringNo");
	    return scoring_no;
    }

	@Override
	public ScoringVO selectInputResult(ScoringVO scoring) throws SQLException {		
		return sqlSession.selectOne("Scoring-Mapper.selectInputResult", scoring);
	}

	@Override
	public void deleteScoringByThisNo(String test_history_no) throws SQLException {
		sqlSession.update("Scoring-Mapper.deleteScoringByThisNo", test_history_no);
		
	}

	@Override
	public List<ScoringVO> selectScoringByHistoryNo(String test_history_no) throws SQLException {		
		return sqlSession.selectList("Scoring-Mapper.selectScoringByHistoryNo", test_history_no); 
	}

	@Override
	public void updateScoringMarkResult(ScoringVO scoring) throws SQLException {
		sqlSession.update("Scoring-Mapper.updateScoringMarkResult", scoring);		
	}

}
