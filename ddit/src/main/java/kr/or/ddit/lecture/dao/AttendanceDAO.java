package kr.or.ddit.lecture.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.AttendanceVO;
import kr.or.ddit.request.SearchCriteria;

public interface AttendanceDAO {
	List<AttendanceVO> selectAttendanceList(SearchCriteria cri) throws SQLException;
	
	AttendanceVO selectAttendanceByNo(String attendance_no) throws SQLException;;
	
	void insertAttendance(AttendanceVO attendance) throws SQLException;
	
	void updateAttendance(AttendanceVO attendance) throws SQLException;
	
	void deleteAttendance(String attendance_id) throws SQLException;
	
	String selectAttendanceNo()throws SQLException;
	
	List<AttendanceVO> selectAttendanceNobyStu(Map<String, String> params) throws SQLException;
	
	int selectAttendanceNobyStuCnt(Map<String, String> params) throws SQLException;
	
	int selectAttendanceNobyLecture(Map<String,String>params) throws SQLException;
	

	
}
