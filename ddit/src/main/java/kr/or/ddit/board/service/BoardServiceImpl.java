package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.dao.BoardDAO;
import kr.or.ddit.dto.BoardVO;
import kr.or.ddit.request.SearchCriteria;

public class BoardServiceImpl implements BoardService {
	private BoardDAO boardDAO;
	public void setBoardDAO(BoardDAO boardDAO) {
		this.boardDAO=boardDAO;
	}
	@Override
	public List<BoardVO> getBoardCriteria(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int getBoardCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public BoardVO getBoardByBno(int bno) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void registBoard(BoardVO board) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void modifyBoard(BoardVO board) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void removeBoard(int bno) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void increaseViewCnt(int bno) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public int getBoardSeqNext() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	   
}
