package kr.or.ddit.common.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.MenuVO;
import kr.or.ddit.request.SearchCriteria;

public class MenuDAOImpl implements MenuDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<MenuVO> selectMainMenu() throws SQLException {
		List<MenuVO> menuList = null;
		menuList = sqlSession.selectList("Menu-Mapper.selectMainMenu");
		return menuList;
	}

	@Override
	public List<MenuVO> selectSubMenu(String menu_no) throws SQLException {
		List<MenuVO> menuList = null;
		menuList = sqlSession.selectList("Menu-Mapper.selectSubMenu",menu_no);
		return menuList;
	}

	@Override
	public MenuVO getMenuByMcode(String menu_no) throws SQLException {
		MenuVO menu = null;
		menu = sqlSession.selectOne("Menu-Mapper.selectMenuByMcode",menu_no);
		return menu;
	}
}
