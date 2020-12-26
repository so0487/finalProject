package kr.or.ddit.message.service;

import java.sql.SQLException;
import java.util.Map;

import javax.naming.directory.SearchResult;

import kr.or.ddit.dto.MessageVO;
import kr.or.ddit.request.SearchCriteria;

public interface MessageService {
	// 전체 메시지 리스트
	Map<String, Object> allMessageList(SearchCriteria cri) throws SQLException;

	// 해당 메시지 리스트
	MessageVO messageByMessageNo(String message_no) throws SQLException;

	// 송신메시지 목록
	Map<String, Object> sendMailBox(SearchCriteria cri, String message_sender) throws SQLException;

	// 발실메시지 목록
	Map<String, Object> receiveMailBox(SearchCriteria cri, String message_receiver) throws SQLException;

	//안 읽은 메시지 목록
	Map<String, Object>notReadMessage(SearchCriteria cri, String message_receiver) throws SQLException;

	//안 읽은 메시지 개수
	int getNotReadMessageCount(String message_receiver) throws SQLException; 
	
	
	//교수리스트
	Map<String, Object>adminList(SearchCriteria cri) throws SQLException;
	
	//교수리스트
	Map<String, Object>professorList(SearchCriteria cri) throws SQLException;
	
	//학생리스트
	Map<String, Object>studentList(SearchCriteria cri)throws SQLException;
	
	
	// 메시지 작성
	void writeMessage(MessageVO message) throws SQLException;

	// 메시지 읽음 처리
	void readMessage(String message_no) throws SQLException;

	// 발신메시지 삭제
	void deleteSendMailBox(MessageVO message) throws SQLException;

	// 수신메시지 삭제
	void deleteReceiveMailBox(MessageVO message) throws SQLException;
	
	
	

}
