package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.BoardVO;
import kr.or.ddit.request.SearchCriteria;

public class BoardDAOImpl implements BoardDAO {	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<BoardVO> selectBoardCriteria(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectBoardCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardVO selectBoardByBno(int bno) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertBoard(BoardVO board) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBoard(BoardVO board) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(int bno) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void increaseViewCnt(int bno) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int selectBoardSeqNext() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
