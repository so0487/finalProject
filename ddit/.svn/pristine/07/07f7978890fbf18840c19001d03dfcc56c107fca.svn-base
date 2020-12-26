package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.StudentVO;
import kr.or.ddit.member.dao.StudentDAO;
import kr.or.ddit.request.SearchCriteria;

public class StudentServiceImpl implements StudentService {
	private StudentDAO studentDAO;

	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}

	@Override
	public List<StudentVO> getStudentList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudentVO getStudentById(String student_id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void modifyStudent(StudentVO student) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeStudent(StudentVO student) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void registJoinStudent(MemberVO member) throws SQLException {
		studentDAO.insertJoinStudent(member);		
	}
	
}
