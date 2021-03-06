package kr.or.ddit.classes.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.CslVO;
import kr.or.ddit.request.SearchCriteria;

public interface ClassStudentListService {
	List<CslVO> getClassStudentListList() throws SQLException;
	
	List<CslVO> getClassStudentListListByClass_no(String class_no) throws SQLException;
	
	List<CslVO> getCslListByStudent_id(String member_id) throws SQLException;
	
	CslVO getClassStudentListByNo(String class_student_list) throws SQLException;;
	
	void registClassStudentList(CslVO csl) throws SQLException;
	
	void modifyClassStudentList(CslVO csl) throws SQLException;
	
	void removeClassStudentList(CslVO csl) throws SQLException;
	
	String getClsNo() throws SQLException;
	
	List<CslVO> getClsListBylecture_no(String lecture_no) throws SQLException; 
	
	void modiClsEmpStatus(String classStudentList_no) throws SQLException;
	
}
