package kr.or.ddit.assign.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.assign.dao.AssignmentDAO;
import kr.or.ddit.dto.AdminVO;
import kr.or.ddit.dto.AssignmentVO;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.PostVO;
import kr.or.ddit.member.service.AdminService;
import kr.or.ddit.request.PageMaker;
import kr.or.ddit.request.SearchCriteria;

public class AssignmentServiceImpl implements AssignmentService {
	private AssignmentDAO assignmentDAO;


	public void setAssignmentDAO(AssignmentDAO assignmentDAO) {
		this.assignmentDAO = assignmentDAO;
	}
	


	@Override
	public AssignmentVO getAssignmentByNo(String assignment_no) throws SQLException {
		
		return assignmentDAO.selectAssignmentByNo(assignment_no);
	}

	@Override
	public void registAssignment(AssignmentVO assignment) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyAssignment(AssignmentVO assignment) throws SQLException {
		assignmentDAO.updateAssignment(assignment);
		
	}


	
	@Override
	public void assignRegist(AssignmentVO assignment) throws SQLException {
		String assignment_no = assignmentDAO.selectAssignmentNo();
		assignment.setAssignment_no(assignment_no);
		assignmentDAO.insertAssignment(assignment);
	}



	@Override
	public Map<String, Object> getAssignmentList(SearchCriteria cri, String lecture_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<AssignmentVO> assignList = assignmentDAO.selectAssignmentList(cri, lecture_no);
		Map<String, Object> dataMapSearch = new HashMap<String, Object>();
		dataMapSearch.put("lecture_no", lecture_no);
		dataMapSearch.put("cri", cri);
		int totalCount = assignmentDAO.selectAssignCriteriaTotalCount(dataMapSearch);

		// pageMaker생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("assignList", assignList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("lecture_no", lecture_no);
		return dataMap;
	}


	@Override
	public void removeAssignment(String assignment_no) throws SQLException {
		assignmentDAO.deleteAssignment(assignment_no);
		
	}



	@Override
	public int getAssignmentScore(Map<String, String> param) throws SQLException {
		return assignmentDAO.selectAssignmentScore(param);
	}



}
