package kr.or.ddit.schedule.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.ScheduleCategoryVO;
import kr.or.ddit.request.SearchCriteria;

public interface ScheduleCategoryDAO {
	List<ScheduleCategoryVO> selectScheduleCategoryList() throws SQLException;
	
	ScheduleCategoryVO selectScheduleCategoryByNo(String schedule_category_no) throws SQLException;;
	
	void insertScheduleCategory(ScheduleCategoryVO schedulecategory) throws SQLException;
	
	void updateScheduleCategory(ScheduleCategoryVO schedulecategory) throws SQLException;
	
	void deleteScheduleCategory(ScheduleCategoryVO schedulecategory) throws SQLException;
}
