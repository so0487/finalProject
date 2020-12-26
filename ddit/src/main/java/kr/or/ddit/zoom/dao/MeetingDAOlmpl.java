package kr.or.ddit.zoom.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.dto.MeetingVO;

@Service("MeetingDaoSerivce")
public class MeetingDAOlmpl implements MeetingDAO {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	MeetingVO dto = new MeetingVO();
	HashMap<String, Object> map = new HashMap<String, Object>();

	// 회의 등록
	@Transactional
	@Override
	public void insertMeeting(Map<String, String> paramMap) throws SQLException{
		sqlSession.insert("meeting.insertMeeting", paramMap);
	}

	// 초대 등록
	public int insertInvitation(Map<String, String> paramMap) throws SQLException{
		return sqlSession.insert("meeting.insertInvitation", paramMap);
	}

	// 회의 조회
	@Override
	public List<HashMap<String, Object>> selectMeeting(String userid)throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("-------select--------");
		List<HashMap<String, Object>> result = sqlSession.selectList("meeting.selectMeeting", userid);

		return result;
	}

	// 유저 회의 초대장 조회
	public List<HashMap<String, Object>> selectUserInvit(String userid) throws SQLException{
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> result = sqlSession.selectList("meeting.selectUserInvit", userid);

		return result;
	}

	// 회의삭제
	public int deleteMeeting(String uuid)throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.delete("deleteMeeting", uuid);
	}

	@Override
	public List<Map<String, String>> selectMeetingByMemId(Map<String, String> paramMap)throws SQLException {
		return sqlSession.selectList("meeting.selectMeetingByMemId", paramMap);
		
	}

	@Override
	public List<MeetingVO> selectMeetingBy(Map<String, String> paramMap)throws SQLException {
		return sqlSession.selectList("meeting.selectMeetingBy", paramMap);
	}

  
	@Override
	public List<MeetingVO> selectMeetingPre(Map<String, String> paramMap) throws SQLException {
		return sqlSession.selectList("meeting.selectMeetingPre",paramMap);
	}


	@Override
	public MeetingVO selectMeetingByMeetingCategoryNo(String meeting_category_no) throws SQLException {
		return sqlSession.selectOne("meeting.selectMeetingByMeetingCategoryNo", meeting_category_no);
	}


}
