package kr.or.ddit.interviewHistoryStu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.classes.service.ClassService;
import kr.or.ddit.classes.service.ClassStudentListService;
import kr.or.ddit.dto.ClassVO;
import kr.or.ddit.dto.CslVO;
import kr.or.ddit.dto.InterviewHistoryStuVO;
import kr.or.ddit.dto.InterviewVO;
import kr.or.ddit.dto.LectureVO;
import kr.or.ddit.dto.ScheduleVO;
import kr.or.ddit.interview.service.InterviewService;
import kr.or.ddit.interviewHistoryStu.service.InterviewHistoryStuService;
import kr.or.ddit.lecture.service.LectureService;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.schedule.service.ScheduleService;

@Controller
@RequestMapping("/interview/ivhs")
public class InterviewHistoryStuController {
	@Autowired
	private InterviewHistoryStuService ivhsService;
	
	@Autowired
	private ClassService classService;
	
	@Autowired
	private LectureService lectureService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private InterviewService interviewService;
	
	@Autowired
	private ClassStudentListService classStudentListService;
	

	@RequestMapping("/main")
	public String main() throws Exception {
		return "ivhs/main.open";
	}

	@RequestMapping("/registForm")
	public String registForm(String error, HttpServletResponse response) {
		return null;
	}

	@RequestMapping("/regist")
	public void regist(InterviewHistoryStuVO ivhsVO, HttpServletResponse response) throws IOException {
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			ivhsService.registInterviewHistoryStu(ivhsVO);
			InterviewVO interview = interviewService.getInterviewByNo(ivhsVO.getInterview_no());
			String schedule_start_Date = sdf.format(interview.getInterview_start_date());
			String schedule_end_Date = sdf.format(interview.getInterview_end_date());
			ScheduleVO schedule = new ScheduleVO();
			String schedule_no = scheduleService.getScheduleNo();
			schedule.setSchedule_no(schedule_no);
			schedule.setSchedule_category_no("SCHEDULE_CATEGORY0001");
			schedule.setMember_id(ivhsVO.getStudent_id());
			schedule.setSchedule_subject_no(ivhsVO.getInterview_no());
			
			schedule.setSchedule_title(interview.getInterview_name());
			schedule.setSchedule_content(interview.getInterview_name());
			schedule.setSchedule_color("#ffa94d");
			schedule.setSchedule_start_date(schedule_start_Date);
			schedule.setSchedule_end_date(schedule_end_Date);
			
			scheduleService.registSchedule(schedule);
			
			out.println("<script>");
			out.println("alert('면접신청성공')");
			out.println("location.href = document.referrer;");
			out.println("</script>");
		} catch (SQLException e) {
			out.println("<script>");
			out.println("alert('동일한 교육과정 회자 면접에 이미 신청하셨습니다.')");
			out.println("location.href = document.referrer;");
			out.println("</script>");
			e.printStackTrace();
		}

	}

	@RequestMapping("/list")
	public ModelAndView list(String class_no,SearchCriteria cri, ModelAndView mnv, String interview_no,HttpServletResponse response) throws IOException {
		String url = "ivhs/list.page";
		List<InterviewHistoryStuVO> ivhsList = null;
		ClassVO classes = null;
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int sum = 0;
		try {
			ivhsList = ivhsService.getInterviewHistoryStuByCno(class_no);
			
			if(ivhsList.size()==0) {
				out.println("<script>");
				out.println("alert('신청자가 없습니다..')");
				out.println("location.href = document.referrer;");
				out.println("</script>");
			}
			classes = classService.getClassByNo(class_no);
			
			
			for (int i = 0; i < ivhsList.size(); i++) {
				if(ivhsList.get(i).getInterview_history_stu_result().equals("1")) {
					sum++;
				}
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		mnv.addObject("classes",classes);
		mnv.addObject("ivhsList", ivhsList);
		mnv.addObject("sum", sum+"명");
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping("/myhistory")
	public ModelAndView myhistory(SearchCriteria cri, ModelAndView mnv, String student_id) {
		String url = "ivhs/myhistory.page";
		List<InterviewHistoryStuVO> ivhsList = null;
		try {
			ivhsList = ivhsService.getInterviewHistoryStuByStu(student_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mnv.addObject("ivhsList", ivhsList);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/detail")
	public ModelAndView detail(String interview_history_stu_no, SearchCriteria cri, ModelAndView mnv) {
		return null;
	}

	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String interview_history_stu_no, SearchCriteria cri, ModelAndView mnv) {
		return null;
	}

	@RequestMapping("/modify")
	public void modify(String interview_history_stu_no, @ModelAttribute("cri") SearchCriteria cri,
			HttpServletResponse response) {
		
	}

	@RequestMapping("/remove")
	public void remove(String interview_history_stu_no, @ModelAttribute("cri") SearchCriteria cri,
			HttpServletResponse response) throws IOException {
		
	
		try {
			
			ivhsService.removeInterviewHistoryStu(interview_history_stu_no);
			
			response.setContentType("text/html;charset=utf-8");

			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('신청취소 완료');");
			out.println("location.href = document.referrer;");
			out.println("</script>");
			out.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping(value="/changeresult", method = {RequestMethod.POST})
	public void modify(HttpServletResponse response,@RequestParam(value = "valueArrTest[]") List<String> valueArr ,ModelAndView mnv) throws SQLException, IOException {
		
//		String url="ivhs/changedecision.page";
		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>();
		
		for (int i = 0; i < valueArr.size(); i++) {
			Map<String, String> param = new HashMap<String,String>();
			param.put("id", valueArr.get(i));
			param.put("keword", "interview_history_stu_result");
			param.put("value", "1");
			try {
				
				InterviewHistoryStuVO ivhs = ivhsService.getInterviewHistoryStuByNo(valueArr.get(i));
				
				if(ivhs.getInterview_history_stu_result().equals("0")) {
					CslVO csl = new CslVO();
					String classStudentList_no = classStudentListService.getClsNo();
					String student_id = ivhs.getStudent_id();
					InterviewVO interview = interviewService.getInterviewByNo(ivhs.getInterview_no());
					String class_no = interview.getClass_no();
					
					csl.setClassStudentList_no(classStudentList_no);
					csl.setClass_no(class_no);
					csl.setStudent_id(student_id);
					csl.setClassStudentList_status("0");
					classStudentListService.registClassStudentList(csl);
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					ClassVO classVO = classService.getClassByNo(class_no);
					String class_start = sdf.format(classVO.getClass_start_date()) ;
					Map<String,String> params = new HashMap<>();
					params.put("class_start_date", class_start);
					params.put("curriculum_no", classVO.getCurriculum_no());
					List<java.util.Date> dateList = scheduleService.getDateList(params);
					List<LectureVO> lectureList = lectureService.getLectureListByClass_no(class_no);
					for (int j = 0; j < dateList.size(); j++) {
						for(int k=0; k< lectureList.size() ; k++) {
							LectureVO lecture = lectureList.get(k);
							ScheduleVO schedule = new ScheduleVO();
							String schedule_no = scheduleService.getScheduleNo();
							schedule.setSchedule_no(schedule_no);
							schedule.setSchedule_category_no("SCHEDULE_CATEGORY0002");
							schedule.setMember_id(student_id);
							schedule.setSchedule_subject_no(lecture.getLecture_no());
							schedule.setSchedule_title(lecture.getLecture_name());
							schedule.setSchedule_content(lecture.getLecture_name());
							schedule.setSchedule_color("#D25565");
							String schedule_start_date = sdf.format(dateList.get(j));
							schedule.setSchedule_start_date(schedule_start_date+" "+lecture.getLecture_start_date());
							schedule.setSchedule_end_date(schedule_start_date+" "+lecture.getLecture_end_date());
//							scheduleService.registSchedule(schedule);
							scheduleList.add(schedule);
							}
						}
				}
				
				ivhsService.modifyInterviewHistoryStu(param);
				response.setContentType("text/html;charset=utf-8");

				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('합격처리 완료');");
				out.println("location.href = document.referrer;");
				out.println("</script>");
				out.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println(scheduleList+"===================================================");
		scheduleService.registScheduleList(scheduleList);
//		mnv.addObject("valueArr",valueArr);
//		mnv.setViewName(url);
		
//		return mnv;
	}
	
	
	@RequestMapping(value="/changedecision", method = {RequestMethod.GET})
	public void modify(ModelAndView mnv,String interview_history_stu_no,String join_url,HttpServletResponse response) throws SQLException, IOException {
		
		String url=join_url;
		
		
			Map<String, String> param = new HashMap<String,String>();
			param.put("id", interview_history_stu_no);
			param.put("keword", "interview_history_stu_dicision");
			param.put("value", "1");
			try {
				
				InterviewHistoryStuVO ivhs = ivhsService.getInterviewHistoryStuByNo(interview_history_stu_no);
				if(ivhs !=null) {
					if(ivhs.getInterview_history_stu_result().equals("0")) {
						CslVO csl = new CslVO();
						String classStudentList_no = classStudentListService.getClsNo();
						String student_id = ivhs.getStudent_id();
						InterviewVO interview = interviewService.getInterviewByNo(ivhs.getInterview_no());
						String class_no = interview.getClass_no();
						
						csl.setClassStudentList_no(classStudentList_no);
						csl.setClass_no(class_no);
						csl.setStudent_id(student_id);
						csl.setClassStudentList_status("0");
						classStudentListService.registClassStudentList(csl);
					}
				}
				
				ivhsService.modifyInterviewHistoryStu(param);
				
				response.setContentType("text/html;charset=utf-8");

				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("location.href = '"+url+"';");
				out.println("</script>");
				out.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	
		
//		mnv.addObject("valueArr",valueArr);
//		mnv.setViewName(url);
		
//		return mnv;
	
}
