package kr.or.ddit.assign.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.assign.dao.AttachToAssignDAO;
import kr.or.ddit.assign.service.AssignmentHistoryService;
import kr.or.ddit.assign.service.AssignmentService;
import kr.or.ddit.classes.service.ClassService;
import kr.or.ddit.dto.AssignmentHistoryVO;
import kr.or.ddit.dto.AssignmentVO;
import kr.or.ddit.dto.AttachToAssignVO;
import kr.or.ddit.dto.ClassVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.lecture.service.LectureService;
import kr.or.ddit.request.ModifyAssignmentHistoryRequest;
import kr.or.ddit.request.RegistAssignmentHistoryRequest;
import kr.or.ddit.request.SearchCriteria;

@Controller
@RequestMapping("/assign")
public class AssignController {
	
	@Autowired
	private AssignmentService assignService;
	
	
	@Resource(name="assignFileUploadPath")
	private String assignFileUploadPath;
	
	@Autowired
	private AssignmentHistoryService assignmentHistoryService;
	
	@Autowired
	private AttachToAssignDAO attachToAssignDAO;
	
	@Autowired
	private LectureService lectureService;
	
	@Autowired
	private ClassService classService;
	
	@RequestMapping("/main")
	public String main() throws Exception{
		return "assign/main.open";
	}	
	
