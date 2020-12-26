package kr.or.ddit.lecture.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.AttendanceVO;
import kr.or.ddit.request.SearchCriteria;

public interface AttendanceService {
	List<AttendanceVO> getAttendanceList(SearchCriteria cri) throws SQLException;
	
	AttendanceVO getAttendanceByNo(String attendance_no) throws SQLException;;
	
	void registAttendance(AttendanceVO attendance) throws SQLException;
	
	void modifyAttendance(AttendanceVO attendance) throws SQLException;
	
	void removeAttendance(String attendance_id) throws SQLException;
	
	List<AttendanceVO> getAttendanceNobyStu(Map<String, String> params) throws SQLException;

	int getAttendanceNobyStuCnt(Map<String, String> params) throws SQLException;
	
	int selectAttendanceNobyLecture(Map<String, String> params) throws SQLException;
}
