package kr.or.ddit.common.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.board.service.PostService;
import kr.or.ddit.classes.service.ClassService;
import kr.or.ddit.common.service.MenuService;
import kr.or.ddit.dto.ClassVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.MenuVO;
import kr.or.ddit.dto.PostVO;
import kr.or.ddit.dto.ScheduleCategoryVO;
import kr.or.ddit.dto.ScheduleVO;
import kr.or.ddit.emprate.service.EmpRateService;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.schedule.service.ScheduleCategoryService;
import kr.or.ddit.schedule.service.ScheduleService;
import kr.or.ddit.util.SecurityUtil;



@Controller
@RequestMapping("/")
public class CommonController {
	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private ScheduleCategoryService scheduleCategoryService;
	
	@Autowired
	private EmpRateService empRateService;
	
	@RequestMapping("main")
	public String main() throws Exception{
		String url = "common/main.page";
		return url;
	}
	
	@RequestMapping(value="common/loginForm")
	public String loginForm(String error, HttpServletResponse response) throws Exception{
		String url = "common/loginForm";
//		System.out.println(error);
		if(error!=null && error.equals("1")) {
			response.setStatus(302);
		}
		return url;
	}
	
	@RequestMapping("/common/loginTimeOut")
	public void loginTimeOut(HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('세션이 만료되었습니다. \\n 다시 로그인하세요!');");
		out.println("location.href='"+request.getContextPath()+"';");
		out.println("</script>");
	}
	
	@RequestMapping("/common/loginExpired")
	public void loginExpired(HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('중복 로그인이 확인되었습니다. \\n 다시 로그인하시면 다른 장치에서 로그인은 취소됩니다!');");
		out.println("location.href='"+request.getContextPath()+"';");
		out.println("</script>");
	}	

	
	
	@RequestMapping(value="common/subMenu",method=RequestMethod.GET)
	@ResponseBody //객체를 시리얼라이즈에서 보내줌, json타입을 데이터를 처리, jackson databind를 깔아놨기때문에 이를 이용하여서.
	public List<MenuVO> subMenu(String menu_no)throws Exception{
//		System.out.println("서브메뉴 !!");
		List<MenuVO> subMenu = menuService.getSubMenuList(menu_no);
		return subMenu;
	}
	@Autowired
	ClassService classService;
	
	
	@RequestMapping(value="index", method=RequestMethod.GET)
	public ModelAndView indexPage(HttpSession session,ModelAndView mnv, String menu_no, Model model, HttpServletRequest request)throws Exception{
		String url="common/indexPage.page";		
		
		SecurityUtil sc = new SecurityUtil();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		List<ClassVO> classList = null;
		List<PostVO> noticeList = null;
		Map<String, Object>curriculumMap = null;
		if(menu_no ==null) menu_no="M000000";
		 List<ScheduleVO> scheduleList =null;
		try {
	         List<MenuVO> menuList = menuService.getMainMenuList();
	         scheduleList = scheduleService.getScheduleMyList(member.getMember_id());
	         curriculumMap = empRateService.curriculumEmpRatio();
	         for(int i=0; i<scheduleList.size(); i++) {
	        	 ScheduleCategoryVO schedule_category = scheduleCategoryService.getScheduleCategoryByNo(scheduleList.get(i).getSchedule_category_no());
	        	 scheduleList.get(i).setSchedule_category_name(schedule_category.getSchedule_category_name());
	         }
	         
	         request.getSession().setAttribute("menuList", menuList);
	         classList = classService.getClassListEndInterview();
	         noticeList = postService.getBoardRownum();
		} catch (SQLException e) {			
			e.printStackTrace();
			url=null;
		}
		mnv.addAllObjects(curriculumMap);
		mnv.addObject("scheduleList",scheduleList);
		mnv.addObject("noticeList",noticeList);
		mnv.addObject("classList",classList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("common/loginUser")
	@ResponseBody
	public ResponseEntity<String> getLoginUser(HttpSession session)throws Exception{
		ResponseEntity<String> entity = null;
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		if(member!=null) {
			entity = new ResponseEntity<String>(member.getMember_id(),HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping("/registForm")
	public String registForm(String error, HttpServletResponse response) throws Exception {
		String url = "member/registForm.page";
		
		return url;
	}
	
	@RequestMapping("common/findForm")
	public String findForm(String error, HttpServletResponse response) throws Exception{
		String url = "common/findForm.open";		
		return url;
	}
	
	@RequestMapping("common/findId")
	public ModelAndView findId(MemberVO member) throws Exception{
		String url="common/resultFindId.open";
		MemberVO memberVO = memberService.getMemberFindId(member);
		
		ModelAndView mnv = new ModelAndView();
		if(memberVO==null) {
			mnv.addObject("member_id", "해당 조건에 일치하는 아이디가 없습니다.");
		}else {
			mnv.addObject("member_id", "회원님의 아이디는 " + memberVO.getMember_id()+ " 입니다.");
		}
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	public static String pwdUrl;
	@RequestMapping("common/findPwd")
	public void findPwd(MemberVO member, HttpServletResponse response) throws Exception{
		
		//cookie발행
		pwdUrl = "cc?ckUrl="+UUID.randomUUID().toString();
		Cookie cookie = new Cookie("pwdUrl",pwdUrl);
		cookie.setMaxAge(5*60);
		cookie.setPath("/");
		response.addCookie(cookie);
		
		MemberVO memberVO = memberService.getMemberFindPwd(member);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if(memberVO==null) {
			out.println("<script>");
			out.println("alert('조건에 일치하는 회원이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('비밀번호 변경메일이 발송되었습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");

		}
		out.close();
	}

	
	@RequestMapping("common/{pwdUrl}")
	public String changePwdForm(HttpServletRequest request, HttpServletResponse response, @PathVariable String pwdUrl) throws Exception{

		String member_id = request.getParameter("member_id");
		request.getSession().setAttribute("member_id", member_id);
		String ckUrl = request.getParameter("ckUrl");	
		request.getSession().setAttribute("ckUrl", ckUrl);
				
		return "common/changePwdForm.open";	
	}
	
	@RequestMapping("common/changePwd")
	public void changePwd(MemberVO member, String member_pwd, HttpServletResponse response, HttpServletRequest request, String ckUrl) throws Exception {	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();		
		
		Cookie[] cookies = request.getCookies() ;

		String ckUrl2 = "cc?ckUrl="+ckUrl;
		
	    if(cookies != null){	         
	        for(int i=0; i < cookies.length; i++){
	            Cookie c = cookies[i] ;	             

	            // 쿠키값을 가져온다
	            String cValue = c.getValue();
	            
	            if(ckUrl2.equals(cValue)) {
	            	//변경 비밀번호 암호화
	            	SecurityUtil scu = new SecurityUtil();
	            	member.setMember_pwd(scu.encrypt(member_pwd));
	            	memberService.modifyMemberResetPwd(member);
	            	
	            	out.println("<script>");
	            	out.println("alert('비밀번호 변경이 완료되었습니다.');");
	            	out.println("window.close();");		
	            	out.println("</script>");
	            			
	        		
	            	Cookie cookie2 = new Cookie("pwdUrl", "test");
	            	cookie2.setPath("/");
	            	cookie2.setMaxAge(0);
//	            	cookie2.setDomain("192.168.31.14");
	            	response.addCookie(cookie2);

	            	out.close();
	            	return;
	            }	             
	        }
	    }
	    
		out.println("<script>");
		out.println("alert('해당 링크가 만료되었습니다.');");
		out.println("window.close();");		
		out.println("</script>");
		out.close();	
		
	}
	
	



}
