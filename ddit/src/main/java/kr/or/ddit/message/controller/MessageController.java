package kr.or.ddit.message.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import kr.or.ddit.dto.AttachToMessageVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.MessageVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.message.dao.AttachToMessageDAO;
import kr.or.ddit.message.service.MessageService;
import kr.or.ddit.request.RegistMessageRequest;
import kr.or.ddit.request.SearchCriteria;

@Controller
@RequestMapping("/message")
public class MessageController {

	@Autowired
	private MessageService service;
	public void setService(MessageService service) {
		this.service = service;
	}

	@Autowired
	private MemberService memberService;

	@Autowired
	private AttachToMessageDAO attachToMessageDAO;
	public void setAttachToMessageDAO(AttachToMessageDAO attachToMessageDAO) {
		this.attachToMessageDAO = attachToMessageDAO;
	}
	
	@Resource(name = "messagefileUploadPath")
	private String messagefileUploadPath;
	
	
	//메시지 리스트(전체)
	@RequestMapping("/list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv, String member_id, HttpServletRequest request)
			throws SQLException {

		MemberVO member = (MemberVO) request.getSession().getAttribute("loginUser");
		String message_receiver = member.getMember_id();

		String url = "message/receiveMessageList.page";


		Map<String, Object> dataMap = service.receiveMailBox(cri, message_receiver);
		
		
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		

		return mnv;
	}
	
	
	//메시지 세부사항
	@RequestMapping("/detail")
	public ModelAndView detail(String message_no, @ModelAttribute("cri") SearchCriteria cri, ModelAndView mnv)
			throws Exception {
		String url = "message/messageDetail.page";
		
		MessageVO message = service.messageByMessageNo(message_no);
		
		//파일명 재정의
		List<AttachToMessageVO>attachList = message.getAttachList();
		if(attachList!=null) {
			for(AttachToMessageVO attach : attachList) {
				String fileName = attach.getFile_name().split("\\$\\$")[1];	
				attach.setFile_name(fileName);
			}
		}
		mnv.addObject("message", message);
		mnv.setViewName(url);
		
		return mnv;
	}

	//보낸메시지함
	@RequestMapping("/sendMessageBox")
	public ModelAndView sendMessageBox(String member_id, SearchCriteria cri, ModelAndView mnv,
			HttpServletRequest request) throws SQLException {
		MemberVO member = (MemberVO) request.getSession().getAttribute("loginUser");

		String message_sender = member.getMember_id();

		String url = "message/sendMessageList.page";

		Map<String, Object> dataMap = service.sendMailBox(cri, message_sender);

		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);

		return mnv;
	}
	
	
	
	
	
	//메시지 전송
	@RequestMapping(value = "regist", method = RequestMethod.POST, produces = "text/plain;char=utf-8")

	public void regist(RegistMessageRequest registReq, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List<AttachToMessageVO> attachList = saveFile(registReq);
		MessageVO message = registReq.toMessageVO();
		
		String [] receiver;
		receiver = registReq.getMessage_receiver().split(",");
		
		for(int i=0; i<receiver.length;i++) {
			message.setMessage_receiver(receiver[i]);
			message.setAttachList(attachList);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			try {
				service.writeMessage(message);
				
				out.println("<script>");
				out.println("alert('전송되었습니다.');");
				out.println("window.close()");
				out.println("opener.parent.location.href='"+request.getContextPath()+"/message/sendMessageBox';");
				out.println("</script>");
				out.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("메시지 전송에 실패하였습니다.");
			}
		}
		
		
	}
	
	
	//첨부파일 저장
	private List<AttachToMessageVO> saveFile(RegistMessageRequest registReq) throws Exception {
		String messagefileUploadPath = this.messagefileUploadPath;

		List<AttachToMessageVO> attachList = new ArrayList<AttachToMessageVO>();

		if (registReq.getUploadFile() != null) {
			for (MultipartFile multi : registReq.getUploadFile()) {
				String fileName = UUID.randomUUID().toString().replace("-", "") + "$$" + multi.getOriginalFilename();
				File target = new File(messagefileUploadPath, fileName);

				if (!target.exists()) {
					target.mkdirs();
				}
				multi.transferTo(target);

				AttachToMessageVO attach = new AttachToMessageVO();

				attach.setUpload_path(messagefileUploadPath);
				attach.setFile_name(fileName);
				attach.setFile_type(fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase());

				attachList.add(attach);
			}

		}
		return attachList;
	}
	
	
	//읽지 않은 메시지
	@RequestMapping("/notReadMessage")
	public ModelAndView notReadMessage(SearchCriteria cri, ModelAndView mnv, String member_id,
			HttpServletRequest request) throws SQLException {
		MemberVO member = (MemberVO) request.getSession().getAttribute("loginUser");

		String message_receiver = member.getMember_id();

		String url = "message/notReadMessage.page";

		Map<String, Object> dataMap = service.receiveMailBox(cri, message_receiver);

		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);

