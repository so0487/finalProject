package kr.or.ddit.lecture.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.SubjectVO;
import kr.or.ddit.lecture.dao.SubjectDAO;
import kr.or.ddit.request.PageMaker;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.request.SubjectRequest;

public class SubjectServiceImpl implements SubjectService {
	private SubjectDAO subjectDAO;

	public void setSubjectDAO(SubjectDAO subjectDAO) {
		this.subjectDAO = subjectDAO;
	}

	@Override
	public Map<String, Object> getSearchSubjectList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<SubjectVO> subjectList = subjectDAO.selectSearchSubjectList(cri);
		
		int totalCount = subjectDAO.selectSearchSubjectListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("subjectList", subjectList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getSearchSubjectList2(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<Map<String, Object>> subjectList = subjectDAO.selectSearchSubjectList2(cri);
		
		int totalCount = subjectDAO.selectSearchSubjectListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("subjectList", subjectList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getSubjectList(String subject_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<SubjectVO> subjectList = subjectDAO.selectSubjectList(subject_no);
		dataMap.put("subjectList", subjectList);
		
		return dataMap;
	}

	@Override
	public SubjectRequest getSubjectByNo(String subject_no) throws SQLException {
		SubjectRequest subjectRe = subjectDAO.selectSubjectByNo(subject_no);
		return subjectRe;
	}

	@Override
	public void registSubject(SubjectVO subject) throws SQLException {
		subjectDAO.insertSubject(subject);
		
	}

	@Override
	public void modifySubject(SubjectVO subject) throws SQLException {
		subjectDAO.updateSubject(subject);
		
	}

	@Override
	public void removeSubject(String subject_no) throws SQLException {
		subjectDAO.deleteSubject(subject_no);
		
	}

	@Override
	public String getSubjectNo() throws SQLException {
		return subjectDAO.selectSubjectNo();
	}

	
}
