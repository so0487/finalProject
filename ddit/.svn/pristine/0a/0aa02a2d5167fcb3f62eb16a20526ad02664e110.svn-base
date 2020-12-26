package kr.or.ddit.common.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.MenuVO;
import kr.or.ddit.request.SearchCriteria;

public interface MenuService {
	List<MenuVO> getMainMenuList() throws SQLException; 
	
	List<MenuVO> getSubMenuList(String menu_no) throws SQLException;
	
	MenuVO getMenuByMcode(String menu_no) throws SQLException;
}
