package kr.or.ddit.common.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.MenuVO;
import kr.or.ddit.request.SearchCriteria;

public interface MenuDAO {
		
	List<MenuVO> selectMainMenu() throws SQLException; 
	
	List<MenuVO> selectSubMenu(String menu_no) throws SQLException;
	
	MenuVO getMenuByMcode(String menu_no) throws SQLException;
}
