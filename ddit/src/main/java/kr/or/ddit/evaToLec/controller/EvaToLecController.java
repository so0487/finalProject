package kr.or.ddit.evaToLec.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.dto.EvaToLecVO;
import kr.or.ddit.dto.EvaVO;
import kr.or.ddit.dto.LectureVO;
import kr.or.ddit.evaToLec.service.EvaService;
import kr.or.ddit.evaToLec.service.EvaToLecService;
import kr.or.ddit.lecture.service.LectureService;
import kr.or.ddit.request.SearchCriteria;

@Controller
@RequestMapping("/eva")
public class EvaToLecController {
	@Autowired
	private EvaToLecService evaToLecService;

	public void setEvaToLecService(EvaToLecService evaToLecService) {
		this.evaToLecService = evaToLecService;
	}
	
	@Autowired
	private LectureService lectureService;
	
	@Autowired
	private EvaService evaService;
	
	public void setEvaService(EvaService evaService) {
		this.evaService = evaService;
	}

	@RequestMapping("/main")
	public String main() throws Exception{
		return "eva/main.open";
	}
	
	@RequestMapping("/registForm")
	public String sendForm(String error, HttpServletResponse response) {
		return null;
	}
	
	@RequestMapping("/regist")
	public void send(EvaVO eva, HttpServletResponse response) {
		
	}
	
	@RequestMapping("/evaToLec/list")
	public ModelAndView list (SearchCriteria cri, ModelAndView mnv, String eva_to_lec_no) throws SQLException {
		String url = "eva/evaToLec/list.page";
		
		List<EvaToLecVO> evaToLeclist = evaToLecService.getEvaToLecList() ;
		
		List<LectureVO> lectureList = lectureService.getLectureList();
		
		mnv.addObject("evaToLeclist",evaToLeclist);
		mnv.addObject("lectureList",lectureList);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@RequestMapping("/eva/list")
	public ModelAndView listEva (SearchCriteria cri, ModelAndView mnv, String eva_no) throws SQLException {
		String url = "eva/eva/list.page";
		
		List<EvaVO> evalist = evaService.getEvaList() ;
		
		mnv.addObject("evalist",evalist);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail (String eva_to_lec_no,@ModelAttribute("cri") SearchCriteria cri,  ModelAndView mnv) {
		return null;
	}
	
	@RequestMapping("/remove")
	public ModelAndView remove(String eva_to_lec_no, @ModelAttribute("cri") SearchCriteria cri, HttpServletResponse response) {
		return null;		
	}
	
	@RequestMapping("/eva/registForm")
	public ModelAndView registFormEva(ModelAndView mnv) throws SQLException {
		String url="eva/eva/registForm.page";
	    String evalution_no = evaService.getEvaNo();
	    mnv.addObject("evalution_no",evalution_no);
	    mnv.setViewName(url);
	    return mnv;
	}
	
	@RequestMapping("/eva/regist")
	public void registEva(EvaVO evalution, HttpServletResponse response) throws SQLException {
		
		try {
			response.setContentType("text/html;charset=utf-8");
			evaService.registEva(evalution);
			PrintWriter out = response.getWriter();
			 out.println("<script>");
		     out.println("alert('등록되었습니다.')");
		     out.println("location.href='list.do';");
		     out.println("</script>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@RequestMapping("/eva/remove")
	public void removeEva(String evalution_no,HttpServletResponse response) throws SQLException {
		try {
			response.setContentType("text/html;charset=utf-8");
			evaService.removeEva(evalution_no);
			PrintWriter out = response.getWriter();
			 out.println("<script>");
		     out.println("alert('삭제되었습니다.')");
		     out.println("location.href='list.do';");
		     out.println("</script>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
