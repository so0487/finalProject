package kr.or.ddit.common.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.common.dao.MenuDAO;
import kr.or.ddit.dto.MenuVO;
import kr.or.ddit.request.SearchCriteria;

public class MenuServiceImpl implements MenuService {
	private MenuDAO menuDAO;

	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}

	@Override
	public List<MenuVO> getMainMenuList() throws SQLException {
		List<MenuVO> menuList = menuDAO.selectMainMenu(); 
		return menuList;
	}

	@Override
	public List<MenuVO> getSubMenuList(String menu_no) throws SQLException {
		List<MenuVO> menuList = menuDAO.selectSubMenu(menu_no);				
		return menuList;
	}


	@Override
	public MenuVO getMenuByMcode(String menu_no) throws SQLException {
		MenuVO menu = menuDAO.getMenuByMcode(menu_no);
		return menu;
	}
	
	
}
