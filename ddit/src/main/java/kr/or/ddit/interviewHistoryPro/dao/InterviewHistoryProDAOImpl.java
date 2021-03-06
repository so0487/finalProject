package kr.or.ddit.interviewHistoryPro.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.InterviewHistoryProVO;
import kr.or.ddit.request.SearchCriteria;

public class InterviewHistoryProDAOImpl implements InterviewHistoryProDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<InterviewHistoryProVO> selectInterviewHistoryProList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public InterviewHistoryProVO selectInterviewHistoryProByNo(String interview_history_pro_no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertInterviewHistoryPro(InterviewHistoryProVO interviewhistorypro) throws SQLException {
		sqlSession.update("InterviewHistoryPro-Mapper.insertInterviewHistoryPro",interviewhistorypro);
	}

	@Override
	public void updateInterviewHistoryPro(InterviewHistoryProVO interviewhistorypro) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteInterviewHistoryPro(InterviewHistoryProVO interviewhistorypro) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String selectInterviewHistoryProNo() throws SQLException {
		return sqlSession.selectOne("InterviewHistoryPro-Mapper.selectInterviewHistoryProNo");
	}

}