	@RequestMapping("/registForm")
	public ModelAndView registForm(String lecture_no, HttpServletRequest request, ModelAndView mnv) throws SQLException {

		String url = "assign/assignRegistForm.page";
		String class_no = lectureService.getLectureByNo(lecture_no).getClass_no();
		ClassVO classVO = classService.getClassByNo(class_no);
		
		
		mnv.addObject("classVO", classVO);
		mnv.addObject("lecture_no", lecture_no);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/studentRegistForm")
	public ModelAndView studentRegistForm(String assignment_no, HttpServletRequest request, ModelAndView mnv) throws SQLException {
		AssignmentVO assignment = assignService.getAssignmentByNo(assignment_no);
		
		String url = "assign/assignHistoryRegistForm.page";
		
		mnv.addObject("assignment", assignment);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public void regist(AssignmentVO assignment, HttpServletRequest request, HttpServletResponse response ) throws SQLException {

		response.setContentType("text/html; charset=utf-8");
		try {			
			
			assignService.assignRegist(assignment);
			
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록 되었습니다.')");
			out.println("location.href='" + request.getContextPath()
					+ "/assign/list.do?lecture_no="+assignment.getLecture_no()+"'");
			out.println("</script>");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("등록실패.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value = "studentRegist", method = RequestMethod.POST, produces = "text/plain;char=utf-8")
	public void registudentRegistst(RegistAssignmentHistoryRequest registReq , HttpServletRequest request, HttpServletResponse response ) throws SQLException, Exception {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(assignmentHistoryService.getAssignmentHistoryCheck(registReq.toAssignmentHistoryVO())==null) {
			try {			
				
				AssignmentHistoryVO assignmentHistory = registReq.toAssignmentHistoryVO();
				
				List<AttachToAssignVO> attachList = saveFile(registReq);
				
				assignmentHistory.setAttachList(attachList);
				
				
				assignmentHistoryService.registAssignmentHistory(assignmentHistory);
				
				out.println("<script>");
				out.println("alert('등록 되었습니다.')");
				out.println("location.href='" + request.getContextPath()
						+ "/assign/studentList.do?lecture_no="+assignmentHistory.getLecture_no()+"'");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("등록실패.");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			out.println("<script>");
			out.println("alert('이미 과제가 제출되어 있습니다. 과제함을 확인해주세요.')");
			out.println("location.href='" + request.getContextPath()
					+ "/assign/studentList.do?lecture_no="+registReq.getLecture_no()+"'");
			out.println("</script>");
		}
		
		
	}	

	
	@RequestMapping("/list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv, String lecture_no, HttpServletRequest request){

		String url = "assign/assignList.page";

		try {
			Map<String, Object> dataMap = assignService.getAssignmentList(cri, lecture_no);
			mnv.addAllObjects(dataMap);
			mnv.setViewName(url);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return mnv;
	}
	
	@RequestMapping("/studentList")
	public ModelAndView Studentlist(SearchCriteria cri, ModelAndView mnv, String lecture_no, HttpServletRequest request) throws SQLException{
		
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		String loginID = loginUser.getMember_id();
		
		String url = "assign/assignStudentList.page";
		
		Map<String, Object> dataMap= assignmentHistoryService.getAssignmentHistoryList(cri, loginID, lecture_no);
		System.out.println(dataMap.get("assignHistoryList"));
		mnv.addAllObjects(dataMap);		
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping("/submitList")
	public ModelAndView submitList(SearchCriteria cri, ModelAndView mnv, String assignment_no, HttpServletRequest request) throws SQLException{
		
		String url = "assign/assignSubmitList.page";
		
		Map<String, Object> dataMap= assignmentHistoryService.getAssignSubmitList(cri, assignment_no);
		System.out.println(dataMap.get("assignSubmitList"));
		mnv.addAllObjects(dataMap);		
		mnv.setViewName(url);

		return mnv;
	}
	
	
	
	@RequestMapping("/studentDetail")
	public ModelAndView studentDetail(String assignment_history_no, SearchCriteria cri, ModelAndView mnv, HttpServletResponse response) throws SQLException, Exception {
		String url = "assign/assignHistoryDetail.page";
		AssignmentHistoryVO assignHistory = assignmentHistoryService.getAssignmentHistoryByNo(assignment_history_no);
		AssignmentVO assign = assignService.getAssignmentByNo(assignHistory.getAssignment_no());
		response.setContentType("text/html; charset=utf-8");
		
		List<AttachToAssignVO> attachList = assignHistory.getAttachList();
		
		if (attachList != null) {
			for (AttachToAssignVO attach : attachList) {
				String fileName = attach.getAttach_name().split("\\$\\$")[1];	
				attach.setAttach_name(fileName);
			} 
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('리스트 출력 실패');</script>");
		}

		mnv.addObject("assignHistory", assignHistory);
		mnv.addObject("assign", assign);
		mnv.setViewName(url);
		return mnv;		
	}
	
	
	
	
	@RequestMapping("/detail")
	public ModelAndView detail(String assignment_no, SearchCriteria cri, ModelAndView mnv) throws SQLException {
		String url = "assign/assignDetail.page";
		AssignmentVO assignment = assignService.getAssignmentByNo(assignment_no);

		mnv.addObject("assignment", assignment);
		mnv.setViewName(url);
		return mnv;		
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String assignment_no, SearchCriteria cri, ModelAndView mnv) throws SQLException {
		String url = "assign/assignModifyForm.page";
		
		
		
		String class_no = lectureService.getLectureByNo(assignService.getAssignmentByNo(assignment_no).getLecture_no()).getClass_no();
		ClassVO classVO = classService.getClassByNo(class_no);
			
		mnv.addObject("classVO", classVO);
		
		AssignmentVO assignment = assignService.getAssignmentByNo(assignment_no);
		Date date = assignment.getAssignment_end_date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String endDate = sdf.format(date);	
		
		mnv.addObject("assignment",assignment);
		mnv.addObject("endDate", endDate);
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping("/studentModifyForm")
	public ModelAndView studentModifyForm(String assignment_history_no, ModelAndView mnv) throws SQLException {
		String url = "assign/assignHistoryModifyForm.page";

		AssignmentHistoryVO assignHistory = assignmentHistoryService.getAssignmentHistoryByNo(assignment_history_no);
		
		List<AttachToAssignVO> attachList = assignHistory.getAttachList();		
		if (attachList != null) {
			for (AttachToAssignVO attach : attachList) {
				String fileName = attach.getAttach_name().split("\\$\\$")[1];	
				attach.setAttach_name(fileName);
			} 
		}

		mnv.addObject("assignHistory",assignHistory);
		mnv.setViewName(url);

		return mnv;
	}
	
	
	@RequestMapping("/modify")
	public void modify(AssignmentVO assign, @ModelAttribute("cri") SearchCriteria cri, HttpServletResponse  response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			assignService.modifyAssignment(assign);

			out.println("<script>");
			out.println("alert('수정되었습니다.');");
			out.println("location.href='detail.do?assignment_no=" + assign.getAssignment_no() + "';");
			out.println("</script>");

		} catch (SQLException e) {
			out.println("<script>");
			out.println("alert('수정이 실패했습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
		}
	}
	
	@RequestMapping(value = "studentModify", method = RequestMethod.POST)
	public void studentModify(ModifyAssignmentHistoryRequest modifyReq,  HttpSession session, HttpServletResponse  response) throws IOException, Exception {
		String assignFileUploadPath = this.assignFileUploadPath;
		//삭제된 파일 삭제
		if(modifyReq.getDeleteFile()!=null && modifyReq.getDeleteFile().length>0) {
			for(String attach_no : modifyReq.getDeleteFile()) {
				String fileName = attachToAssignDAO.selectAttachByAttachNo(attach_no).getAttach_name();
				File deleteFile = new File(assignFileUploadPath,fileName);
				if(deleteFile.exists()) {
					attachToAssignDAO.deleteAttach(attach_no);
					deleteFile.delete();
				}
			}
		}
		
		//추가 혹은 변경될 파일 저장
		List<AttachToAssignVO>attachList = saveFile(modifyReq);
		AssignmentHistoryVO assignHistory = modifyReq.toAssignmentHistoryVO();
		for(AttachToAssignVO attach : attachList) {
			attach.setAssignment_history_no(assignHistory.getAssignment_history_no());
			
		}
		
		assignHistory.setAttachList(attachList);
		
		// DB에 해당 데이터 추가
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			assignmentHistoryService.modifyAssignmentHistory(assignHistory);

			out.println("<script>");
			out.println("alert('수정되었습니다.');");
			out.println("location.href='studentDetail.page?assignment_history_no=" + assignHistory.getAssignment_history_no() + "';");
			out.println("</script>");

		} catch (SQLException e) {
			out.println("<script>");
			out.println("alert('수정이 실패했습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
		}

	}
	
	@RequestMapping("/modifyStudentScore")
	public void modifyStudentScore(AssignmentHistoryVO assignHistory, HttpServletResponse  response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			assignmentHistoryService.modifyScoreAssignmentHistory(assignHistory);

			out.println("<script>");
			out.println("alert('점수가 등록 되었습니다.');");
			out.println("location.href='submitList.do?assignment_no=" + assignHistory.getAssignment_no() + "';");
			out.println("</script>");

		} catch (SQLException e) {
			out.println("<script>");
			out.println("alert('점수등록이 실패했습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
		}
	}
	
	
	@RequestMapping("/remove")
	public void remove(String assignment_no, String lecture_no, @ModelAttribute("cri") SearchCriteria cri, HttpServletResponse  response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			assignService.removeAssignment(assignment_no);

			out.println("<script>");
			out.println("alert('삭제되었습니다.');");
			out.println("location.href='list.page?lecture_no=" + lecture_no + "';");
			out.println("</script>");

		} catch (SQLException e) {
			out.println("<script>");
			out.println("alert('삭제를 실패했습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
		}
	}
	
	@RequestMapping("/studentRemove")
	public void studentRemove(String assignment_history_no, String lecture_no, HttpServletResponse  response) throws IOException {
		AssignmentHistoryVO assignmentHistory = new AssignmentHistoryVO();
		assignmentHistory.setAssignment_history_no(assignment_history_no);
		assignmentHistory.setLecture_no(lecture_no);
		System.out.println(assignmentHistory+"@@@@@@@@@@@@@@@@@@@@");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			assignmentHistoryService.removeAssignmentHistory(assignmentHistory);

			out.println("<script>");
			out.println("alert('삭제되었습니다.');");
			out.println("location.href='studentList.page?lecture_no=" + lecture_no + "';");
			out.println("</script>");

		} catch (SQLException e) {
			out.println("<script>");
			out.println("alert('삭제를 실패했습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
		}
	}
	
	
	
	private List<AttachToAssignVO> saveFile(RegistAssignmentHistoryRequest registReq) throws Exception {
		String assignFileUploadPath = this.assignFileUploadPath;
		
		List<AttachToAssignVO> attachList = new ArrayList<AttachToAssignVO>();
		
		if (registReq.getUploadFile() != null) {
			for (MultipartFile multi : registReq.getUploadFile()) {
				String fileName = UUID.randomUUID().toString().replace("-", "") + "$$" + multi.getOriginalFilename();
				File target = new File(assignFileUploadPath, fileName);

				if (!target.exists()) {
					target.mkdirs();
				}
				multi.transferTo(target);

				AttachToAssignVO attach = new AttachToAssignVO();

				attach.setAttach_upload_path(assignFileUploadPath);
				attach.setAttach_name(fileName);
				attach.setAttach_original_name(multi.getOriginalFilename());
				attach.setAttach_type(fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase());
				
				attachList.add(attach);
			}
		}
		return attachList;
	}
}
