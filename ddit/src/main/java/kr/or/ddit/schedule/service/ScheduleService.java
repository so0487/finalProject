package kr.or.ddit.schedule.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.ScheduleVO;
import kr.or.ddit.request.SearchCriteria;

public interface ScheduleService {
	List<ScheduleVO> getScheduleList(String member_id) throws SQLException;
	
	List<ScheduleVO> getScheduleMyList(String member_id) throws SQLException;
	
	ScheduleVO getScheduleByNo(String schedule_no) throws SQLException;;
	
	void registSchedule(ScheduleVO schedule) throws SQLException;
	
	void registScheduleList(List<ScheduleVO> scheduleList) throws SQLException;
	
	void modifySchedule(ScheduleVO schedule) throws SQLException;
	
	void removeSchedule(String schedule_no) throws SQLException;
	
	String getScheduleNo() throws SQLException;
	
	List<Date> getDateList(Map<String,String> param);
	
	List<ScheduleVO> getExistSchedule(Map<String,String> param) throws SQLException;
}
