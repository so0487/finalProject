package kr.or.ddit.interview.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.InterviewVO;
import kr.or.ddit.request.SearchCriteria;

public class InterviewDAOImpl implements InterviewDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<InterviewVO> selectInterviewList(String class_no) throws SQLException {
		List<InterviewVO> interviewList = sqlSession.selectList("Interview-Mapper.selectSearchInterviewList",class_no);
		return interviewList;
	}

	@Override
	public InterviewVO selectInterviewByNo(String interview_no) throws SQLException {
		InterviewVO interview = sqlSession.selectOne("Interview-Mapper.selectInterviewByNo",interview_no);
		return interview;
	}

	@Override
	public void insertInterview(InterviewVO interview) throws SQLException {
			sqlSession.insert("Interview-Mapper.insertInterview", interview);
	}

	@Override
	public void updateInterview(InterviewVO interview) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteInterview(InterviewVO interview) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public String selectInterviewNo() throws SQLException {
		String interview_no=sqlSession.selectOne("Interview-Mapper.selectInterviewNo");
		return interview_no;
	}

	@Override
	public void increaseApplyCnt(String interview_no) throws SQLException {
		sqlSession.update("Interview-Mapper.increaseApplyCnt",interview_no);
	}

	@Override
	public List<InterviewVO> selectSearchInterviewList(SearchCriteria cri) throws SQLException {
		int offset=cri.getPageStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		return sqlSession.selectList("Interview-Mapper.selectSearchInterviewList",cri,rowBounds);
	}

	@Override
	public int selectSearchInterviewListCount(SearchCriteria cri) throws SQLException {
		int count = sqlSession.selectOne("Interview-Mapper.selectSearchInterviewListCount",cri);
		return count;
	}
	
	

}
