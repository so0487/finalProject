package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.PostVO;
import kr.or.ddit.request.SearchCriteria;

public class PostDAOImpl implements PostDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<PostVO> selectPostList(SearchCriteria cri, String board_no) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap = new HashMap<>();

		dataMap.put("page", cri.getPage());
		dataMap.put("perPageNum", cri.getPerPageNum());
		dataMap.put("searchType", cri.getSearchType());
		dataMap.put("keyword", cri.getKeyword());
		dataMap.put("board_no", board_no);
		
		
		List<PostVO> postList = sqlSession.selectList("Post-Mapper.selectSearchPostList", dataMap, rowBounds);
		System.out.println("dataMap : " +dataMap );
		System.out.println("postList : " +postList );
		

		return postList;
	}

	@Override
	public PostVO selectPostByNo(String post_no) throws SQLException {
		PostVO post = sqlSession.selectOne("Post-Mapper.selectPostByPostNo",post_no);
		return post;
	}

	@Override
	public void insertPost(PostVO post) throws SQLException {
		sqlSession.update("Post-Mapper.insertPost",post);
	}

	@Override
	public void updatePost(PostVO post) throws SQLException {
		sqlSession.update("Post-Mapper.updatePost",post);
	}

	@Override
	public void deletePost(PostVO post) throws SQLException {
		sqlSession.update("Post-Mapper.deletePost",post);
	}

	@Override
	public void increaseViewCnt(String post_no) throws SQLException {
		sqlSession.update("Post-Mapper.increasePostViewCnt",post_no);
	}
	
	@Override
	public String getMaxPost_no() throws SQLException {
		String post_no = null;
		post_no = sqlSession.selectOne("Post-Mapper.getMaxPost_no");
		if(post_no==null) {
			return "POST0001";
		}
		
		int temp = Integer.parseInt(post_no.substring(4))+1;
		post_no = String.valueOf(temp);
		while(post_no.length()<4) {
			post_no = "0"+post_no;
		}
		
		post_no = "POST"+post_no;
		
		return post_no;
	}

	@Override
	public int selectPostCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int count = sqlSession.selectOne("Post-Mapper.selectSearchPostListCount", cri);
		return count;
	}

	@Override
	public String selectPostSequenceNextValue() throws SQLException {
		String seq_num = sqlSession.selectOne("Post-Mapper.selectPostSequenceNextValue");
		return seq_num;
	}

	@Override
	public String selectNoticeSeqNextValue() throws SQLException {
		String seq_num = sqlSession.selectOne("Post-Mapper.selectNoticeSeqNextValue");
		return seq_num;
	}

	@Override
	public String selectQnASeqNextValue() throws SQLException {
		String seq_num = sqlSession.selectOne("Post-Mapper.selectQnASeqNextValue");
		return seq_num;
	}

	@Override
	public String selectFreeSeqNextValue() throws SQLException {
		String seq_num = sqlSession.selectOne("Post-Mapper.selectFreeSeqNextValue");
		return seq_num;
	}

	@Override
	public String selectImpSeqNextValue() throws SQLException {
		String seq_num = sqlSession.selectOne("Post-Mapper.selectImpSeqNextValue");
		return seq_num;
	}

	@Override
	public String selectPdsSeqNextValue() throws SQLException {
		String seq_num = sqlSession.selectOne("Post-Mapper.selectPdsSeqNextValue");
		return seq_num;
	}

	@Override
	public String selectFAQSeqNextValue() throws SQLException {
		String seq_num = sqlSession.selectOne("Post-Mapper.selectFAQSeqNextValue");
		return seq_num;
	}

	@Override
	public List<PostVO> selectBoardRownum() throws SQLException {
		return sqlSession.selectList("Post-Mapper.selectBoardRownum");
	}

	@Override
	public String selectDeclareSeqNextValue() throws SQLException {
		String seq_num = sqlSession.selectOne("Post-Mapper.selectDeclareSeqNextValue");
		return seq_num;
	}

}
