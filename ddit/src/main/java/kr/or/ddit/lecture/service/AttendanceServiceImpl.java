package kr.or.ddit.lecture.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.AttendanceVO;
import kr.or.ddit.lecture.dao.AttendanceDAO;
import kr.or.ddit.request.SearchCriteria;

public class AttendanceServiceImpl implements AttendanceService {
	private AttendanceDAO attendanceDAO;

	public void setAttendanceDAO(AttendanceDAO attendanceDAO) {
		this.attendanceDAO = attendanceDAO;
	}

	@Override
	public List<AttendanceVO> getAttendanceList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AttendanceVO getAttendanceByNo(String attendance_no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registAttendance(AttendanceVO attendance) throws SQLException {
		attendance.setAttendance_no(attendanceDAO.selectAttendanceNo());
		attendanceDAO.insertAttendance(attendance);
	}

	@Override
	public void modifyAttendance(AttendanceVO attendance) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeAttendance(String attendance_id) throws SQLException {
		attendanceDAO.deleteAttendance(attendance_id);
	}

	@Override
	public List<AttendanceVO> getAttendanceNobyStu(Map<String, String> params) throws SQLException {
		return attendanceDAO.selectAttendanceNobyStu(params);
	}
	
	@Override
	public int getAttendanceNobyStuCnt(Map<String, String> params) throws SQLException {
		return attendanceDAO.selectAttendanceNobyStuCnt(params);
	}

	@Override
	public int selectAttendanceNobyLecture(Map<String, String> params) throws SQLException {
		return attendanceDAO.selectAttendanceNobyLecture(params);
	}
	
}
