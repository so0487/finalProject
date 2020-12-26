package kr.or.ddit.lecture.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.VideoVO;
import kr.or.ddit.request.SearchCriteria;

public class VideoDAOImpl implements VideoDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	

	@Override
	public List<VideoVO> selectVideoList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public VideoVO selectVideoByNo(String video_no) throws SQLException {
		return sqlSession.selectOne("Video-Mapper.selectVideoByNo",video_no);
	}
	
	@Override
	public List<VideoVO> selectVideoByLectureNo(String lecture_no) throws SQLException {
		return sqlSession.selectList("Video-Mapper.selectVideoByLectureNo",lecture_no);
	}

	@Override
	public void insertVideo(VideoVO video) throws SQLException {
		sqlSession.update("Video-Mapper.insertVideo",video);
	}

	@Override
	public void updateVideo(VideoVO video) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteVideo(String video_no) throws SQLException {
		sqlSession.update("Video-Mapper.deleteVideo",video_no);
	}
	
	@Override
	public String selectVideoNo() throws SQLException {
		return sqlSession.selectOne("Video-Mapper.selectVideoNo");
	}

}
  