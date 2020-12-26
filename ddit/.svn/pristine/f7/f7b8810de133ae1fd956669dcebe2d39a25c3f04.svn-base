package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.StudentVO;
import kr.or.ddit.request.SearchCriteria;

public interface StudentDAO {
	List<StudentVO> selectStudentList(SearchCriteria cri) throws SQLException;
	
	StudentVO selectStudentById(String student_id) throws SQLException;;
	
	void insertStudent(StudentVO student) throws SQLException;

	void insertJoinStudent(MemberVO member) throws SQLException;
	
	void updateStudent(StudentVO student) throws SQLException;
	
	void deleteStudent(StudentVO student) throws SQLException;
}
