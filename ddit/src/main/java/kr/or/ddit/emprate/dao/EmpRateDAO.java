package kr.or.ddit.emprate.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface EmpRateDAO {
	//회차별 취업률
	List<Map<String, Object>>studentEmpRatio(String curriculum_no) throws SQLException;
	
	//커리큘럼별 취업률
	List<Map<String, Object>>curriculumEmpRatio() throws SQLException;

	Map<String,String>classEmpRatio(String class_no)throws SQLException;
}
