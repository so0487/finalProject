package kr.or.ddit.schedule.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.ScheduleCategoryVO;
import kr.or.ddit.request.SearchCriteria;

public class ScheduleCategoryDAOImpl implements ScheduleCategoryDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<ScheduleCategoryVO> selectScheduleCategoryList() throws SQLException {
		List<ScheduleCategoryVO> scheduleCategoryList = sqlSession.selectList("ScheduleCategory-Mapper.selectScheduleCategoryList");
		return scheduleCategoryList;
	}

	@Override
	public ScheduleCategoryVO selectScheduleCategoryByNo(String schedule_category_no) throws SQLException {
		return sqlSession.selectOne("ScheduleCategory-Mapper.selectScheduleCategoryByNo",schedule_category_no);
	}

	@Override
	public void insertScheduleCategory(ScheduleCategoryVO schedulecategory) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateScheduleCategory(ScheduleCategoryVO schedulecategory) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteScheduleCategory(ScheduleCategoryVO schedulecategory) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
