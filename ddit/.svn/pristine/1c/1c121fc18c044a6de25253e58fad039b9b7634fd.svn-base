package kr.or.ddit.interviewHistoryPro.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.dto.InterviewHistoryProVO;
import kr.or.ddit.dto.InterviewVO;
import kr.or.ddit.interviewHistoryPro.service.InterviewHistoryProService;
import kr.or.ddit.request.SearchCriteria;

@Controller
@RequestMapping("/interview/ivhp")
public class InterviewHistoryProController {
	@Autowired
	private InterviewHistoryProService ivhpService;

	
	@RequestMapping("/main")
	public String main() throws Exception{
		return "ivhp/main.open";
	}
	
	@RequestMapping("/registForm")
	public String registForm(String error, HttpServletResponse response) {
		return null;
	}
	
	@RequestMapping("/regist")
	public void regist(InterviewHistoryProVO ivhpVO, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			ivhpService.registInterviewHistoryPro(ivhpVO);

			out.println("<script>");
			out.println("alert('면접관 등록 성공')");
			out.println("location.href = document.referrer;");
			out.println("</script>");
		} catch (SQLException e) {
			out.println("<script>");
			out.println("alert('면접관 등록 실패')");
			out.println("location.href = document.referrer;");
			out.println("</script>");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/list")
	public List<InterviewVO> list(SearchCriteria cri, ModelAndView mnv){
		return null;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(String interview_history_pro_no, SearchCriteria cri, ModelAndView mnv) {
		return null;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String interview_history_pro_no,SearchCriteria cri, ModelAndView mnv) {
		return null;
	}
	
	@RequestMapping("/modify")
	public void modify(String interview_history_pro_no, @ModelAttribute("cri") SearchCriteria cri, HttpServletResponse  response) {
		
	}
	
	@RequestMapping("/remove")
	public void remove(String interview_history_pro_no, @ModelAttribute("cri") SearchCriteria cri, HttpServletResponse response) {
		
	}
}
