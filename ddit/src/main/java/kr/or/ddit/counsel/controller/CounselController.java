package kr.or.ddit.counsel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.or.ddit.counsel.service.CounselService;
import kr.or.ddit.dto.CounselVO;
import kr.or.ddit.dto.CslVO;
import kr.or.ddit.dto.EvaToLecVO;
import kr.or.ddit.dto.EvaVO;
import kr.or.ddit.dto.InterviewHistoryStuVO;
import kr.or.ddit.dto.InterviewVO;
import kr.or.ddit.dto.LectureVO;
import kr.or.ddit.dto.MeetingVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProfessorVO;
import kr.or.ddit.dto.ScheduleVO;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.request.ZoomApiIntegration;
import kr.or.ddit.request.ZoomDetails;
import kr.or.ddit.schedule.service.ScheduleService;
import kr.or.ddit.zoom.service.MeetingService;

@Controller
@RequestMapping("/counsel")
public class CounselController {
	
	@Autowired
	private CounselService counselService;
	
	@Autowired
	private MeetingService meetingService;
	
	@Autowired
	private ScheduleService scheduleService;

	
	@RequestMapping("/main")
	public String main() throws Exception{
		return "counsel/main.open";
	}
	
//	@RequestMapping("/registForm")
//	public String registForm(String error, HttpServletResponse response) {
//		return null;
//	}
	
