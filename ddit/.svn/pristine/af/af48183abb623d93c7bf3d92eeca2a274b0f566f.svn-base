package kr.or.ddit.counsel.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.dto.CounselVO;
import kr.or.ddit.request.SearchCriteria;

public interface CounselService {
	Map<String,Object> getCounselList(SearchCriteria cri) throws SQLException;
	
	Map<String,Object> getCounselListByProfessor(SearchCriteria cri) throws SQLException;
	
	Map<String,Object> getCouncelListByMember(SearchCriteria cri) throws SQLException;
	
	CounselVO getCounselByNo(String counsel_no) throws SQLException;
	
	String getCounselNo() throws SQLException;
	
	void registCounsel(CounselVO counsel) throws SQLException;
	
	void modifyCounsel(CounselVO counsel) throws SQLException;
	
	void removeCounsel(CounselVO counsel) throws SQLException;
	
	void modifyCounselStudent(CounselVO counsel) throws SQLException;
}
