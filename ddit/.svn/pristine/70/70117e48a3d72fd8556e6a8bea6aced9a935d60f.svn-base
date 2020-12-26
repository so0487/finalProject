package kr.or.ddit.counsel.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.CounselVO;
import kr.or.ddit.request.SearchCriteria;

public interface CounselDAO {
	List<CounselVO> selectCounselList(SearchCriteria cri) throws SQLException;
	
	List<CounselVO> selectCounselListByProfessor(SearchCriteria cri) throws SQLException;
	
	List<CounselVO> selectCouncelListByMember(SearchCriteria cri) throws SQLException;
	
	String selectCounselNo() throws SQLException;
	
	CounselVO selectCounselByNo(String counsel_no) throws SQLException;
	
	int selectSearchCounselListCount1(SearchCriteria cri) throws SQLException;
	
	int selectSearchCounselListCount2(SearchCriteria cri) throws SQLException;
	
	int selectSearchCounselListCount3(SearchCriteria cri) throws SQLException;
	
	void insertCounsel(CounselVO counsel) throws SQLException;
	
	void updateCounsel(CounselVO counsel) throws SQLException;
	
	void updateCounselStudent(CounselVO counsel) throws SQLException;
	
	void deleteCounsel(CounselVO counsel) throws SQLException;
}
