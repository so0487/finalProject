package kr.or.ddit.test.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.ScoringVO;
import kr.or.ddit.request.SearchCriteria;

public interface ScoringDAO {
	List<ScoringVO> selectScoringList(SearchCriteria cri) throws SQLException;
	
	List<ScoringVO> selectScoringByHistoryNo(String test_history_no) throws SQLException;	
	
	ScoringVO selectInputResult(ScoringVO scoring) throws SQLException;
	
	ScoringVO selectScoringByNo(String scoring_no) throws SQLException;
	
	void insertScoring(ScoringVO scoring) throws SQLException;
	
	void updateScoring(ScoringVO scoring) throws SQLException;
	
	void deleteScoring(ScoringVO scoring) throws SQLException;
	
	String selectScoringNo() throws SQLException;
	
	void deleteScoringByThisNo(String test_history_no) throws SQLException;
	
	void updateScoringMarkResult(ScoringVO scoring) throws SQLException;
}
