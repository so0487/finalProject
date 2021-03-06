package kr.or.ddit.interviewHistoryStu.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.classes.dao.ClassDAO;
import kr.or.ddit.dto.InterviewHistoryStuVO;
import kr.or.ddit.dto.InterviewVO;
import kr.or.ddit.interview.dao.InterviewDAO;
import kr.or.ddit.interviewHistoryStu.dao.InterviewHistoryStuDAO;
import kr.or.ddit.request.SearchCriteria;

public class InterviewHistoryStuServiceImpl implements InterviewHistoryStuService {
	
	
	private InterviewHistoryStuDAO interviewHistoryStuDAO;

	public void setInterviewHistoryStuDAO(InterviewHistoryStuDAO interviewHistoryStuDAO) {
		this.interviewHistoryStuDAO = interviewHistoryStuDAO;
	}
	
	private InterviewDAO interviewDAO;

	public void setInterviewDAO(InterviewDAO interviewDAO) {
		this.interviewDAO = interviewDAO;
	}
	
	private ClassDAO classDAO;

	public void setClassDAO(ClassDAO classDAO) {
		this.classDAO = classDAO;
	}

	@Override
	public List<InterviewHistoryStuVO> getInterviewHistoryStuList(String interview_no) throws SQLException {
		List<InterviewHistoryStuVO> ivhsList =interviewHistoryStuDAO.selectInterviewHistoryStuList(interview_no);
		return ivhsList;
	}

	@Override
	public InterviewHistoryStuVO getInterviewHistoryStuByNo(String interview_history_stu_no) throws SQLException {
		return interviewHistoryStuDAO.selectInterviewHistoryStuByNo(interview_history_stu_no);
	}
	
	@Override
	public List<InterviewHistoryStuVO> getInterviewHistoryStuByStu(String student_id) throws SQLException {
		return interviewHistoryStuDAO.selectInterviewHistoryStuByStu(student_id);
	}
	
	@Override
	public void registInterviewHistoryStu(InterviewHistoryStuVO interviewhistorystu) throws SQLException {
		interviewhistorystu.setInterview_history_stu_no(interviewHistoryStuDAO.selectInterviewHistoryStuNo());
		Map<String, String> param = new HashMap<String,String>();
		param.put("interview_no", interviewhistorystu.getInterview_no());
		param.put("class_no", interviewDAO.selectInterviewByNo(interviewhistorystu.getInterview_no()).getClass_no());
		param.put("student_id", interviewhistorystu.getStudent_id());
	
		
		if(interviewHistoryStuDAO.selectCntInterviewHistoryStuByNo(param) > 0) {
			throw new SQLException();
			
		}else {
			interviewHistoryStuDAO.insertInterviewHistoryStu(interviewhistorystu);
			interviewDAO.increaseApplyCnt(interviewhistorystu.getInterview_no());
		}
	}

	@Override
	public void modifyInterviewHistoryStu(Map<String, String> param) throws SQLException {
		interviewHistoryStuDAO.updateInterviewHistoryStu(param);
	}

	@Override
	public void removeInterviewHistoryStu(String interview_history_stu_no) throws SQLException {
		System.out.println(interview_history_stu_no);
		InterviewHistoryStuVO ivhs = interviewHistoryStuDAO.selectInterviewHistoryStuByNo(interview_history_stu_no);
		System.out.println(ivhs);
		interviewHistoryStuDAO.deleteInterviewHistoryStu(interview_history_stu_no);
		interviewDAO.increaseApplyCnt(ivhs.getInterview_no());
	}

	@Override
	public List<InterviewHistoryStuVO> getInterviewHistoryStuByCno(String class_no) throws SQLException {
		return interviewHistoryStuDAO.selectInterviewHistoryStuByCno(class_no);
	}


	

	
	
	   
	
}
