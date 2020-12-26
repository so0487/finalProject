package kr.or.ddit.classes.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.CslVO;
import kr.or.ddit.request.SearchCriteria;

public interface ClassStudentListDAO {
	List<CslVO> selectClassStudentListList() throws SQLException;
	
	List<CslVO> selectClassStudentListListByClass_no(String class_no) throws SQLException;

	List<CslVO> selectCslListByStudent_id(String member_id) throws SQLException;
	
	CslVO selectClassStudentListByNo(String class_student_list) throws SQLException;;
	
	void insertClassStudentList(CslVO csl) throws SQLException;
	
	void updateClassStudentList(CslVO csl) throws SQLException;
	
	void deleteClassStudentList(CslVO csl) throws SQLException;
	
	String selectClsNo() throws SQLException;
	
	List<CslVO> selectClsListBylecture_no(String lecture_no) throws SQLException;
	
	void modiClsEmpStatus(String classStudentList_no)throws SQLException;
}
