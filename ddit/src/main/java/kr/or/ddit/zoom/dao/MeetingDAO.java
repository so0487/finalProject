package kr.or.ddit.zoom.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.MeetingVO;


public interface MeetingDAO {

	public void insertMeeting(Map<String, String> paramMap)throws SQLException;
	public List<HashMap<String, Object>> selectMeeting(String userid)throws SQLException;
	public int deleteMeeting(String meetingid)throws SQLException;
	public int insertInvitation(Map<String, String> paramMap)throws SQLException;
	public List<HashMap<String, Object>> selectUserInvit(String userid)throws SQLException;
	public List<Map<String, String>> selectMeetingByMemId(Map<String, String> paramMap)throws SQLException;
	public List<MeetingVO> selectMeetingBy(Map<String, String> paramMap)throws SQLException;
	public List<MeetingVO> selectMeetingPre(Map<String, String> paramMap)throws SQLException;
	
	public MeetingVO selectMeetingByMeetingCategoryNo(String meeting_category_no)throws SQLException;
	
}