		return mnv;
	}
	
	
	//관리자추가 모달
	@RequestMapping("/member/admin")
	public ModelAndView adminLlist(SearchCriteria cri, ModelAndView mnv, HttpSession session, String member_role, HttpServletRequest request) throws SQLException {
		
		
		String url = "message/adminSelectModal.open";
		
		Map<String, Object>dataMap = new HashMap<String, Object>();
		Map<String, Object>adminListMap = service.adminList(cri);
		
		dataMap.put("adminListMap", adminListMap);
		dataMap.put("dataMap", dataMap);
		
		adminListMap.put("adminListMap", adminListMap);
		
		System.out.println(adminListMap);
		System.out.println("datamap : "+dataMap);

		
		
		mnv.addAllObjects(adminListMap);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);		

		
		return mnv;
	}
	
	
	//교수추가 모달
	@RequestMapping("/member/professor")
	public ModelAndView professorLlist(SearchCriteria cri, ModelAndView mnv, HttpSession session, String member_role, HttpServletRequest request) throws SQLException {
		
		
		String url = "message/professorSelectModal.open";
		
		Map<String, Object>dataMap = new HashMap<String, Object>();
		Map<String, Object>professorListMap = service.professorList(cri);
		
		dataMap.put("professorListMap", professorListMap);
		dataMap.put("dataMap", dataMap);
		
		
		System.out.println(professorListMap);
		System.out.println("datamap : "+dataMap);

		
		
		mnv.addAllObjects(professorListMap);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);		

		
		return mnv;
	}
	
	
	
	//학생추가 모달
	@RequestMapping("/member/student")
	public ModelAndView studentLlist(SearchCriteria cri, ModelAndView mnv, HttpSession session, String member_role, HttpServletRequest request) throws SQLException {
		
		
		String url = "message/studentSelectModal.open";
		
		
		Map<String, Object>dataMap = new HashMap<String, Object>();
		Map<String, Object>studentMap = service.studentList(cri);
		
		dataMap.put("studentMap", studentMap);
		
		
		System.out.println(studentMap);
		System.out.println("datamap : "+dataMap);

		
		
		mnv.addAllObjects(studentMap);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);		

		
		return mnv;
	}
	
	
	
	
	
	
	
	
	//삭제 메시지함
	@RequestMapping("/deleteMessageBox")
	public ModelAndView deleteMessageBox(SearchCriteria cri, ModelAndView mnv, String member_id,
			HttpServletRequest request) throws SQLException {
		MemberVO member = (MemberVO) request.getSession().getAttribute("loginUser");
		String url = "message/deleteMessageBox.page";

		Map<String, Object> dataMap = service.allMessageList(cri);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	
	
	//수신 메시지 개별 삭제
	@RequestMapping("/removeReceiveMessage_one")
	public void removeReceiveMessage(MessageVO message, HttpServletResponse response, HttpServletRequest request, String message_no)
			throws Exception {
		
		
		
		String messagefileUploadPath = this.messagefileUploadPath;
		
		List<AttachToMessageVO> attachList = attachToMessageDAO.selectAttachByMessageNo(message_no);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		try {
			service.deleteReceiveMailBox(message);

			if (attachList != null) {
				for (AttachToMessageVO attach : attachList) {
					File target = new File(attach.getUpload_path(), attach.getFile_name());
					if (target.exists()) {
						target.delete();
					}
				}
			}
			out.println("<script>");
			out.println("alert('삭제되었습니다.')");
			out.println("location.href='" + request.getContextPath() + "/message/list'");
			
			
			out.println("</script>");
		} catch (SQLException e) {
			out.println("<script>");
			out.println("alert('삭제가 실패했습니다.');");
			out.println("history.go(-1)");
			out.println("</script>");
		}
	}

	
	
	//수신 메시지 다중 삭제
	@RequestMapping(value="/removeReceiveMessage", method = RequestMethod.POST)
	public void removeReceiveMessage(MessageVO message, HttpServletResponse response, @RequestParam(value="valueArrTest[]")String[]chkArray, ModelAndView mnv, HttpServletRequest request, String message_no) throws SQLException, IOException{

		for(int i=0; i<chkArray.length; i++) {
			
			
			message_no = chkArray[i];
			message.setMessage_no(chkArray[i]);
			
			
			
			
			String messagefileUploadPath = this.messagefileUploadPath;
			
			
			List<AttachToMessageVO> attachList = attachToMessageDAO.selectAttachByMessageNo(message_no);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			try {
				service.deleteReceiveMailBox(message);
				
				if (attachList != null) {
					for (AttachToMessageVO attach : attachList) {
						File target = new File(attach.getUpload_path(), attach.getFile_name());
						if (target.exists()) {
							target.delete();
						}
					}
				}
				out.println("<script>");
				out.println("alert('삭제되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/message/list'");
				
				
				out.println("</script>");
			} catch (SQLException e) {
				out.println("<script>");
				out.println("alert('삭제를 실패했습니다.');");
				out.println("history.go(-1)");
				out.println("</script>");
			}
		}
		
	}
	
	
	
	
	
	//발신메시지 다중 삭제
	@RequestMapping(value="/removeSendMessage", method = RequestMethod.POST)
	public void removeSendMessage(MessageVO message, HttpServletResponse response, @RequestParam(value="valueArrTest[]")String[]chkArray, ModelAndView mnv, HttpServletRequest request, String message_no) throws SQLException, IOException{
		
		for(int i=0; i<chkArray.length; i++) {
			
			
			message_no = chkArray[i];
			message.setMessage_no(chkArray[i]);
			
			
			
			
			String messagefileUploadPath = this.messagefileUploadPath;
			
			
			List<AttachToMessageVO> attachList = attachToMessageDAO.selectAttachByMessageNo(message_no);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			try {
				service.deleteSendMailBox(message);
				
				if (attachList != null) {
					for (AttachToMessageVO attach : attachList) {
						File target = new File(attach.getUpload_path(), attach.getFile_name());
						if (target.exists()) {
							target.delete();
						}
					}
				}
				out.println("<script>");
				out.println("alert('삭제되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/message/list'");
				
				
				out.println("</script>");
			} catch (SQLException e) {
				out.println("<script>");
				out.println("alert('삭제를 실패했습니다.');");
				out.println("history.go(-1)");
				out.println("</script>");
			}
		}
		
	}
	
	
	
	//발신메시지 개별 삭제
	@RequestMapping("removeSendMessage_one")
	public void removeSendMessage(MessageVO message, HttpServletResponse response, HttpServletRequest request, String message_no)
			throws Exception {
		String messagefileUploadPath = this.messagefileUploadPath;

		List<AttachToMessageVO> attachList = attachToMessageDAO.selectAttachByMessageNo(message_no);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		try {
			service.deleteSendMailBox(message);

			if (attachList != null) {
				for (AttachToMessageVO attach : attachList) {
					File target = new File(attach.getUpload_path(), attach.getFile_name());
					if (target.exists()) {
						target.delete();
					}
				}
			}
			out.println("<script>");
			out.println("alert('삭제되었습니다.')");
			out.println("location.href='" + request.getContextPath() + "/message/sendMessageBox'");
			out.println("</script>");
		} catch (SQLException e) {
			out.println("<script>");
			out.println("alert('삭제를 실패했습니다.');");
			out.println("history.go(-1)");
			out.println("</script>");
		}
	}
	
	
	

	
	//메시지 전송 화면
	@RequestMapping("/sendMessageForm")
	public String sendMessageForm(ModelAndView mnv) throws SQLException{
		String url = "message/sendMessageForm.open";
		
		return url;		
	}
	
	//메시지 상태체크
	@RequestMapping("/newMessageCheck")
	public ResponseEntity<Integer> newMessageCheck(HttpServletRequest request, SearchCriteria cri) throws SQLException{
		MemberVO member = (MemberVO) request.getSession().getAttribute("loginUser");
		String message_receiver = member.getMember_id();
		int messageCount = service.getNotReadMessageCount(message_receiver);
		return new ResponseEntity<Integer>(messageCount, HttpStatus.OK);
	}
	
}
