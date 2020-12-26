package kr.or.ddit.schedule.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.ScheduleVO;

public interface ScheduleDAO {
	List<ScheduleVO> selectScheduleList(String member_id) throws SQLException;
	List<ScheduleVO> selectScheduleMyList(String member_id) throws SQLException;
	
	List<ScheduleVO> selectExistSchedule(Map<String,String> param) throws SQLException;
	
	ScheduleVO selectScheduleByNo(String schedule_no) throws SQLException;;
	
	void insertSchedule(ScheduleVO schedule) throws SQLException;
	
	void insertScheduleList(List<ScheduleVO> scheduleList) throws SQLException;
	
	void updateSchedule(ScheduleVO schedule) throws SQLException;
	
	void deleteSchedule(String schedule_no) throws SQLException;
	
	String selectScheduleNo() throws SQLException;
	
	List<Date> selectDateList(Map<String,String> param);
	
	
}
