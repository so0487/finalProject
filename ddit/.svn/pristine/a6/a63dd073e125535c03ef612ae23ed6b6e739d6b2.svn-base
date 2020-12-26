package kr.or.ddit.interviewHistoryStu.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import kr.or.ddit.dto.InterviewHistoryStuVO;
import kr.or.ddit.request.SearchCriteria;

public class InterviewHistoryStuDAOImpl implements InterviewHistoryStuDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<InterviewHistoryStuVO> selectInterviewHistoryStuList(String interview_no)
			throws SQLException {
		List<InterviewHistoryStuVO> ihsList = sqlSession.selectList("InterviewHistoryStu-Mapper.selectInterviewHistoryStuList",interview_no);
		return ihsList;
	}

	@Override
	public InterviewHistoryStuVO selectInterviewHistoryStuByNo(String interview_history_stu_no) throws SQLException {
		InterviewHistoryStuVO ivhs = sqlSession.selectOne("InterviewHistoryStu-Mapper.selectInterviewHistoryStuByNo",interview_history_stu_no);
		return ivhs;
	}

	@Override
	public void insertInterviewHistoryStu(InterviewHistoryStuVO interviewhistorystu) throws SQLException {
		sqlSession.insert("InterviewHistoryStu-Mapper.insertInterviewHistoryStu",interviewhistorystu);
	}

	@Override
	public void updateInterviewHistoryStu(Map<String, String> param) throws SQLException {
		sqlSession.update("InterviewHistoryStu-Mapper.updateInterviewHistoryStu",param);
	}

	@Override
	public void deleteInterviewHistoryStu(String interview_history_stu_no) throws SQLException {
		sqlSession.delete("InterviewHistoryStu-Mapper.deleteInterviewHistoryStuByNo",interview_history_stu_no);
	}

	@Override
	public String selectInterviewHistoryStuNo() throws SQLException {
		String interviewHistory_no = sqlSession.selectOne("InterviewHistoryStu-Mapper.selectInterviewHistoryStuNo");
		return interviewHistory_no;
	}

	@Override
	public int selectCntInterviewHistoryStuByNo(Map<String, String> param) {
		int cnt = sqlSession.selectOne("InterviewHistoryStu-Mapper.selectCntInterviewHistoryStuByNo",param);
		return cnt;
	}

	@Override
	public List<InterviewHistoryStuVO> selectInterviewHistoryStuByStu(String student_id) throws SQLException {
		return sqlSession.selectList("InterviewHistoryStu-Mapper.selectInterviewHistoryStuByStu",student_id);
	}

	@Override
	public List<InterviewHistoryStuVO> selectInterviewHistoryStuByCno(String class_no) throws SQLException {
		return sqlSession.selectList("InterviewHistoryStu-Mapper.selectInterviewHistoryStuByCno",class_no);
	}
}
