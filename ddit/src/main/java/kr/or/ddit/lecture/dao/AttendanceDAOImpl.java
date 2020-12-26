package kr.or.ddit.lecture.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.AttendanceVO;
import kr.or.ddit.request.SearchCriteria;

public class AttendanceDAOImpl implements AttendanceDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<AttendanceVO> selectAttendanceList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AttendanceVO selectAttendanceByNo(String attendance_no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertAttendance(AttendanceVO attendance) throws SQLException {
		sqlSession.update("Attendance-Mapper.insertAttendance",attendance);
	}

	@Override
	public void updateAttendance(AttendanceVO attendance) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAttendance(String attendance_id) throws SQLException {
		sqlSession.update("Attendance-Mapper.deleteAttendanceByLecture",attendance_id);
	}

	@Override
	public String selectAttendanceNo() throws SQLException {
		return sqlSession.selectOne("Attendance-Mapper.selectAttendanceNo");
	}

	@Override
	public List<AttendanceVO> selectAttendanceNobyStu(Map<String, String> params) throws SQLException {
		return sqlSession.selectList("Attendance-Mapper.selectAttendanceNobyStu",params);
	}

	@Override
	public int selectAttendanceNobyStuCnt(Map<String, String> params) throws SQLException {
		return sqlSession.selectOne("Attendance-Mapper.selectAttendanceNobyStuCnt",params);
	}

	@Override
	public int selectAttendanceNobyLecture(Map<String, String> params) throws SQLException {
		return sqlSession.selectOne("Attendance-Mapper.selectAttendanceNobyLecture",params);
	}

}
