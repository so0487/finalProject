package kr.or.ddit.lecture.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.dto.ProfessorVO;
import kr.or.ddit.dto.SubjectVO;
import kr.or.ddit.lecture.service.SubjectService;
import kr.or.ddit.member.service.ProfessorService;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.request.SubjectRequest;

@Controller
@RequestMapping("/lecture/subject")
public class SubjectController {
	
	@Autowired
	private ProfessorService professorService;
	
	@Autowired
	private SubjectService subjectService;
	
	public void setSubjectService(SubjectService subjectService) {
		this.subjectService = subjectService;
	}

	@RequestMapping("/main")
	public String main() throws Exception{
		return "/lecture/subject/list.do";
	}
	
	@RequestMapping("/registForm")
	public ModelAndView registForm(SearchCriteria cri, ModelAndView mnv, String error, HttpServletResponse response) throws Exception {
		String url = "lecture/subject/registForm.page";
		String subject_no = subjectService.getSubjectNo();
		
		cri = new SearchCriteria();
		Map<String, Object> dataMap = subjectService.getSearchSubjectList(cri);
		List<ProfessorVO> professorList = professorService.getProfessorList(cri);
		mnv.addAllObjects(dataMap);
		mnv.addObject("professorList", professorList);
		mnv.addObject("subject_no", subject_no);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/regist")
	public void regist(SubjectVO subjectVO, @RequestParam(value="professor_id")String professor_id, HttpServletResponse response, HttpServletRequest request) throws Exception {
		try {
			String subject_no = subjectService.getSubjectNo();
			subjectVO.setSubject_no(subject_no);
			response.setContentType("text/html;charset=utf-8");
			subjectService.registSubject(subjectVO);
			ProfessorVO professor = professorService.getProfessorById(professor_id);
			professor.setSubject_no(subjectVO.getSubject_no());
			professorService.registProSub(professor);
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록되었습니다.');");
			out.println("location.href='" + request.getContextPath() + "/lecture/subject/list.do';");
			out.println("</script>");
			
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("실패...");
		}
	}
	
	@RequestMapping("/list")
	public ModelAndView list(HttpServletResponse response, HttpServletRequest request, SearchCriteria cri, ModelAndView mnv) throws SQLException {
		String url = "lecture/subject/list.page";
		Map<String, Object> dataMap = subjectService.getSearchSubjectList2(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/detail")
	public ModelAndView detail(String subject_no, ModelAndView mnv) throws Exception {
		String url = "lecture/subject/detail.page";
		System.out.println(subject_no);
		SubjectRequest subject = subjectService.getSubjectByNo(subject_no);
		
		mnv.addObject("subject", subject);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(SearchCriteria cri, String subject_no, ModelAndView mnv) throws Exception {
		String url = "lecture/subject/modifyForm.page";
		cri = new SearchCriteria();
		List<ProfessorVO> professorList = professorService.getProfessorList(cri);
		SubjectRequest subject = subjectService.getSubjectByNo(subject_no);
		List<ProfessorVO> professor = professorService.getProfessorBySub(subject_no);
		mnv.addObject("subject", subject);
		mnv.addObject("professor", professor);
		mnv.addObject("professorList", professorList);
		mnv.setViewName(url);
		 
		return mnv;
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public void modify(SubjectVO subjectVO, @RequestParam(value="professor_id")String professor_id, @RequestParam(value="prof_id")String prof_id, HttpServletResponse response) throws Exception {
		subjectService.modifySubject(subjectVO);
		response.setContentType("text/html; charset=utf-8");
		ProfessorVO professor = professorService.getProfessorById(professor_id);
		professor.setSubject_no(subjectVO.getSubject_no());
		professorService.registProSub(professor);
		ProfessorVO prof = professorService.getProfessorById(prof_id);
		prof.setSubject_no("");
		professorService.registProSub(prof);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('수정되었습니다.');");
		out.println("location.href='detail.page?subject_no=" + subjectVO.getSubject_no() + "';");
		out.println("</script>");
		
	}
	
	@RequestMapping("/remove")
	public void remove(String subject_no, HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		subjectService.removeSubject(subject_no);
		PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제되었습니다.')");
			out.println("location.href='" + request.getContextPath() + "/lecture/subject/list.do';");
			out.println("</script>");
		
	}
	
}
