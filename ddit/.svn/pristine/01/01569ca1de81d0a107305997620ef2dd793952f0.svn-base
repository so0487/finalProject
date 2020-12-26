package kr.or.ddit.lecture.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.SubjectVO;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.request.SubjectRequest;

public interface SubjectDAO {
	List<SubjectVO> selectSearchSubjectList(SearchCriteria cri) throws SQLException;
	
	List<Map<String, Object>> selectSearchSubjectList2(SearchCriteria cri) throws SQLException;
	
	List<SubjectVO> selectSubjectList(String subject_no) throws SQLException;
	
	int selectSearchSubjectListCount(SearchCriteria cri) throws SQLException;
	
	SubjectRequest selectSubjectByNo(String subject_no) throws SQLException;
	
	void insertSubject(SubjectVO subject) throws SQLException;
	
	void updateSubject(SubjectVO subject) throws SQLException;
	
	void deleteSubject(String subject_no) throws SQLException;

	String selectSubjectNo() throws SQLException;
}
