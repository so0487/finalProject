package kr.or.ddit.lecture.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.LectureVO;
import kr.or.ddit.lecture.dao.LectureDAO;
import kr.or.ddit.request.SearchCriteria;

public class LectureServiceImpl implements LectureService {
	private LectureDAO lectureDAO;

	public void setLectureDAO(LectureDAO lectureDAO) {
		this.lectureDAO = lectureDAO;
	}

	@Override
	public List<LectureVO> getLectureList() throws SQLException {
		List<LectureVO> lectureList = lectureDAO.selectLectureList();
		return lectureList;
	}

	@Override
	public LectureVO getLectureByNo(String lecture_no) throws SQLException {
		return lectureDAO.selectLectureByNo(lecture_no);
	}

	@Override
	public void registLecture(LectureVO lecture) throws SQLException {
		lectureDAO.insertLecture(lecture);
	}

	@Override
	public void modifyLecture(LectureVO lecture) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeLecture(LectureVO lecture) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getLectureNo() throws SQLException {
		String lecture_no = lectureDAO.selectLectureNo();
		return lecture_no;
	}

	@Override
	public List<LectureVO> getLectureListByClass_no(String class_no) throws SQLException {
		List<LectureVO> lectureList = lectureDAO.selectLectureListByClass_no(class_no);
		return lectureList;
	}

	@Override
	public List<LectureVO> getLectureByPro(String professor_id) throws SQLException {
		return lectureDAO.selectLectureByPro(professor_id);
	}
	
}
