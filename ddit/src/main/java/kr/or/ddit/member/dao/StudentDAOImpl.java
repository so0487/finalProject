package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.StudentVO;
import kr.or.ddit.request.SearchCriteria;

public class StudentDAOImpl implements StudentDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<StudentVO> selectStudentList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudentVO selectStudentById(String student_id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertStudent(StudentVO student) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateStudent(StudentVO student) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteStudent(StudentVO student) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertJoinStudent(MemberVO member) throws SQLException {
		sqlSession.update("Student-Mapper.insertStudent", member);		
	}


}
