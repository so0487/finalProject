package kr.or.ddit.zoom.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.dto.MeetingVO;
import kr.or.ddit.zoom.dao.MeetingDAO;
import kr.or.ddit.zoom.service.MeetingService;



@Controller
public class ListMeetingController {

			private String topic;
			private String start_time;
			private String join_url;
			private String meetingid;
			private String duration;
			MeetingVO meeting = new MeetingVO();
			private MeetingService meetingService;
			
			public void setMeetingService(MeetingService meetingService) {
				this.meetingService = meetingService;
			}



			@RequestMapping(value ="/list/meetings", method = { RequestMethod.GET, RequestMethod.POST })
				public String createRedirct(Model model, HttpSession session, HttpServletRequest request) throws SQLException{
				  
				  System.out.println("----------------list meetings------------------");
				  Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		            User user = (User) authentication.getPrincipal();
		            String userid = user.getUsername();
		            
		            List<HashMap<String, Object>> meetings = meetingService.getMeeting(userid);
		            System.out.println(userid+"의 회의 리스트: "+ meetings);
		          
		            if(meetings ==null) {
		    			System.out.println("회의 정보  존재 하지 않음 ");
		    			}
		            
		            model.addAttribute("dtos",meetings);
		            
					return "/zoom/ZoomList.page";
				}
	
}