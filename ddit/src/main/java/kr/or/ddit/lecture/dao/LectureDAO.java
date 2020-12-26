package kr.or.ddit.lecture.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.LectureVO;
import kr.or.ddit.request.SearchCriteria;

public interface LectureDAO {
	List<LectureVO> selectLectureList() throws SQLException;
	
	LectureVO selectLectureByNo(String lecture_no) throws SQLException;;
	
	void insertLecture(LectureVO lecture) throws SQLException;
	
	void updateLecture(LectureVO lecture) throws SQLException;
	
	void deleteLecture(LectureVO lecture) throws SQLException;
	
	String selectLectureNo() throws SQLException;
	
	List<LectureVO> selectLectureListByClass_no(String class_no) throws SQLException;
	
	List<LectureVO> selectLectureByPro(String professor_id) throws SQLException;
}
