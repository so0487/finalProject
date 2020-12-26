package kr.or.ddit.boardReply.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.ReplyVO;
import kr.or.ddit.request.SearchCriteria;

public class ReplyDAOImpl implements ReplyDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertReply(ReplyVO reply) throws SQLException {
		sqlSession.update("Reply-Mapper.insertReply", reply);
	}

	@Override
	public void updateReply(ReplyVO reply) throws SQLException {
		sqlSession.update("Reply-Mapper.updateReply", reply);
	}

	@Override
	public void deleteReply(String reply_no) throws SQLException {
		sqlSession.update("Reply-Mapper.deleteReply", reply_no);
	}

	@Override
	public String selectReplySeqNextValue() throws SQLException {
		String reply_no = sqlSession.selectOne("Reply-Mapper.selectReplySeqNextValue");
		return reply_no;
	}

	@Override
	public List<ReplyVO> selectReplyListPage(String post_no, SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();

		RowBounds rowBounds = new RowBounds(offset, limit);

		List<ReplyVO> replyList = sqlSession.selectList("Reply-Mapper.selectReplyList", post_no, rowBounds);

		return replyList;
	}

	@Override
	public int countReply(String reply_no) throws SQLException {
		int count = (Integer) sqlSession.selectOne("Reply-Mapper.countReply", reply_no);
		return count;
	}

	@Override
	public String getPostNo(String reply_no) throws SQLException {
		return sqlSession.selectOne("Reply-Mapper.getPostNo", reply_no);
	}

}
