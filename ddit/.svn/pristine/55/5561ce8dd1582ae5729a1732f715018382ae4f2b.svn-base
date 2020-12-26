package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.AdminVO;
import kr.or.ddit.request.SearchCriteria;

public interface AdminDAO {
	
	List<AdminVO> selectAdminList(SearchCriteria cri) throws SQLException;
	
	AdminVO selectAdminById(String admin_id) throws SQLException;
	
	void insertAdmin(AdminVO admin) throws SQLException;
	
	void updateAdmin(AdminVO admin) throws SQLException;
	
	void deleteAdmin(AdminVO admin) throws SQLException;
	
	
	
}
