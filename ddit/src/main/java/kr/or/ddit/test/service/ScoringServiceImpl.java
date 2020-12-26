package kr.or.ddit.test.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.ScoringVO;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.test.dao.ScoringDAO;

public class ScoringServiceImpl implements ScoringService {
	private ScoringDAO scoringDAO;

	public void setScoringDAO(ScoringDAO scoringDAO) {
		this.scoringDAO = scoringDAO;
	}

	@Override
	public List<ScoringVO> getScoringList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ScoringVO getScoringByNo(String scoring_no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registScoring(ScoringVO scoring) throws SQLException {
		String scoring_no = scoringDAO.selectScoringNo();
		scoring.setScoring_no(scoring_no);
		scoringDAO.insertScoring(scoring);		
	}

	@Override
	public void modifyScoring(ScoringVO scoring) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeScoring(ScoringVO scoring) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ScoringVO selectInputResult(ScoringVO scoring) throws SQLException {
		return scoringDAO.selectInputResult(scoring);
		
	}

	@Override
	public void removeScoringByThisNo(String test_history_no) throws SQLException {
		scoringDAO.deleteScoringByThisNo(test_history_no);		
	}

	@Override
	public List<ScoringVO> getScoringByHistoryNo(String test_history_no) throws SQLException {		
		return scoringDAO.selectScoringByHistoryNo(test_history_no);
	}

	@Override
	public void modifyScoringMarkResult(ScoringVO scoring) throws SQLException {
		scoringDAO.updateScoringMarkResult(scoring);		
	}
	
}
