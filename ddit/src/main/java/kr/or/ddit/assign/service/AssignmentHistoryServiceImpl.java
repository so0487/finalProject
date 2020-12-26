package kr.or.ddit.assign.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.assign.dao.AssignmentDAO;
import kr.or.ddit.assign.dao.AssignmentHistoryDAO;
import kr.or.ddit.assign.dao.AttachToAssignDAO;
import kr.or.ddit.board.dao.AttachDAO;
import kr.or.ddit.dto.AssignmentHistoryVO;
import kr.or.ddit.dto.AssignmentVO;
import kr.or.ddit.dto.AttachToAssignVO;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.PostVO;
import kr.or.ddit.request.PageMaker;
import kr.or.ddit.request.SearchCriteria;

public class AssignmentHistoryServiceImpl implements AssignmentHistoryService {
	private AssignmentHistoryDAO assignmentHistoryDAO;
	public void setAssignmentHistoryDAO(AssignmentHistoryDAO assignmentHistoryDAO) {
		this.assignmentHistoryDAO = assignmentHistoryDAO;
	}
	
	private AttachToAssignDAO attachToAssignDAO;	
	public void setAttachToAssignDAO(AttachToAssignDAO attachToAssignDAO) {
		this.attachToAssignDAO = attachToAssignDAO;
	}


	@Override
	public AssignmentHistoryVO getAssignmentHistoryByNo(String assignment_history_no) throws SQLException {
		
		AssignmentHistoryVO assignHistory = assignmentHistoryDAO.selectAssignmentHistoryByNo(assignment_history_no);
		List<AttachToAssignVO> attachList = attachToAssignDAO.selectAttachByAssignHistoryNo(assignment_history_no);

		assignHistory.setAttachList(attachList);
		
		return assignHistory;
	}

	@Override
	public void registAssignmentHistory(AssignmentHistoryVO assignmentHistory) throws SQLException {
		String assignmentHistory_no = assignmentHistoryDAO.selectAssignmentHistoryNo();
		assignmentHistory.setAssignment_history_no(assignmentHistory_no);
		assignmentHistoryDAO.insertAssignmentHistory(assignmentHistory);
		
		if (assignmentHistory.getAttachList() != null) {
			for (AttachToAssignVO attach : assignmentHistory.getAttachList()) {				
				attach.setAssignment_history_no(assignmentHistory_no);
				attachToAssignDAO.insertAttach(attach);
			}
		}
		
	}

	@Override
	public void modifyAssignmentHistory(AssignmentHistoryVO assignmentHistory) throws SQLException {
		assignmentHistoryDAO.updateAssignmentHistory(assignmentHistory);
		if(assignmentHistory.getAttachList() == null) {
			
		}else {
			// attachDAO.deleteAllAttach(post.getPost_no());
			for (AttachToAssignVO attach : assignmentHistory.getAttachList()) {
				attach.setAssignment_history_no(assignmentHistory.getAssignment_history_no());
				attachToAssignDAO.insertAttach(attach);
			}			
		}		
	}

	@Override
	public void removeAssignmentHistory(AssignmentHistoryVO assignmentHistory) throws SQLException {
		attachToAssignDAO.deleteAllAttach(assignmentHistory.getAssignment_history_no());		
		assignmentHistoryDAO.deleteAssignmentHistory(assignmentHistory);
	}



	@Override
	public Map<String, Object> getAssignmentHistoryList(SearchCriteria cri, String loginID, String lecture_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<Map<String, Object>> assignHistoryList = assignmentHistoryDAO.selectAssignmentHistoryList(cri, loginID, lecture_no);
		Map<String, Object> dataMapSearch = new HashMap<String, Object>();
		dataMapSearch.put("lecture_no", lecture_no);
		dataMapSearch.put("cri", cri);
		int totalCount = assignmentHistoryDAO.selectAssignHistoryCriteriaTotalCount(dataMapSearch);
		
		// pageMaker생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("assignHistoryList", assignHistoryList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("lecture_no", lecture_no);
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getAssignSubmitList(SearchCriteria cri, String assignment_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<Map<String, Object>> assignSubmitList = assignmentHistoryDAO.selectAssignSubmitList(cri, assignment_no);
		Map<String, Object> dataMapSearch = new HashMap<String, Object>();		
		dataMapSearch.put("cri", cri);
		dataMapSearch.put("assignment_no", assignment_no);
		int totalCount = assignmentHistoryDAO.selectAssignSubmitCriteriaTotalCount(dataMapSearch);
		
		// pageMaker생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("assignSubmitList", assignSubmitList);
		dataMap.put("pageMaker", pageMaker);	
		
		return dataMap;		
	}


	@Override
	public AssignmentHistoryVO getAssignmentHistoryCheck(AssignmentHistoryVO assignmentHistory) throws SQLException {
		return assignmentHistoryDAO.selectAssignmentHistoryCheck(assignmentHistory);		 
	}


	@Override
	public void modifyScoreAssignmentHistory(AssignmentHistoryVO assignmentHistory) throws SQLException {
		assignmentHistoryDAO.updateScoreAssignmentHistory(assignmentHistory);		
	}













}
