package kr.or.ddit.exam.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.ExamCategoryVO;
import kr.or.ddit.request.SearchCriteria;

public class ExamCategoryDAOImpl implements ExamCategoryDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<ExamCategoryVO> selectExamCategoryList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ExamCategoryVO selectExamCategoryByNo(String exam_category_no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertExamCategory(ExamCategoryVO examcategory) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateExamCategory(ExamCategoryVO examcategory) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteExamCategory(ExamCategoryVO examcategory) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	@Override
    public String selectExamCateNo() throws SQLException {
	    String exam_category_no=sqlSession.selectOne("Scoring-Mapper.selectExamCateNo");
	    return exam_category_no;
    }

}
