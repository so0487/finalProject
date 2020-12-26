package kr.or.ddit.lecture.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.LectureVO;
import kr.or.ddit.request.SearchCriteria;

public interface LectureService {
	List<LectureVO> getLectureList() throws SQLException;
	
	LectureVO getLectureByNo(String lecture_no) throws SQLException;;
	
	void registLecture(LectureVO lecture) throws SQLException;
	
	void modifyLecture(LectureVO lecture) throws SQLException;
	
	void removeLecture(LectureVO lecture) throws SQLException;
	
	String getLectureNo() throws SQLException;
	
	List<LectureVO> getLectureListByClass_no(String class_no) throws SQLException;
	
	List<LectureVO> getLectureByPro(String professor_id) throws SQLException;
}
