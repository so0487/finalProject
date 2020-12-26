package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.StudentVO;
import kr.or.ddit.request.SearchCriteria;

public interface StudentService {
	List<StudentVO> getStudentList(SearchCriteria cri) throws SQLException;
	
	StudentVO getStudentById(String student_id) throws SQLException;;
	
	void registJoinStudent(MemberVO member) throws SQLException;
	
	void modifyStudent(StudentVO student) throws SQLException;
	
	void removeStudent(StudentVO student) throws SQLException;
}
