package kr.or.ddit.emprate.service;

import java.sql.SQLException;
import java.util.Map;

public interface EmpRateService {

	//회차별 취업률
	Map<String, Object>studentEmpRatio(String curriculum_no) throws SQLException;
	
	//커리큘럼별 취업률
	Map<String, Object>curriculumEmpRatio() throws SQLException;
	
	Map<String, String> classEmpRatio(String class_no) throws Exception;
	
}
