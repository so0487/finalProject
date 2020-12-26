package kr.or.ddit.message.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.AttachToMessageVO;

public class AttachToMessageDAOImpl implements AttachToMessageDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<AttachToMessageVO> selectAttachByMessageNo(String message_no) throws SQLException {
		List<AttachToMessageVO> attachList = sqlSession.selectList("AttachToMessage-Mapper.selectAttachByMessageNo",message_no);
		return attachList;
	}

	@Override
	public AttachToMessageVO selectAttachByAttachNo(String attach_no) throws SQLException {
		AttachToMessageVO attach = sqlSession.selectOne("AttachToMessage-Mapper.selectAttachByAttachNo",attach_no);
		return attach;
	}

	@Override
	public void insertAttach(AttachToMessageVO attach) throws SQLException {
		sqlSession.update("AttachToMessage-Mapper.insertAttach",attach);
	}

	@Override
	public void deleteAttach(String attach_no) throws SQLException {
		sqlSession.update("AttachToMessage-Mapper.deleteAttach",attach_no);
	}

	@Override
	public void deleteAllAttach(String message_no) throws SQLException {
		sqlSession.update("AttachToMessage-Mapper.deleteAllAttach", message_no);
	}
}
