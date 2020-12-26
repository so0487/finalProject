package kr.or.ddit.message.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.AttachToMessageVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.MessageVO;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.message.dao.AttachToMessageDAO;
import kr.or.ddit.message.dao.MessageDAO;
import kr.or.ddit.request.PageMaker;
import kr.or.ddit.request.SearchCriteria;

public class MessageServiceImpl implements MessageService {
	private MessageDAO messageDAO;

	public void setMessageDAO(MessageDAO messageDAO) {
		this.messageDAO = messageDAO;
	}

	private AttachToMessageDAO attachToMessageDAO;

	public void setAttachToMessageDAO(AttachToMessageDAO attachToMessageDAO) {
		this.attachToMessageDAO = attachToMessageDAO;
	}

	private MemberDAO memberDAO;

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	//전체 메시지 리스트
	@Override
	public Map<String, Object> allMessageList(SearchCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<MessageVO> messageList = messageDAO.allMessageList(cri);

		int totalCount = messageDAO.messageListCount(cri);

		// pageMaker생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("messageList", messageList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;

	}

	
	//메시지 상세 조회
	@Override
	public MessageVO messageByMessageNo(String message_no) throws SQLException {

		MessageVO message = messageDAO.messageByMessageNo(message_no);
		List<AttachToMessageVO> attachList = attachToMessageDAO.selectAttachByMessageNo(message_no);
		message.setAttachList(attachList);
		messageDAO.readMessage(message_no);

		return message;
	}

	
	//보낸 메시지함
	@Override
	public Map<String, Object> sendMailBox(SearchCriteria cri, String message_sender) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<MessageVO> messageList = messageDAO.sendMailBox(cri, message_sender);

		int sendMailBoxCount = messageDAO.sendMailBoxCount(message_sender, cri);

		// pageMaker생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(sendMailBoxCount);

		dataMap.put("messageList", messageList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("message_sender", message_sender);

		return dataMap;
	}
	
	
	
	//받은 메시지함
	@Override
	public Map<String, Object> receiveMailBox(SearchCriteria cri, String message_receiver) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<MessageVO> messageList = messageDAO.receiveMailBox(cri, message_receiver);

		int receiveMailBoxCount = messageDAO.receiveMailBoxCount(message_receiver, cri);

		// pageMaker생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(receiveMailBoxCount);

		dataMap.put("messageList", messageList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("message_receiver", message_receiver);

		return dataMap;
	}

	
	//메시지 작성
	@Override
	public void writeMessage(MessageVO message) throws SQLException {
		String message_no = messageDAO.getMessageSequenceNextValue();
		message.setMessage_no(message_no);
		messageDAO.writeMessage(message);
		for (AttachToMessageVO attach : message.getAttachList()) {
			attach.setMessage_no(message_no);
			attachToMessageDAO.insertAttach(attach);
		}
	}
	
	
	
	//읽지 않은 메시지
	@Override
	public Map<String, Object> notReadMessage(SearchCriteria cri, String message_receiver) throws SQLException {
		Map<String, Object>dataMap = new HashMap<>();
		List<MessageVO>messageList = messageDAO.notReadMessage(cri, message_receiver);
		
		int notReadMessageCount = messageDAO.notReadMessageCount(message_receiver);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notReadMessageCount);
		
		dataMap.put("messageList", messageList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("message_receiver", message_receiver);
		return dataMap;
	}
	

	
	//관리자 리스트
	@Override
	public Map<String, Object> adminList(SearchCriteria cri) throws SQLException {
		Map<String, Object>dataMap = new HashMap<>();

		List<MemberVO>adminList = messageDAO.getAdminList(cri);
		
		int adminListCount = messageDAO.adminListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminListCount);
		
		dataMap.put("adminList", adminList);
		dataMap.put("adminListCount", adminListCount);
		dataMap.put("pageMaker", pageMaker);
		
		
		System.out.println("serviceImplAdmin" + dataMap);
		
		return dataMap;
	}

	//교수 리스트
	@Override
	public Map<String, Object> professorList(SearchCriteria cri) throws SQLException {
		Map<String, Object>dataMap = new HashMap<>();

		List<MemberVO>professorList = messageDAO.getProfessorList(cri);
		
		int professorListCount = messageDAO.professorListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(professorListCount);
		
		dataMap.put("professorList", professorList);
		dataMap.put("professorListCount", professorListCount);
		dataMap.put("pageMaker", pageMaker);
		
		System.out.println("serviceImplPRO" + dataMap);
		
		
		return dataMap;
	}

	
	//학생 리스트
	@Override
	public Map<String, Object> studentList(SearchCriteria cri) throws SQLException {
		Map<String, Object>dataMap = new HashMap<>();

		List<MemberVO>studentList = messageDAO.getStudentList(cri);
		
		int studentListCount = messageDAO.studentListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(studentListCount);
		
		dataMap.put("studentList", studentList);
		dataMap.put("studentListCount", studentListCount);
		dataMap.put("pageMaker", pageMaker);
		
		System.out.println("serviceImplStudent" + dataMap);
		return dataMap;
	}
	
	
	//메시지 조회
	@Override
	public void readMessage(String message_no) throws SQLException {
		messageDAO.readMessage(message_no);
	}
	
	//보낸 메시지 삭제
	@Override
	public void deleteSendMailBox(MessageVO message) throws SQLException {
		messageDAO.deleteSendMailBox(message);
	}

	//받은 메시지 삭제
	@Override
	public void deleteReceiveMailBox(MessageVO message) throws SQLException {
		messageDAO.deleteReceiveMailBox(message);
	}
	
	//읽지 않은 메시지 개수	
	@Override
	public int getNotReadMessageCount(String message_receiver) throws SQLException {
		return messageDAO.notReadMessageCount(message_receiver);		
	}


}
