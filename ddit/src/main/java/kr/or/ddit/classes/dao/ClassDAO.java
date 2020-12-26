package kr.or.ddit.classes.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.ClassVO;
import kr.or.ddit.request.SearchCriteria;

public interface ClassDAO {
	List<ClassVO> selectSearchClassList(SearchCriteria cri) throws SQLException;
	
	List<ClassVO> selectClassList(String curriculum_no) throws SQLException;
	
	int selectSearchClassListCount(SearchCriteria cri) throws SQLException;
	
	ClassVO selectClassByNo(String class_no) throws SQLException;;
	
	void insertClass(ClassVO classVO) throws SQLException;
	
	void updateClass(ClassVO classVO) throws SQLException;
	
	void deleteClass(String class_no) throws SQLException;
	
	String selectClassNo() throws SQLException;
	
	int selectMaxClass_number(String curriculum_no) throws SQLException;
	
	Date selectClass_end_date(Map<String, Object> dataMap) throws SQLException;
	
	void recruitmentClass(String class_no) throws SQLException;
	
	int selectClassDayCount(Map<String, String> param) throws SQLException;
	List<ClassVO> selectClassListEndInterview()throws SQLException;
	
	
	void updateClassRealCnt(String class_no)throws SQLException;
	
	void updateClassEmpRatio(String class_no)throws SQLException;
	
}
