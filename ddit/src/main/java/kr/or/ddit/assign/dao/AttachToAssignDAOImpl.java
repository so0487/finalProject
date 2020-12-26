package kr.or.ddit.assign.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.AttachToAssignVO;

public class AttachToAssignDAOImpl implements AttachToAssignDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<AttachToAssignVO> selectAttachByAssignHistoryNo(String assignment_history_no) throws SQLException {
		List<AttachToAssignVO> attachList = sqlSession.selectList("AttachToAssign-Mapper.selectAttachByAssignHistoryNo", assignment_history_no);
		return attachList;
	}

	@Override
	public AttachToAssignVO selectAttachByAttachNo(String attach_no) throws SQLException {
		AttachToAssignVO attach = sqlSession.selectOne("AttachToAssign-Mapper.selectAttachByAttachNo", attach_no);
		return attach;
	}

	@Override
	public void insertAttach(AttachToAssignVO attach) throws SQLException {
		sqlSession.update("AttachToAssign-Mapper.insertAttach", attach);
	}

	@Override
	public void deleteAttach(String attach_no) throws SQLException {
		sqlSession.update("AttachToAssign-Mapper.deleteAttach", attach_no);
	}

	@Override
	public void deleteAllAttach(String post_no) throws SQLException {
		sqlSession.update("AttachToAssign-Mapper.deleteAllAttach", post_no);
	}
	

	

}
