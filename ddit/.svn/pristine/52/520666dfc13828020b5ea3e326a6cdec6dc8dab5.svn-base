package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.AdminVO;
import kr.or.ddit.request.SearchCriteria;

public interface AdminService {
	List<AdminVO> getAdminList(SearchCriteria cri) throws SQLException;
	
	AdminVO getAdminById(String admin_id) throws SQLException;
	
	void registAdmin(AdminVO admin) throws SQLException;
	
	void modifyAdmin(AdminVO admin) throws SQLException;
	
	void removeAdmin(AdminVO admin) throws SQLException;
}
