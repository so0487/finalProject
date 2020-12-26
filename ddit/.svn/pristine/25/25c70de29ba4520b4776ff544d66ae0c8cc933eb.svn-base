package kr.or.ddit.emprate.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class EmpRateDAOImpl implements EmpRateDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	



	@Override
	public Map<String, String> classEmpRatio(String class_no) throws SQLException {
		return sqlSession.selectOne("EmpRatio-Mapper.classEmpRatio",class_no);
	}







	@Override
	public List<Map<String, Object>> curriculumEmpRatio() throws SQLException {

		List<Map<String, Object>> curriculumEmpRatioList = sqlSession.selectList("EmpRatio-Mapper.curriculumEmpRatio");
		return curriculumEmpRatioList;
	}




	@Override
	public List<Map<String, Object>> studentEmpRatio(String curriculum_no) throws SQLException {
		List<Map<String, Object>>studentEmpRatioList = sqlSession.selectList("EmpRatio-Mapper.studentEmpRatio",curriculum_no);
		return studentEmpRatioList;
	}

}
