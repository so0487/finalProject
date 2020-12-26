package kr.or.ddit.schedule.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.ScheduleVO;
import kr.or.ddit.request.SearchCriteria;

public class ScheduleDAOImpl implements ScheduleDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<ScheduleVO> selectScheduleList(String member_id) throws SQLException {
		List<ScheduleVO> scheduleList = sqlSession.selectList("Schedule-Mapper.selectScheduleList",member_id);
		return scheduleList;
	}

	@Override
	public ScheduleVO selectScheduleByNo(String schedule_no) throws SQLException {
		ScheduleVO schedule = sqlSession.selectOne("Schedule-Mapper.selectScheduleByNo",schedule_no);
		return schedule;
	}

	@Override
	public void insertSchedule(ScheduleVO schedule) throws SQLException {
		sqlSession.update("Schedule-Mapper.insertSchedule",schedule);
		
	}

	@Override
	public void updateSchedule(ScheduleVO schedule) throws SQLException {
		sqlSession.update("Schedule-Mapper.updateSchedule",schedule);
		
	}

	@Override
	public void deleteSchedule(String schedule_no) throws SQLException {
		sqlSession.update("Schedule-Mapper.deleteSchedule",schedule_no);
		
	}

	@Override
	public String selectScheduleNo() throws SQLException {
		String schedule_no = sqlSession.selectOne("Schedule-Mapper.selectScheduleNo");
		return schedule_no;
	}

	@Override
	public List<Date> selectDateList(Map<String, String> param) {
		List<Date> dateList = sqlSession.selectList("Schedule-Mapper.selectDateList",param);
		return dateList;
	}

	@Override
	public List<ScheduleVO> selectExistSchedule(Map<String, String> param) throws SQLException {
		return sqlSession.selectList("Schedule-Mapper.selectExistSchedule", param);
	}

	@Override
	public void insertScheduleList(List<ScheduleVO> scheduleList) throws SQLException {
		sqlSession.update("Schedule-Mapper.insertScheduleList",scheduleList);
		
	}

	@Override
	public List<ScheduleVO> selectScheduleMyList(String member_id) throws SQLException {
		List<ScheduleVO> scheduleList = sqlSession.selectList("Schedule-Mapper.selectScheduleMyList",member_id);
		return scheduleList;
	}

}
