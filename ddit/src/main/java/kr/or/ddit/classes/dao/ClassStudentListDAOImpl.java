package kr.or.ddit.classes.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.ClassVO;
import kr.or.ddit.dto.CslVO;
import kr.or.ddit.request.SearchCriteria;

public class ClassStudentListDAOImpl implements ClassStudentListDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<CslVO> selectClassStudentListList() throws SQLException {
		

		List<CslVO> clsList = sqlSession.selectList("ClassStudentList-Mapper.selectSearchClsList");
		return clsList;
	}

	@Override
	public CslVO selectClassStudentListByNo(String class_student_list) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertClassStudentList(CslVO csl) throws SQLException {
		sqlSession.update("ClassStudentList-Mapper.insertCsl", csl);
		
	}

	@Override
	public void updateClassStudentList(CslVO csl) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteClassStudentList(CslVO csl) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String selectClsNo() throws SQLException {
		 String classStudentList_no =sqlSession.selectOne("ClassStudentList-Mapper.selectClassStudentListNo");
		 return classStudentList_no;
	}

	@Override
	public List<CslVO> selectClassStudentListListByClass_no(String class_no) throws SQLException {
		List<CslVO> clsList = sqlSession.selectList("ClassStudentList-Mapper.selectClsListByClass_no",class_no);
		return clsList;
	}

	@Override
	public List<CslVO> selectCslListByStudent_id(String member_id) throws SQLException {
		List<CslVO> clsList = sqlSession.selectList("ClassStudentList-Mapper.selectCslListByStudent_id",member_id);
		return clsList;
	}

	@Override
	public List<CslVO> selectClsListBylecture_no(String lecture_no) throws SQLException {
		List<CslVO> clsList = sqlSession.selectList("ClassStudentList-Mapper.selectClsListBylecture_no",lecture_no);
		return clsList;
	}

	@Override
	public void modiClsEmpStatus(String classStudentList_no) throws SQLException {
		System.out.println("DAO"+classStudentList_no);
		sqlSession.update("ClassStudentList-Mapper.modiClsEmpStatus",classStudentList_no);
	}

}
