package kr.or.ddit.lecture.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.VideoVO;
import kr.or.ddit.request.SearchCriteria;

public interface VideoDAO {
	List<VideoVO> selectVideoList(SearchCriteria cri) throws SQLException;
	
	VideoVO selectVideoByNo(String video_no) throws SQLException;;
	
	void insertVideo(VideoVO video) throws SQLException;
	
	void updateVideo(VideoVO video) throws SQLException;
	
	void deleteVideo(String video_no) throws SQLException;

	List<VideoVO> selectVideoByLectureNo(String lecture_no) throws SQLException;

	String selectVideoNo() throws SQLException;
}
