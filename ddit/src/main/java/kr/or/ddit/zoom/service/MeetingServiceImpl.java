package kr.or.ddit.zoom.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.MeetingVO;
import kr.or.ddit.member.dao.AdminDAO;
import kr.or.ddit.schedule.dao.ScheduleDAO;
import kr.or.ddit.zoom.dao.MeetingDAO;

public class MeetingServiceImpl implements MeetingService {
	private MeetingDAO meetingDAO;
	
	
	public void MeetingDAO(MeetingDAO meetingDAO)throws SQLException {
		this.meetingDAO = meetingDAO;
	}
	
	
	public MeetingDAO getMeetingDAO()throws SQLException {
		return meetingDAO;
	}

	public void setMeetingDAO(MeetingDAO meetingDAO)throws SQLException {
		this.meetingDAO = meetingDAO;
	}
	
	private ScheduleDAO scheduleDAO;
	
	public void setScheduleDAO(ScheduleDAO scheduleDAO) {
		this.scheduleDAO = scheduleDAO;
	}


	@Override
	public void registMeeting(Map<String, String> paramMap)throws SQLException {
		meetingDAO.insertMeeting(paramMap);
		
		
	}

	@Override
	public List<HashMap<String, Object>> getMeeting(String userid)throws SQLException {
		
		return meetingDAO.selectMeeting(userid);
	}

	@Override
	public int removeMeeting(String meetingid)throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registInvitation(Map<String, String> paramMap)throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<HashMap<String, Object>> getUserInvit(String userid)throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, String>> getMeetingByMemId(Map<String, String> paramMap)throws SQLException {
		return meetingDAO.selectMeetingByMemId(paramMap);
	}

	@Override
	public List<MeetingVO> gettMeetingBy(Map<String, String> paramMap)throws SQLException {
		return meetingDAO.selectMeetingBy(paramMap);
	}



	@Override
	public List<MeetingVO> getMeetingPre(Map<String, String> paramMap) throws SQLException {
		return meetingDAO.selectMeetingPre(paramMap);
	}


	@Override
	public MeetingVO getMeetingByMeetingCategoryNo(String meeting_category_no) throws SQLException {
		return meetingDAO.selectMeetingByMeetingCategoryNo(meeting_category_no);
	}

  
}
