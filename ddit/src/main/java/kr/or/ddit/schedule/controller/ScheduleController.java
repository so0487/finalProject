package kr.or.ddit.schedule.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.counsel.service.CounselService;
import kr.or.ddit.dto.CounselVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ScheduleCategoryVO;
import kr.or.ddit.dto.ScheduleVO;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.schedule.service.ScheduleCategoryService;
import kr.or.ddit.schedule.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private ScheduleCategoryService scheduleCategoryService;
	
	@Autowired
	private CounselService counselService;

	
	@RequestMapping("/main")
	public String main() throws Exception{
		return "schedule/main.open";
	}
	
	@RequestMapping("/registForm")
	public String sendForm(String error, HttpServletResponse response) {
		return null;
	}
	
	@RequestMapping(value="/schedule/regist", method= RequestMethod.POST)
	public ResponseEntity<String> registSchedule(ScheduleVO schedule, HttpServletResponse response,HttpSession session) {
		ResponseEntity<String> entity = null;
		try {
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			Map<String,String> param = new HashMap<>();
			param.put("member_id", member.getMember_id());
			param.put("start", schedule.getSchedule_start_date());
			param.put("end", schedule.getSchedule_end_date());
			
			if(scheduleService.getExistSchedule(param).size()==0) {
				String schedule_no = scheduleService.getScheduleNo();
				schedule.setMember_id(member.getMember_id());
				schedule.setSchedule_no(schedule_no);
				schedule.setSchedule_subject_no(schedule_no);
				scheduleService.registSchedule(schedule);
				String counsel_no = null;
				if(schedule.getSchedule_category_no().equals("SCHEDULE_CATEGORY0006")) {
					CounselVO counsel = new CounselVO();
					ScheduleVO scheduleTop = scheduleService.getScheduleByNo(schedule_no);
					counsel_no = counselService.getCounselNo();
					scheduleTop.setSchedule_subject_no(counsel_no);
					counsel.setCounsel_no(counsel_no);
					counsel.setCounsel_professor(member.getMember_id());
					counsel.setCounsel_start(schedule.getSchedule_start_date());
					counsel.setCounsel_end(schedule.getSchedule_end_date());
					counsel.setCounsel_content(schedule.getSchedule_content());
					counsel.setCounsel_title(schedule.getSchedule_title());
					counselService.registCounsel(counsel);
					entity = new ResponseEntity<String>(counsel_no, HttpStatus.OK);
				}else {
					entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				}
				
			} else {
				entity = new ResponseEntity<String>("FAIL",HttpStatus.OK);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
		
	}
	
	@RequestMapping("/list")
	public String list (SearchCriteria cri, ModelAndView mnv, String schedule_no) {
		
		return null;
	}
	
	@RequestMapping("/calendar/calendar")
	public ModelAndView listCalendar(SearchCriteria cri, ModelAndView mnv, HttpSession session)throws SQLException {
		String url = "schedule/calendar/calendar.page";
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		List<ScheduleVO> scheduleList = scheduleService.getScheduleList(loginUser.getMember_id());
		List<ScheduleCategoryVO> scheduleCategoryList = scheduleCategoryService.getScheduleCategoryList();
		
		mnv.addObject("loginUser",loginUser);
		mnv.addObject("scheduleList",scheduleList);
		mnv.addObject("scheduleCategoryList",scheduleCategoryList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail (String schedule_no,@ModelAttribute("cri") SearchCriteria cri,  ModelAndView mnv) {
		return null;
	}
	
	@RequestMapping("/schedule/remove")
	public ResponseEntity<String> remove(@RequestParam("schedule_no")String schedule_no, HttpServletResponse response) {
		ResponseEntity<String> entity = null;
		try {
			scheduleService.removeSchedule(schedule_no);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;		
	}
	
//	@RequestMapping("/schedule/modify")
//	public ResponseEntity<String> modify(ScheduleVO schedule, HttpServletResponse response) {
//		ResponseEntity<String> entity = null;
//		try {
//			scheduleService.modifySchedule(schedule);
//			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//		}
//		return entity;		
//	}
	
	@RequestMapping(value="/schedule/modify", method= RequestMethod.POST)
	public ResponseEntity<String> modify(ScheduleVO schedule, HttpServletResponse response,HttpSession session) {
		ResponseEntity<String> entity = null;
		try {
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			String member_id = member.getMember_id();
			String start = schedule.getSchedule_start_date();
			String end = schedule.getSchedule_end_date();
			String title = schedule.getSchedule_title();
			String content = schedule.getSchedule_content();
			Map<String,String> param = new HashMap<>();
			param.put("member_id", member_id);
			param.put("start", start);
			param.put("end", end);
			
			if(scheduleService.getExistSchedule(param).size()==0) {
				ScheduleVO schedule2 =scheduleService.getScheduleByNo(schedule.getSchedule_no());
				schedule2.setSchedule_title(title);
				schedule2.setSchedule_content(content);
				schedule2.setSchedule_start_date(start);
				schedule2.setSchedule_end_date(end);
				scheduleService.modifySchedule(schedule2);
				if (schedule.getSchedule_category_no().equals("SCHEDULE_CATEGORY0006")) {
					CounselVO counsel = counselService.getCounselByNo(schedule.getSchedule_subject_no());
					counsel.setCounsel_start(start);
					counsel.setCounsel_end(end);
					counsel.setCounsel_title(schedule.getSchedule_title());
					counselService.modifyCounsel(counsel);
				}
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

			} else {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			}

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
		
	}

	
}
