package kr.or.ddit.interview.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.InterviewHistoryProVO;
import kr.or.ddit.dto.InterviewVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ScheduleVO;
import kr.or.ddit.interview.dao.InterviewDAO;
import kr.or.ddit.interviewHistoryPro.dao.InterviewHistoryProDAO;
import kr.or.ddit.request.PageMaker;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.schedule.dao.ScheduleDAO;

public class InterviewServiceImpl implements InterviewService {
	private InterviewDAO interviewDAO;
	

	public void setInterviewDAO(InterviewDAO interviewDAO) {
		this.interviewDAO = interviewDAO;
	}
	private ScheduleDAO scheduleDAO;
	
	public void setScheduleDAO(ScheduleDAO scheduleDAO) {
		this.scheduleDAO = scheduleDAO;
	}
	private InterviewHistoryProDAO interviewHistoryProDAO;
	
	public void setInterviewHistoryProDAO(InterviewHistoryProDAO interviewHistoryProDAO) {
		this.interviewHistoryProDAO = interviewHistoryProDAO;
	}

	@Override
	public List<InterviewVO> getInterviewList(String class_no) throws SQLException {
		return interviewDAO.selectInterviewList(class_no);
	}

	@Override
	public InterviewVO getInterviewByNo(String interview_no) throws SQLException {
		return interviewDAO.selectInterviewByNo(interview_no);
	}

	@Override
	public void registInterview(InterviewVO interview,List<String> valueArr) throws SQLException {
		String inverview_no=interviewDAO.selectInterviewNo();
		interview.setInterview_no(inverview_no);
		
		
		interviewDAO.insertInterview(interview);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		
		
		for(int i=0; i<valueArr.size(); i++) {
			InterviewHistoryProVO ivhp = new InterviewHistoryProVO();
			ivhp.setInterview_history_pro_no(interviewHistoryProDAO.selectInterviewHistoryProNo());
			ivhp.setInterview_no(inverview_no);
			ivhp.setProfessor_id(valueArr.get(i));
			interviewHistoryProDAO.insertInterviewHistoryPro(ivhp);
			
			String start_date = sdf.format(interview.getInterview_start_date());
			String end_date = sdf.format(interview.getInterview_end_date());
			ScheduleVO schedule= new ScheduleVO();
			schedule.setSchedule_no(scheduleDAO.selectScheduleNo());
			schedule.setSchedule_category_no("SCHEDULE_CATEGORY0001");
			schedule.setMember_id(ivhp.getProfessor_id());
			schedule.setSchedule_subject_no(interview.getInterview_no());
			schedule.setSchedule_title(interview.getInterview_name());
			schedule.setSchedule_content(interview.getInterview_name());
			schedule.setSchedule_color("#ffa94d");
			schedule.setSchedule_start_date(start_date);
			schedule.setSchedule_end_date(end_date);
			
			scheduleDAO.insertSchedule(schedule);
			
		}
	}

	@Override
	public void modifyInterview(InterviewVO interview) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeInterview(InterviewVO interview) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public Map<String, Object> getSearchInterviewList(SearchCriteria cri) throws SQLException {
	      Map<String,Object> dataMap=new HashMap<String,Object>();
	      
	      //현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
	      List<InterviewVO> interviewList=interviewDAO.selectSearchInterviewList(cri);  
	      
	      
	      //전체 member 개수
	      int totalCount=interviewDAO.selectSearchInterviewListCount(cri);
	      System.out.println(totalCount);
	            
	      //PageMaker 생성.
	      PageMaker pageMaker = new PageMaker();
	      pageMaker.setCri(cri);
	      pageMaker.setTotalCount(totalCount);
	      
	      dataMap.put("interviewList", interviewList);
	      dataMap.put("pageMaker",pageMaker);	      
	      
	      return dataMap;
	}

}
