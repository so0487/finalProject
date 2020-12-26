package kr.or.ddit.test.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.ScoringVO;
import kr.or.ddit.request.SearchCriteria;

public interface ScoringService {
	List<ScoringVO> getScoringList(SearchCriteria cri) throws SQLException;
	
	List<ScoringVO> getScoringByHistoryNo(String test_history_no) throws SQLException;	
	
	ScoringVO getScoringByNo(String scoring_no) throws SQLException;;
	
	void registScoring(ScoringVO scoring) throws SQLException;
	
	void modifyScoring(ScoringVO scoring) throws SQLException;
	
	void removeScoring(ScoringVO scoring) throws SQLException;
	
	ScoringVO selectInputResult(ScoringVO scoring) throws SQLException;
	
	void removeScoringByThisNo(String test_history_no) throws SQLException;
	
	void modifyScoringMarkResult(ScoringVO scoring) throws SQLException;
}
