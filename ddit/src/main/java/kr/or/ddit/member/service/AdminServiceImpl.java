package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.AdminVO;
import kr.or.ddit.member.dao.AdminDAO;
import kr.or.ddit.request.SearchCriteria;

public class AdminServiceImpl implements AdminService {
	private AdminDAO adminDAO;
	
	
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
	
	@Override
	public List<AdminVO> getAdminList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public AdminVO getAdminById(String admin_id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void registAdmin(AdminVO admin) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void modifyAdmin(AdminVO admin) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void removeAdmin(AdminVO admin) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	
	
	
}
