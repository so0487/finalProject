package kr.or.ddit.zoom.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.dto.MeetingVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.request.ZoomApiIntegration;
import kr.or.ddit.request.ZoomDetails;
import kr.or.ddit.zoom.dao.MeetingDAO;
import kr.or.ddit.zoom.service.MeetingService;



@Controller
public class InvitationMeetingController {

	
	private String uuid;
	private String topic;
	private String userid;
	
	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	private MeetingService meetingService;
	
	public void setMeetingService(MeetingService meetingService) {
		this.meetingService = meetingService;
	}


	@RequestMapping(value = "/Invitation", method = { RequestMethod.GET, RequestMethod.POST })
    public String Invitation(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, Authentication auth) {
    	System.out.println("-----------zoom 회의 초대-----------");
    	
    	uuid = request.getParameter("uuid");
    	topic = request.getParameter("topic");
    	MemberVO vo = (MemberVO) auth.getPrincipal();
    	userid = vo.getMember_id();
    	List<HashMap<String, Object>> user = null;
		try {
			user = memberService.getMemberAdmin(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	System.out.println(user);
        model.addAttribute("dtos",user);
        model.addAttribute("topic",topic);
    	return "/zoom/Invitation.page";
    }
	
	
	@RequestMapping(value = "/Invitation/Meeting", method = { RequestMethod.GET, RequestMethod.POST })
    public String InvitationMeeting(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, Authentication auth) throws SQLException {
    	System.out.println("-----------초대하기-----------");
    	
    	HashMap<String, String> paramMap = new HashMap<String, String>();
    	userid = request.getParameter("userid");
    	paramMap.put("userid", userid);
    	paramMap.put("uuid", uuid);
    	System.out.println("----------------------"+userid+","+uuid);
    	int result = meetingService.registInvitation(paramMap);
    	model.addAttribute("msg", "초대장을 보냈습니다.");
    	model.addAttribute("url", "https://f2cde7541078.ngrok.io/list/meetings");
    	return "/zoom/alert.page";
    }
	
	
	
	@RequestMapping(value = "/Invitation/All", method = { RequestMethod.GET, RequestMethod.POST })
    public String InvitationAll(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, Authentication auth) {
    	System.out.println("-----------초대하기-----------");
    	
    	return "/zoom/Invitation.page";
    }
}
