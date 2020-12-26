package kr.or.ddit.interviewHistoryPro.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.InterviewHistoryProVO;
import kr.or.ddit.interviewHistoryPro.dao.InterviewHistoryProDAO;
import kr.or.ddit.request.SearchCriteria;

public class InterviewHistoryProServiceImpl implements InterviewHistoryProService {
	private InterviewHistoryProDAO interviewHistoryProDAO;

	public void setInterviewHistoryProDAO(InterviewHistoryProDAO interviewHistoryProDAO) {
		this.interviewHistoryProDAO = interviewHistoryProDAO;
	}

	@Override
	public List<InterviewHistoryProVO> getInterviewHistoryProList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public InterviewHistoryProVO getInterviewHistoryProByNo(String interview_history_pro_no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registInterviewHistoryPro(InterviewHistoryProVO interviewhistorypro) throws SQLException {
		interviewhistorypro.setInterview_history_pro_no(interviewHistoryProDAO.selectInterviewHistoryProNo());
		interviewHistoryProDAO.insertInterviewHistoryPro(interviewhistorypro);
	}

	@Override
	public void modifyInterviewHistoryPro(InterviewHistoryProVO interviewhistorypro) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeInterviewHistoryPro(InterviewHistoryProVO interviewhistorypro) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
}
