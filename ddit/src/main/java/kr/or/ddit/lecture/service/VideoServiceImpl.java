package kr.or.ddit.lecture.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.VideoVO;
import kr.or.ddit.lecture.dao.VideoDAO;
import kr.or.ddit.request.SearchCriteria;

public class VideoServiceImpl implements VideoService {
	private VideoDAO videoDAO;

	public void setVideoDAO(VideoDAO videoDAO) {
		this.videoDAO = videoDAO;
	}

	@Override
	public List<VideoVO> getVideoList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public VideoVO getVideoByNo(String video_no) throws SQLException {
		return videoDAO.selectVideoByNo(video_no);
	}

	@Override
	public void registVideo(VideoVO video) throws SQLException {
		video.setVideo_no(videoDAO.selectVideoNo());
		videoDAO.insertVideo(video);
	}

	@Override
	public void modifyVideo(VideoVO video) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeVideo(String video_no) throws SQLException {
		videoDAO.deleteVideo(video_no);
	}

	@Override
	public List<VideoVO> getVideoByLectureNo(String lecture_no) throws SQLException {
		return videoDAO.selectVideoByLectureNo(lecture_no);
	}

	@Override
	public String getVideoNo() throws SQLException {
		return videoDAO.selectVideoNo();
	}
	
	
	
}
