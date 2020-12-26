package kr.or.ddit.exam.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.ExamVO;
import kr.or.ddit.request.SearchCriteria;

public class ExamDAOImpl implements ExamDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<ExamVO> selectExamList() throws SQLException {		
		return sqlSession.selectList("Exam-Mapper.selectExamList");
	}

	@Override
	public ExamVO selectExamByNo(String exam_no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertExam(ExamVO exam) throws SQLException {
		sqlSession.update("Exam-Mapper.insertExam",exam);		
	}

	@Override
	public void updateExam(ExamVO exam) throws SQLException {
		sqlSession.update("Exam-Mapper.updateExam",exam);
		
	}

	@Override
	public void deleteExam(String exam_no) throws SQLException {
		sqlSession.update("Exam-Mapper.deleteExam",exam_no);		
	}
	

	@Override
    public String selectExamNo() throws SQLException {
	    String exam_no=sqlSession.selectOne("Exam-Mapper.selectExamNo");
	    return exam_no;
    }

	@Override
	public void disableExam(String exam_no) throws SQLException {
		sqlSession.update("Exam-Mapper.disableExam",exam_no);		
	}

	@Override
	public String selectExamByNumber(Map<String,Object> ExampleExam_no) throws SQLException {
		
		return sqlSession.selectOne("Exam-Mapper.selectExamByNumber", ExampleExam_no);
	}

	@Override
	public List<ExamVO> selectExamByTestNo(String test_no) throws SQLException {		
		return sqlSession.selectList("Exam-Mapper.selectExamByTestNo",test_no);
	}

}
