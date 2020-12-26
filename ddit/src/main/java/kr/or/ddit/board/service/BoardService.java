package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.BoardVO;
import kr.or.ddit.request.SearchCriteria;

public interface BoardService {
	List<BoardVO> getBoardCriteria(SearchCriteria cri) throws SQLException;

	int getBoardCriteriaTotalCount(SearchCriteria cri) throws SQLException;

	BoardVO getBoardByBno(int bno) throws SQLException;

	void registBoard(BoardVO board) throws SQLException;

	void modifyBoard(BoardVO board) throws SQLException;

	void removeBoard(int bno) throws SQLException;

	// viewcnt 증가
	void increaseViewCnt(int bno) throws SQLException;

	// board_seq.nextval 가져오기
	int getBoardSeqNext() throws SQLException;
}
