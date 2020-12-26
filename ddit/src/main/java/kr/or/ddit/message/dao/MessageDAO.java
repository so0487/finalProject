package kr.or.ddit.message.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.MessageVO;
import kr.or.ddit.request.SearchCriteria;

public interface MessageDAO {
	// 해당 메시지 내용
	MessageVO messageByMessageNo(String message_no) throws SQLException;
	
	
	// 전체 메시지 리스트
	List<MessageVO> allMessageList(SearchCriteria cri) throws SQLException;

	// 메시지 리스트 카운트
	int messageListCount(SearchCriteria cri) throws SQLException;


	// 송신메일함 관리
	List<MessageVO> sendMailBox(SearchCriteria cri, String message_sender) throws SQLException;

	// 송신메일함 카운트
	int sendMailBoxCount(String message_sender, SearchCriteria cri) throws SQLException;

	
	// 수신메일함 관리
	List<MessageVO> receiveMailBox(SearchCriteria cri, String message_receiver) throws SQLException;

	// 수신 메시지함 카운트
	int receiveMailBoxCount(String message_receiver, SearchCriteria cri) throws SQLException;

	// 메시지 작성
	void writeMessage(MessageVO message) throws SQLException;

	// 메시지 읽음 처리
	void readMessage(String message_no) throws SQLException;

	// 발신메시지 삭제
	void deleteSendMailBox(MessageVO message) throws SQLException;

	// 수신메시지 삭제
	void deleteReceiveMailBox(MessageVO message) throws SQLException;

	// 메시지 시퀀스 가져오기
	String getMessageSequenceNextValue() throws SQLException;
	
	
	
	//관리자 리스트
	List<MemberVO>getAdminList(SearchCriteria cri) throws SQLException;
	//관리자 리스트 카운트
	int adminListCount(SearchCriteria cri) throws SQLException;
	
	
	//교수 리스트
	List<MemberVO>getProfessorList(SearchCriteria cri) throws SQLException;
	//관리자 리스트 카운트
	int professorListCount(SearchCriteria cri) throws SQLException;
	
	
	//학생 리스트
	List<MemberVO>getStudentList(SearchCriteria cri) throws SQLException;
	//학생 리스트 카운트
	int studentListCount(SearchCriteria cri) throws SQLException;
	
	
	
	//읽지 않은 메시지함
	List<MessageVO>notReadMessage(SearchCriteria cri, String message_receiver) throws SQLException;
		
	//읽지않은 메시지 카운트
	int notReadMessageCount(String message_receiver) throws SQLException;


}
