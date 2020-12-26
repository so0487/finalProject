package kr.or.ddit.classes.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.CurriculumVO;
import kr.or.ddit.request.SearchCriteria;

public interface CurriculumService {
	Map<String, Object> getCurriculumList(SearchCriteria cri) throws SQLException;
	
	CurriculumVO getCurriculumByNo(String curriculum_no) throws SQLException;;
	
	void registCurriculum(CurriculumVO curriculum) throws SQLException;
	
	void modifyCurriculum(CurriculumVO curriculum) throws SQLException;
	
	void removeCurriculum(CurriculumVO curriculum) throws SQLException;
	
	String getCurriculumNo() throws SQLException;
}
