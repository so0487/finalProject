package kr.or.ddit.zoom.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.or.ddit.dto.MeetingVO;
import kr.or.ddit.request.ZoomApiIntegration;
import kr.or.ddit.request.ZoomDetails;
import kr.or.ddit.zoom.dao.MeetingDAO;
import kr.or.ddit.zoom.service.MeetingService;


@Controller
public class DeleteMeetingController {
	
	private ZoomApiIntegration ZoomApiIntegration;
	private String apiResult = null;
	private String meetingid = null;
	private String uuid = null;
	ZoomDetails zoomDetails = new ZoomDetails();
	MeetingVO dto = new MeetingVO();
	
	@Autowired
    private void setZoomApiIntegration(ZoomApiIntegration ZoomApiIntegration) {
        this.ZoomApiIntegration = ZoomApiIntegration;
    }
	
	private MeetingService meetingService;
	
	
	@RequestMapping(value = "/DeleteMeeting", method = { RequestMethod.GET, RequestMethod.POST })
    public void DeleteMeeting(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
    	System.out.println("-----------zoom api 연결 요청-----------");
    	
    	meetingid = request.getParameter("meetingid");
    	uuid = request.getParameter("uuid");
    	 
    	
    	//미팅 정보
    	ZoomDetails.setZOOM_STATE("zoom_delete");
        String zoomAuthUrl = ZoomApiIntegration.getAuthorizationUrl(session);
        System.out.println("-------ZoomAuthUrl: " + zoomAuthUrl);
        //model.addAttribute("url", zoomAuthUrl);
        try {
        	response.sendRedirect(zoomAuthUrl);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
        
    }
	
	
	//redirect url
	  @RequestMapping(value = "/delete/meetings/redirect", method = { RequestMethod.GET, RequestMethod.POST })
	  public String DeleteMeetingRedirect(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request)
	            throws IOException {
		  System.out.println("---------회의 삭제 -----------");
		  System.out.println("UUID-----" + uuid);
	        OAuth2AccessToken oauthToken;
	        oauthToken = ZoomApiIntegration.getAccessToken(session, code, state);
	        apiResult = ZoomApiIntegration.DelMeeting(oauthToken,meetingid);
	        
	        try {
				meetingService.removeMeeting(uuid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        System.out.println("apiResult-----" + apiResult);
	        return "redirect:/zoom";
	    }
	
	
}
