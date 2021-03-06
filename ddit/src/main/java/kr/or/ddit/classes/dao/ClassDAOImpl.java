package kr.or.ddit.classes.dao;

import java.sql.SQLException;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.ClassVO;
import kr.or.ddit.dto.CurriculumVO;
import kr.or.ddit.request.SearchCriteria;

public class ClassDAOImpl implements ClassDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<ClassVO> selectSearchClassList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<ClassVO> classList = sqlSession.selectList("Class-Mapper.selectSearchClassList", cri, rowBounds);

		return classList;
	}
	
	@Override
	public int selectSearchClassListCount(SearchCriteria cri) throws SQLException {
		int count = sqlSession.selectOne("Class-Mapper.selectSearchClassListCount", cri);
		return count;
	}

	@Override
	public ClassVO selectClassByNo(String class_no) throws SQLException {
		ClassVO classVO = sqlSession.selectOne("Class-Mapper.selectClassByNo", class_no);
		return classVO;
	}

	@Override
	public void insertClass(ClassVO classVO) throws SQLException {
		sqlSession.update("Class-Mapper.insertClass", classVO);
	}

	@Override
	public void updateClass(ClassVO classVO) throws SQLException {
		sqlSession.update("Class-Mapper.updateClass", classVO);
		
	}

	@Override
	public void deleteClass(String class_no) throws SQLException {
		sqlSession.update("Class-Mapper.deleteClass", class_no);
		
	}
	 @Override
	 public String selectClassNo() throws SQLException {
	    String class_no =sqlSession.selectOne("Class-Mapper.selectClassNo");
	    return class_no;
	 }

	@Override
	public List<ClassVO> selectClassList(String curriculum_no) throws SQLException {
		List<ClassVO> classList = sqlSession.selectList("Class-Mapper.selectClassList",curriculum_no);
		return classList;
	}

	@Override
	public int selectMaxClass_number(String curriculum_no) throws SQLException {
		int class_number = 0;
		
		class_number=sqlSession.selectOne("Class-Mapper.selectMaxClass_number",curriculum_no);
				
		
		return class_number;
	}

	@Override
	public Date selectClass_end_date(Map<String, Object> dataMap) throws SQLException {
		
		Date class_end_date = sqlSession.selectOne("Class-Mapper.selectClass_end_date",dataMap);
		return class_end_date;
		
	}

	@Override
	public void recruitmentClass(String class_no) throws SQLException {
		sqlSession.update("Class-Mapper.recruitmentClass", class_no);
		
	}

	@Override
	public int selectClassDayCount(Map<String, String> param) throws SQLException {
		return sqlSession.selectOne("Class-Mapper.selectClassDayCount",param);
	}

	@Override
	public List<ClassVO> selectClassListEndInterview() throws SQLException {
		return sqlSession.selectList("Class-Mapper.selectClassListEndInterview");
	}

	@Override
	public void updateClassRealCnt(String class_no) throws SQLException {
		sqlSession.update("Class-Mapper.updateClassRealCnt",class_no);
	}

	@Override
	public void updateClassEmpRatio(String class_no) throws SQLException {
		sqlSession.update("Class-Mapper.updateClassEmpRatio",class_no);
	}



	

}
