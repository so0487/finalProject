package kr.or.ddit.schedule.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.ScheduleCategoryVO;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.schedule.dao.ScheduleCategoryDAO;

public class ScheduleCategoryServiceImpl implements ScheduleCategoryService {
	private ScheduleCategoryDAO scheduleCategoryDAO;

	public void setScheduleCategoryDAO(ScheduleCategoryDAO scheduleCategoryDAO) {
		this.scheduleCategoryDAO = scheduleCategoryDAO;
	}

	@Override
	public List<ScheduleCategoryVO> getScheduleCategoryList() throws SQLException {
		
		List<ScheduleCategoryVO> scheduleCategoryList = scheduleCategoryDAO.selectScheduleCategoryList();
		return scheduleCategoryList;
	}

	@Override
	public ScheduleCategoryVO getScheduleCategoryByNo(String schedule_category_no) throws SQLException {
		return scheduleCategoryDAO.selectScheduleCategoryByNo(schedule_category_no);
	}

	@Override
	public void registScheduleCategory(ScheduleCategoryVO schedulecategory) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyScheduleCategory(ScheduleCategoryVO schedulecategory) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeScheduleCategory(ScheduleCategoryVO schedulecategory) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
}
