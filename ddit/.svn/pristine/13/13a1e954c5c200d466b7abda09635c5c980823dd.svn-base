package kr.or.ddit.lecture.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.dto.SubjectVO;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.request.SubjectRequest;

public interface SubjectService {
	Map<String, Object> getSearchSubjectList(SearchCriteria cri) throws SQLException;
	
	Map<String, Object> getSearchSubjectList2(SearchCriteria cri) throws SQLException;
	
	Map<String, Object> getSubjectList(String subject_no) throws SQLException;
	
	SubjectRequest getSubjectByNo(String subject_no) throws SQLException;;
	
	void registSubject(SubjectVO subject) throws SQLException;
	
	void modifySubject(SubjectVO subject) throws SQLException;
	
	void removeSubject(String subject_no) throws SQLException;
	
	String getSubjectNo() throws SQLException;
}
