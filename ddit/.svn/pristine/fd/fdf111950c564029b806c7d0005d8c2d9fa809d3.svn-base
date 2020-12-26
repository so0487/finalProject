package kr.or.ddit.assign.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.AssignmentVO;
import kr.or.ddit.dto.PostVO;
import kr.or.ddit.request.SearchCriteria;

public class AssignmentDAOImpl implements AssignmentDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<AssignmentVO> selectAssignmentList(SearchCriteria cri, String lecture_no) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap = new HashMap<>();

		dataMap.put("page", cri.getPage());
		dataMap.put("perPageNum", cri.getPerPageNum());
		dataMap.put("searchType", cri.getSearchType());
		dataMap.put("keyword", cri.getKeyword());
		dataMap.put("lecture_no", lecture_no);
		
		
		List<AssignmentVO> assignList = sqlSession.selectList("Assignment-Mapper.selectSearchAssignList", dataMap, rowBounds);

		return assignList;
	}
	
	

	@Override
	public AssignmentVO selectAssignmentByNo(String assignment_no) throws SQLException {
		return sqlSession.selectOne("Assignment-Mapper.selectAssignmentByNo", assignment_no);
	}

	@Override
	public void insertAssignment(AssignmentVO assignment) throws SQLException {
		sqlSession.update("Assignment-Mapper.insetAssignment", assignment);		
	}

	@Override
	public void updateAssignment(AssignmentVO assignment) throws SQLException {
		sqlSession.update("Assignment-Mapper.updateAssignment", assignment);
	}

	@Override
	public void deleteAssignment(String assignment_no) throws SQLException {
		sqlSession.update("Assignment-Mapper.deleteAssignment", assignment_no);		
	}

	@Override
	public int selectAssignCriteriaTotalCount(Map<String, Object> dateMap) throws SQLException {
		int count = sqlSession.selectOne("Assignment-Mapper.selectSearchAssignListCount", dateMap);
		return count;
	}

	@Override
	public String selectAssignmentNo() throws SQLException {
		return sqlSession.selectOne("Assignment-Mapper.selectAssignmentNo");		
	}

	@Override
	public int selectAssignmentScore(Map<String, String> param) throws SQLException {
		return sqlSession.selectOne("Assignment-Mapper.selectAssignmentScore",param);
	}
	
	

}



