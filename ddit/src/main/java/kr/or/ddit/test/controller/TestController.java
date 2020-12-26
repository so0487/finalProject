package kr.or.ddit.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.dto.TestVO;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.test.service.TestService;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	private TestService service;

	
	@RequestMapping("/main")
	public String main() throws Exception{
		return "test/main.open";
	}
	
	@RequestMapping("/registForm")
	public String registForm(String error, HttpServletResponse response) {
		return null;
	}
	
	@RequestMapping("/regist")
	public void regist(TestVO test, HttpServletResponse response) {
		
	}
	
	@RequestMapping("/list")
	public List<TestVO> list(SearchCriteria cri, ModelAndView mnv, String lecture_id){
		return null;
	}

	@RequestMapping("/detail")
	public ModelAndView detail(String test_no, SearchCriteria cri, ModelAndView mnv) {
		return null;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String test_no, SearchCriteria cri, ModelAndView mnv) {
		return null;
	}
	
	@RequestMapping("/modify")
	public void modify(TestVO test, @ModelAttribute("cri") SearchCriteria cri,  HttpServletResponse  response) {
		
	}
	
	@RequestMapping("/remove")
	public void remove(String test_no, @ModelAttribute("cri") SearchCriteria cri, HttpServletResponse response) {
		
	}
	
	

}
