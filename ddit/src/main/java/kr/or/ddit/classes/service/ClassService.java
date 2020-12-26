package kr.or.ddit.classes.service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.ClassVO;
import kr.or.ddit.request.SearchCriteria;

public interface ClassService {
	Map<String, Object> getSearchClassList(SearchCriteria cri) throws SQLException;
	
	Map<String, Object> getClassList(String curriculum_no) throws SQLException;
	
	ClassVO getClassByNo(String class_no) throws SQLException;;
	
	void registClass(ClassVO classVO) throws SQLException;
	
	void modifyClass(ClassVO classVO) throws SQLException;
	
	void removeClass(String class_no) throws SQLException;
	
	String getClassNo() throws SQLException;
	
	int getMaxClass_number(String curriculum_no) throws SQLException;
	
	Date getClass_end_date(Map<String, Object> dataMap) throws SQLException;
	
	void recruitmentClass(String class_no) throws SQLException;
	
	int getClassDayCount(Map<String, String> param) throws SQLException;
	
	List<ClassVO> getClassListEndInterview() throws SQLException;
	
	void updateClassEmpRatio(String class_no) throws SQLException;
}