	@RequestMapping("/registForm")
	public ModelAndView registFormClass(ModelAndView mnv, HttpServletResponse response) throws SQLException {
		 String url="counsel/registForm.page";
		 
		 mnv.setViewName(url);
		 return mnv;
	}
	@RequestMapping("/list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv,  HttpSession session) throws SQLException{
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String url ="counsel/list.page";
		cri.setCounsel_member_id(member.getMember_id());
		cri.setCounsel_member_type(member.getMember_role());
		Map<String,Object> dataMap = null;
		dataMap = counselService.getCounselList(cri);
		mnv.addObject("member",member);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
		
	}
	@RequestMapping("/my/list")
	public ModelAndView listMy(SearchCriteria cri, ModelAndView mnv,  HttpSession session) throws SQLException{
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String url ="counsel/myList.page";
		cri.setCounsel_member_id(member.getMember_id());
		cri.setCounsel_member_type(member.getMember_role());
		Map<String,Object> dataMap = null;
		dataMap = counselService.getCouncelListByMember(cri);
		mnv.addObject("member",member);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@RequestMapping(value = "/go/counsel", method = RequestMethod.POST)
	public ResponseEntity<String> modifyGoCounsel(@RequestParam(value="counsel_no")String counsel_no, HttpSession session, HttpServletResponse response) throws IOException {
		ResponseEntity<String> entity = null;
		try {
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			CounselVO counsel = counselService.getCounselByNo(counsel_no);
			counsel.setCounsel_student(member.getMember_id());
			
			counselService.modifyCounselStudent(counsel);
			
			ScheduleVO schedule = new ScheduleVO();
			
			String schedule_no = scheduleService.getScheduleNo();
			schedule.setSchedule_no(schedule_no);
			schedule.setSchedule_category_no("SCHEDULE_CATEGORY0006");
			schedule.setMember_id(member.getMember_id());
			schedule.setSchedule_subject_no(counsel.getCounsel_no());
			schedule.setSchedule_title(counsel.getCounsel_title());
			schedule.setSchedule_content(counsel.getCounsel_content());
			schedule.setSchedule_start_date(counsel.getCounsel_start());
			schedule.setSchedule_end_date(counsel.getCounsel_end());
			schedule.setSchedule_color(counsel.getCounsel_color());
			scheduleService.registSchedule(schedule);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
				
	}
	@Autowired
	private ZoomApiIntegration ZoomApiIntegration;

	public void setZoomApiIntegration(ZoomApiIntegration ZoomApiIntegration) {
		this.ZoomApiIntegration = ZoomApiIntegration;
	}

	private String apiResult = null;
	private MeetingVO meetingvo;

	@RequestMapping("/create/meetings")
	public void createRedirct(ModelAndView mnv, String counsel_no, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ParseException {

		System.out.println(counsel_no + "counsel_no");
		System.out.println("----------------create meetings api 요청------------------");
		System.out.println("---------Zoom 회의 개설 -----------");

		CounselVO counsel= null;
		try {
			counsel = counselService.getCounselByNo(counsel_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String topic = counsel.getCounsel_title();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date start_time = format.parse(counsel.getCounsel_start());
		System.out.println(start_time+"===============");
		Date end_time = format.parse(counsel.getCounsel_end());
		System.out.println(end_time+"===============");
		long result = end_time.getTime() - start_time.getTime();
		result = result / 60 / 1000;           

		// string
		String start_time1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); // 데이트 ->
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date()); // 데이트 ->
		
		System.out.println(start_time1+"===============");
		// String duration = Long.toString(
		// (lecture.getLecture_end_date(). -
		// interview.getInterview_start_date().getTime()) / 60);
		// String password = "123";
		meetingvo = new MeetingVO(null, topic, start_time1, Long.toString(result), "123", null, null, null, null, "2",
				counsel.getCounsel_no(), "C");
		System.out.println("---------dto-----------" + meetingvo.getMeeting_no());
		// 회의 추가 상태로 변환
		ZoomDetails.setZOOM_STATE("zoom_create_counsel");
		System.out.println(session + "세션");
		String zoomAuthUrl = ZoomApiIntegration.getAuthorizationUrl(session);
		System.out.println("-------ZoomAuthUrl: " + zoomAuthUrl);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		out.println("<script>");
		out.println("location.href = '" + zoomAuthUrl + "'");
		out.println("</script>");

		// return mnv;
	}
	
	@RequestMapping(value = "/create/meetings/redirect", method = { RequestMethod.GET, RequestMethod.POST })
	public String CreateMeeting(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request) throws IOException {
		String url = null;
		try {
			System.out.println("---------회의 개설성공 -----------");
			OAuth2AccessToken oauthToken;
			System.out.println(session + "세션임");
			System.out.println("코드" + code);
			oauthToken = ZoomApiIntegration.getAccessToken(session, code, state);
			apiResult = ZoomApiIntegration.setMeeting(oauthToken, meetingvo);
			System.out.println(meetingvo+"/////////");
			System.out.println("apiResult-----" + apiResult);

			JSONParser jsonParse = new JSONParser();
			JSONObject obj = (JSONObject) jsonParse.parse(apiResult);
			System.out.println("JsonObject 결과 값 :: " + obj);
			// Json Array값만 빼기
			// Json 배열 Json Object로 변환

			/* 데이터 베이스에 저장 */

			String meeting_no = obj.get("id").toString();
			String topic = obj.get("topic").toString();
			String start_time = meetingvo.getStart_time();
			String join_url = obj.get("join_url").toString();
			String uuid = obj.get("uuid").toString();
			String joinId = obj.get("id").toString();
			String joinPw = obj.get("password").toString();
			String duration = obj.get("duration").toString();
			String host_Id = obj.get("host_id").toString();
			String start_url = obj.get("start_url").toString();
			String type = obj.get("type").toString();
			String meeting_category_no = meetingvo.getMeeting_category_no();
			String meeting_category = meetingvo.getMeeting_category();

			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			System.out.println("1." + authentication);
			System.out.println("2." + authentication.getPrincipal());

			String userid = ((MemberVO) (session.getAttribute("loginUser"))).getMember_id();

			System.out.println("회의 개설 유저 아이디: " + userid);

			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("meeting_no", meeting_no);
			paramMap.put("topic", topic);
			paramMap.put("start_time", start_time);
			paramMap.put("join_url", join_url);
			paramMap.put("meeting_no", meeting_no);
			paramMap.put("uuid", uuid);
			paramMap.put("join_id", joinId);
			paramMap.put("join_pw", joinPw);
			paramMap.put("duration", duration);
			paramMap.put("host_id", host_Id);
			paramMap.put("start_url", start_url);
			paramMap.put("user_id", userid);
			paramMap.put("type", type);
			paramMap.put("meeting_category_no", meeting_category_no);
			paramMap.put("meeting_category", meeting_category);

			meetingService.registMeeting(paramMap);

			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String start_date = start_time.substring(0, start_time.length() - 1);

			Date start = sdf1.parse(start_date);
			//
			// String start_date = sdf.format(start);
			Date end = new Date((start.getTime() + Integer.parseInt(duration) * 60000));
			String end_date = sdf1.format(end);

			ScheduleVO schedule = new ScheduleVO();
			schedule.setSchedule_no(scheduleService.getScheduleNo());
			schedule.setSchedule_category_no("SCHEDULE_CATEGORY0006");
			schedule.setMember_id(userid);
			schedule.setSchedule_subject_no(meeting_category_no);
			schedule.setSchedule_title(topic);
			schedule.setSchedule_content(topic);
			schedule.setSchedule_color("#74c0fc");
			schedule.setSchedule_start_date(start_date);
			schedule.setSchedule_end_date(end_date);

			scheduleService.registSchedule(schedule);

			System.out.println("param==================" + paramMap);

			url = "redirect:/schedule/calendar/calendar.page";
		} catch (Exception e) {
			e.printStackTrace();
		}

		return url;
	}
	
	
	@RequestMapping(value="/sendCounselNo", method = RequestMethod.POST)
	public ResponseEntity<String> modify(String counsel_no, HttpServletResponse response) {
		ResponseEntity<String> entity = null;
		try {
			entity = new ResponseEntity<String>(counsel_no, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;		
	}
	
	@RequestMapping(value="/goZoom", method = RequestMethod.POST)
	public ResponseEntity<String> listGoZoom(ModelAndView mnv,String counsel_no,HttpServletResponse response) throws SQLException, IOException {
		
		System.out.println(counsel_no);
		MeetingVO meeting = meetingService.getMeetingByMeetingCategoryNo(counsel_no);
		
		String url = meeting.getJoin_url();
		ResponseEntity<String> entity  = null;
		try {
			entity = new ResponseEntity<String>(url, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;

	}
	

	@RequestMapping("/detail")
	public ModelAndView detail(String counsel_no, SearchCriteria cri, ModelAndView mnv) {
		return null;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String counsel_no,SearchCriteria cri, ModelAndView mnv) {
		return null;
	}
	
	@RequestMapping("/modify")
	public void modify(CounselVO counsel, @ModelAttribute("cri") SearchCriteria cri,  HttpServletResponse  response) {
		
	}
	
	@RequestMapping("/remove")
	public void remove(String counsel_no, @ModelAttribute("cri") SearchCriteria cri, HttpServletResponse response) {
		
	}

}
