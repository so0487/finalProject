package kr.or.ddit.member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.classes.service.ClassStudentListService;
import kr.or.ddit.dto.CslVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.ProfessorService;
import kr.or.ddit.member.service.StudentService;
import kr.or.ddit.request.MemberAdminModifyRequest;
import kr.or.ddit.request.MemberModifyRequest;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.util.SecurityUtil;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private StudentService studentService;

	@Autowired
	private ProfessorService professorService;

	@Autowired
	private ClassStudentListService classStudentListService;

	@RequestMapping("/main")
	public String main() throws Exception {
		return "member/main.open";
	}

	@Resource(name = "picturePath")
	private String picturePath;

	@RequestMapping(value = "/picture", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> picture(@RequestParam("pictureFile") MultipartFile multi, String oldPicture)
			throws Exception {
		ResponseEntity<String> entity = null;

		String result = "";
		HttpStatus status = null;

		// 파일유무확인
		if ((result = savePicture(oldPicture, multi)) == null) {
			result = "업로드에 실패했습니다.";
			status = HttpStatus.BAD_REQUEST;
		} else {
			status = HttpStatus.OK;
		}

		entity = new ResponseEntity<String>(result, status);

		return entity;
	}

	@RequestMapping("/registForm")
	public String registForm(String error, HttpServletResponse response) {
		String url = "member/registForm.open";

		return url;
	}

	@RequestMapping("/idCheck")
	public ResponseEntity<String> idCheck(String member_id) {
		String result = "";
		HttpStatus status = HttpStatus.OK;

		try {
			MemberVO member = memberService.getMember(member_id);
			if (member != null) {
				result = "duplicated";
			}
		} catch (SQLException e) {
			status = HttpStatus.BAD_REQUEST;
		}
		return new ResponseEntity<String>(result, status);
	}

	@RequestMapping("/emailCheck")
	public ResponseEntity<String> emailCheck(String member_email) {
		String result = "";
		HttpStatus status = HttpStatus.OK;

		try {
			MemberVO member = memberService.getMemberByEmail(member_email);
			if (member != null) {
				result = "duplicated";
			}
		} catch (SQLException e) {
			status = HttpStatus.BAD_REQUEST;
		}
		return new ResponseEntity<String>(result, status);
	}

	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public void RegisterPost(MemberVO member, String[] member_phone, String[] member_email, String[] member_address,
			Model model, HttpServletResponse response, RedirectAttributes rttr, HttpServletRequest request,
			HttpSession session) throws Exception {
		String tempPhone = "";
		String tempAddress = "";
		String tempEmail = "";
		String tempPwd = "";
		// 핸드폰 번호 저장
		tempPhone = member_phone[0] + "-" + member_phone[1] + "-" + member_phone[2];

		// 주소 이어서 저장
		// for(String data : member_address) {
		// //System.out.println(data);
		// tempAddress+=data+" ";
		// }

		// 이메일 주소 형식으로 저장
		tempEmail = member_email[0] + "@" + member_email[1];

		// 비밀번호 암호화
		SecurityUtil scUtil = new SecurityUtil();
		tempPwd = scUtil.encrypt(member.getMember_pwd());

		member.setMember_pwd(tempPwd);
		member.setMember_phone(tempPhone);
		// member.setMember_address(tempAddress);
		member.setMember_email(tempEmail);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String message = "";
		try {
			studentService.registJoinStudent(member);
			memberService.regist(member);

			message = "회원등록이 되었습니다. 이메일 인증 후 사용해주세요.";
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("window.location.href='../common/loginForm';");
			out.println("</script>");
		} catch (SQLException e) {
			e.printStackTrace();
			message = "회원등록이 실패했습니다.";
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("</script>");
		}
		out.close();
	}

	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(MemberVO member, String member_email, Model model) throws Exception { // 이메일인증
		memberService.userAuth(member_email);
		model.addAttribute("member_email", member_email);

		return "/member/success.open";
	}

	@RequestMapping("/getPicture")
	@ResponseBody
	public ResponseEntity<byte[]> getPicture(String member_picture) throws Exception {
		System.out.println("/getPicture : " + member_picture);
		if (member_picture == null) {
			return null;
		}
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.picturePath;
		try {
			// in=new FileInputStream(imgPath+File.separator+picture);
			System.out.println(imgPath + File.separator + member_picture);
			in = new FileInputStream(new File(imgPath, member_picture));

			// IOUtils를 이용하여 사진 파일을 날려보냄
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);

		} catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		return entity;
	}

	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(ModelAndView mnv, String member_id, HttpServletRequest request) throws Exception {

		SecurityUtil scu = new SecurityUtil();
		// MemberVO loginMemberVO = memberService.getMember(member_id);//
		// MemberVO modifyMember = memberService.getMember(member_id);
		MemberVO member = (MemberVO) request.getSession().getAttribute("loginUser");

		mnv.setViewName("/member/modifyForm.page");
		mnv.addObject("dePwd", scu.decrypt(member.getMember_pwd()));

		return mnv;
	}

	@RequestMapping("/modify")
	public void modify(MemberModifyRequest modifyReq, HttpSession session, HttpServletResponse response)
			throws Exception {

		MemberVO member = modifyReq.toParseMember();
		SecurityUtil scu = new SecurityUtil();

		// 암호화
		member.setMember_pwd(scu.encrypt(modifyReq.getMember_pwd()));

		String fileName = savePicture(modifyReq.getOldPicture(), modifyReq.getMember_picture());

		member.setMember_picture(fileName);

		// 사진을 수정하지 않을시에 그전의 사진 파일을 넣어줌
		if (modifyReq.getMember_picture().isEmpty()) {
			member.setMember_picture(modifyReq.getOldPicture());
		}

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		try {

			memberService.modify(member);

			// 로그인한 사용자의 경우 수정된 정보로 session 업로드
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

			if (loginUser != null && member.getMember_id().equals(loginUser.getMember_id())) {
				member.setMember_role(loginUser.getMember_role()); // 수정사항에 없는 권한 set해서 세션 업데이트
				session.setAttribute("loginUser", member);
			}

			out.println("<script>");
			out.println("alert('수정되었습니다.')");
			out.println("location.href='modifyForm';");
			out.println("</script>");
			out.close();

		} catch (SQLException e) {
			e.printStackTrace();

			out.println("<script>");
			out.println("alert('수정에 실패했습니다.')");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
		}
	}

	@RequestMapping("/disable")
	public ModelAndView disable(String member_id, HttpSession session, ModelAndView mnv) throws SQLException {
		MemberVO member = memberService.getMember(member_id);

		if (member.getMember_role().equals("ADMIN")) {
			mnv.setViewName("/member/disableFail.open");
		} else {
			memberService.disabled(member_id);
			session.invalidate();

			mnv.setViewName("/member/disableSuccess.open");
		}
		return mnv;
	}

	@RequestMapping("/status")
	public ModelAndView status(String member_id, HttpSession session, ModelAndView mnv) {
		return mnv;
	}

	// 사진등록 메서드
	private String savePicture(String oldPicture, MultipartFile multi) throws Exception {
		String fileName = null;

		// 파일유무확인
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {

			// 파일저장폴더설정
			String uploadPath = picturePath;
			fileName = UUID.randomUUID().toString().replace("-", "") + ".jpg";
			File storeFile = new File(uploadPath, fileName);

			// local HDD 에 저장
			multi.transferTo(storeFile);

			if (!oldPicture.isEmpty()) {
				File oldFile = new File(uploadPath, oldPicture);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		return fileName;
	}

	@RequestMapping("/list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv, HttpSession session) throws SQLException {

		String url = "member/adminList.page";
		Map<String, Object> dataMap = memberService.getSearchMemberList(cri);

		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/adminDetail")
	public ModelAndView adminDetail(String member_id, ModelAndView mnv) throws Exception {
		MemberVO member = memberService.getMember(member_id);

		SecurityUtil scu = new SecurityUtil();

		String pwd = scu.decrypt(member.getMember_pwd());
		member.setMember_pwd(pwd);

		mnv.addObject("member", member);
		mnv.setViewName("member/adminDetail.open");

		return mnv;
	}

	@RequestMapping("/adminModify")
	public void adminModify(MemberAdminModifyRequest modifyReq, HttpServletResponse response, HttpSession session)
			throws Exception {
		MemberVO member = modifyReq.toParseMember();

		SecurityUtil scu = new SecurityUtil();

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {

			member.setMember_pwd(scu.encrypt(member.getMember_pwd()));

			String fileName = savePicture(modifyReq.getOldPicture(), modifyReq.getMember_picture());

			member.setMember_picture(fileName);

			// 사진을 수정하지 않을시에 그전의 사진 파일을 넣어줌
			if (modifyReq.getMember_picture().isEmpty()) {
				member.setMember_picture(modifyReq.getOldPicture());
			}

			memberService.adminModify(member);

			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			if (loginUser != null && member.getMember_id().equals(loginUser.getMember_id())) {
				member.setMember_role(loginUser.getMember_role()); // 수정사항에 없는 권한 set해서 세션 업데이트
				session.setAttribute("loginUser", member);
			}

			out.println("<script>");
			out.println("alert('수정되었습니다.')");
			out.println("location.href='adminDetail?member_id=" + member.getMember_id() + "';");
			out.println("opener.parent.location.reload(true);");
			out.println("</script>");
			out.close();

		} catch (SQLException e) {
			e.printStackTrace();

			out.println("<script>");
			out.println("alert('수정에 실패했습니다.')");
			out.println("window.close();");
			out.println("</script>");
			out.close();
		}
	}

	@RequestMapping("/adminRegistForm")
	public String adminRegistForm(HttpServletRequest request, ModelAndView mnv) {
		return "/member/adminRegistForm.open";
	}

	@RequestMapping("/adminRegist")
	public void adminRegist(MemberVO member, HttpSession session, ModelAndView mnv, String[] member_phone,
			String[] member_email, String[] member_address, HttpServletResponse response) throws Exception {

		String tempPhone = "";
		String tempAddress = "";
		String tempEmail = "";
		String tempPwd = "";
		// 핸드폰 번호 저장
		tempPhone = member_phone[0] + "-" + member_phone[1] + "-" + member_phone[2];

		// 이메일 주소 형식으로 저장
		tempEmail = member_email[0] + "@" + member_email[1];

		// 비밀번호 암호화
		SecurityUtil scUtil = new SecurityUtil();
		tempPwd = scUtil.encrypt(member.getMember_pwd());

		member.setMember_pwd(tempPwd);
		member.setMember_phone(tempPhone);
		// member.setMember_address(tempAddress);
		member.setMember_email(tempEmail);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String message = "";

		try {
			memberService.adminRegist(member);
			if (member.getMember_role().equals("STUDENT")) {
				studentService.registJoinStudent(member);
			} else {
				professorService.registProfessor(member);
			}

			message = "회원등록이 되었습니다.";
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("opener.parent.location.reload(true);");
			out.println("window.close();");

			out.println("</script>");
		} catch (SQLException e) {
			e.printStackTrace();
			message = "회원등록이 실패했습니다.";
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("</script>");
		}
		out.close();
	}

	@RequestMapping("/remove")
	public ModelAndView remove(String member_id, HttpSession session, ModelAndView mnv) {

		return mnv;
	}

	

}
