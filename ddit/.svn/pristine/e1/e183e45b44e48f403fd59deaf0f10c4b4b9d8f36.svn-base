package kr.or.ddit.assign.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.AssignmentHistoryVO;
import kr.or.ddit.dto.AssignmentVO;
import kr.or.ddit.request.SearchCriteria;

public class AssignmentHistoryDAOImpl implements AssignmentHistoryDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<Map<String, Object>> selectAssignmentHistoryList(SearchCriteria cri, String loginID, String lecture_no) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap2 = new HashMap<>();

		dataMap2.put("page", cri.getPage());
		dataMap2.put("perPageNum", cri.getPerPageNum());
		dataMap2.put("searchType", cri.getSearchType());
		dataMap2.put("keyword", cri.getKeyword());
		dataMap2.put("student_id", loginID);
		dataMap2.put("lecture_no", lecture_no);
		
		List<Map<String, Object>> assignHistoryList = sqlSession.selectList("AssignmentHistory-Mapper.selectSearchAssignHistoryList", dataMap2, rowBounds); 
			 
		return assignHistoryList;
	}
	
	@Override
	public List<Map<String, Object>> selectAssignSubmitList(SearchCriteria cri, String assignment_no) {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap2 = new HashMap<>();

		dataMap2.put("page", cri.getPage());
		dataMap2.put("perPageNum", cri.getPerPageNum());
		dataMap2.put("searchType", cri.getSearchType());
		dataMap2.put("keyword", cri.getKeyword());
		dataMap2.put("assignment_no", assignment_no);
		
		List<Map<String, Object>> assignSubmitList = sqlSession.selectList("AssignmentHistory-Mapper.selectAssignSubmitList", dataMap2, rowBounds); 
			 
		return assignSubmitList;
	}

	@Override
	public AssignmentHistoryVO selectAssignmentHistoryByNo(String assignment_history_no) throws SQLException {
		return sqlSession.selectOne("AssignmentHistory-Mapper.selectAssignmentHsitoryByNo", assignment_history_no);	
	}

	@Override
	public void insertAssignmentHistory(AssignmentHistoryVO assignmentHistory) throws SQLException {
		sqlSession.update("AssignmentHistory-Mapper.insetAssignmentHistory",assignmentHistory);
		
	}

	@Override
	public void updateAssignmentHistory(AssignmentHistoryVO assignmentHistory) throws SQLException {
		sqlSession.update("AssignmentHistory-Mapper.updateAssignmentHistory", assignmentHistory);
		
	}

	@Override
	public void updateScoreAssignmentHistory(AssignmentHistoryVO assignmentHistory) throws SQLException {
		sqlSession.update("AssignmentHistory-Mapper.updateScoreAssignmentHistory", assignmentHistory);
		
	}

	@Override
	public void deleteAssignmentHistory(AssignmentHistoryVO assignmentHistory) throws SQLException {
		sqlSession.update("AssignmentHistory-Mapper.deleteAssignmentHistory", assignmentHistory);
		
	}
	
	@Override
	public int selectAssignHistoryCriteriaTotalCount(Map<String, Object> dataMap) throws SQLException {
		int count = sqlSession.selectOne("AssignmentHistory-Mapper.selectSearchAssignHistoryListCount", dataMap);
		return count;
	}
	
	@Override
	public int selectAssignSubmitCriteriaTotalCount(Map<String, Object> dataMap) throws SQLException {
		int count = sqlSession.selectOne("AssignmentHistory-Mapper.selectSearchAssignSubmitListCount", dataMap);
		return count;
	}

	@Override
	public String selectAssignmentHistoryNo() throws SQLException {		
		return sqlSession.selectOne("AssignmentHistory-Mapper.selectAssignmentHistoryNo");
	}

	@Override
	public AssignmentHistoryVO selectAssignmentHistoryCheck(AssignmentHistoryVO assignmentHistory) throws SQLException {
		return sqlSession.selectOne("AssignmentHistory-Mapper.selectAssignmentHistoryCheck", assignmentHistory);
	}





}
