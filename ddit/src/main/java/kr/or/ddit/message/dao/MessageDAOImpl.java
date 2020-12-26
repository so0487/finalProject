package kr.or.ddit.message.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.MessageVO;
import kr.or.ddit.request.SearchCriteria;

public class MessageDAOImpl implements MessageDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//전체 메시지 리스트
	@Override
	public List<MessageVO> allMessageList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		
		List<MessageVO>messageList = sqlSession.selectList("Message-Mapper.allMessageList",cri,rowBounds);
		return messageList;
	}
	
	
	//전체 메시지 리스트 카운트
	@Override
	public int messageListCount(SearchCriteria cri) throws SQLException {

		int count = sqlSession.selectOne("Message-Mapper.messageListCount", cri);
		return count;
	}



	//보낸 메시지
	@Override
	public List<MessageVO> sendMailBox(SearchCriteria cri, String message_sender) throws SQLException {

		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap = new HashMap<>();

		dataMap.put("cri", cri);
		dataMap.put("message_sender", message_sender);

		List<MessageVO> messageList = sqlSession.selectList("Message-Mapper.sendMailBox", dataMap, rowBounds);
		
		return messageList;
	}
	
	
	
	//보낸 메시지 카운트
	@Override
	public int sendMailBoxCount(String message_sender, SearchCriteria cri) throws SQLException {
		Map<String, Object>dataMap = new HashMap<>();
		dataMap.put("page", cri.getPage());
		dataMap.put("perPageNum", cri.getPerPageNum());
		dataMap.put("searchType", cri.getSearchType());
		dataMap.put("keyword", cri.getKeyword());
		dataMap.put("message_sender", message_sender);
		
		int count = (Integer)sqlSession.selectOne("Message-Mapper.sendMailBoxCount",dataMap);
		return count;
	}
	
	
	//받은 메시지
	@Override
	public List<MessageVO> receiveMailBox(SearchCriteria cri, String message_receiver) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap = new HashMap<>();

		
		dataMap.put("page", cri.getPage());
		dataMap.put("perPageNum", cri.getPerPageNum());
		dataMap.put("searchType", cri.getSearchType());
		dataMap.put("keyword", cri.getKeyword());
		dataMap.put("message_receiver", message_receiver);
		
		
		List<MessageVO> messageList = sqlSession.selectList("Message-Mapper.receiveMailBox", dataMap, rowBounds);
		System.out.println("list " + messageList);
		return messageList;
		
		
	}
	
	//받은 메시지 카운트
	@Override
	public int receiveMailBoxCount(String message_receiver, SearchCriteria cri) throws SQLException {
		Map<String, Object>dataMap = new HashMap<>();
		
		dataMap.put("page", cri.getPage());
		dataMap.put("perPageNum", cri.getPerPageNum());
		dataMap.put("searchType", cri.getSearchType());
		dataMap.put("keyword", cri.getKeyword());
		dataMap.put("message_receiver", message_receiver);
		
		
		int count = (Integer)sqlSession.selectOne("Message-Mapper.receiveMailBoxCount",dataMap);
		return count;
	}
	
	
	//읽지 않은 메시지
	@Override
	public List<MessageVO> notReadMessage(SearchCriteria cri, String message_receiver) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap = new HashMap<>();

		
		dataMap.put("page", cri.getPage());
		dataMap.put("perPageNum", cri.getPerPageNum());
		dataMap.put("searchType", cri.getSearchType());
		dataMap.put("keyword", cri.getKeyword());
		dataMap.put("message_receiver", message_receiver);
		
		List<MessageVO> messageList = sqlSession.selectList("Message-Mapper.notReadMessage", dataMap, rowBounds);
		
		
		return messageList;
	}

	
	//읽지 않은 메시지 카운트
	@Override
	public int notReadMessageCount(String message_receiver) throws SQLException {
		int count = sqlSession.selectOne("Message-Mapper.notReadMessageCount", message_receiver);
		return count;
	}
	
	
	
	@Override
	public List<MemberVO> getAdminList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap.put("page", cri.getPage());
		dataMap.put("perPageNum", cri.getPerPageNum());
		dataMap.put("searchType", cri.getSearchType());
		dataMap.put("keyword", cri.getKeyword());
		
		List<MemberVO> getAdminList = sqlSession.selectList("Message-Mapper.getAdminList", dataMap, rowBounds);
		
		return getAdminList;
	}

	@Override
	public int adminListCount(SearchCriteria cri) throws SQLException {
		Map<String, Object>dataMap = new HashMap<>();
		
		dataMap.put("page", cri.getPage());
		dataMap.put("perPageNum", cri.getPerPageNum());
		dataMap.put("searchType", cri.getSearchType());
		dataMap.put("keyword", cri.getKeyword());
		
		
		int count = (Integer)sqlSession.selectOne("Message-Mapper.adminListCount",dataMap);
		return count;
	}

	@Override
	public List<MemberVO> getProfessorList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap.put("page", cri.getPage());
		dataMap.put("perPageNum", cri.getPerPageNum());
		dataMap.put("searchType", cri.getSearchType());
		dataMap.put("keyword", cri.getKeyword());
		
		List<MemberVO> getProfessorList = sqlSession.selectList("Message-Mapper.getProfessorList", dataMap, rowBounds);
		
		return getProfessorList;
	}

	@Override
	public int professorListCount(SearchCriteria cri) throws SQLException {
		Map<String, Object>dataMap = new HashMap<>();
		
		dataMap.put("page", cri.getPage());
		dataMap.put("perPageNum", cri.getPerPageNum());
		dataMap.put("searchType", cri.getSearchType());
		dataMap.put("keyword", cri.getKeyword());
		
		
		int count = (Integer)sqlSession.selectOne("Message-Mapper.professorListCount",dataMap);
		return count;
	}

	@Override
	public List<MemberVO> getStudentList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap.put("page", cri.getPage());
		dataMap.put("perPageNum", cri.getPerPageNum());
		dataMap.put("searchType", cri.getSearchType());
		dataMap.put("keyword", cri.getKeyword());
		
		List<MemberVO> getStudentList = sqlSession.selectList("Message-Mapper.getStudentList", dataMap, rowBounds);
		
		return getStudentList;
	}

	@Override
	public int studentListCount(SearchCriteria cri) throws SQLException {
		Map<String, Object>dataMap = new HashMap<>();
		
		dataMap.put("page", cri.getPage());
		dataMap.put("perPageNum", cri.getPerPageNum());
		dataMap.put("searchType", cri.getSearchType());
		dataMap.put("keyword", cri.getKeyword());
		
		
		int count = (Integer)sqlSession.selectOne("Message-Mapper.studentListCount",dataMap);
		return count;
	}
	
	
	
	
	
	
	//삭제 메시지함
	@Override
	public void deleteReceiveMailBox(MessageVO message) throws SQLException {
		sqlSession.update("Message-Mapper.deleteReceiveMailBox", message);
	}
	
	//메시지 detail
	@Override
	public MessageVO messageByMessageNo(String message_no) throws SQLException {

		MessageVO message = sqlSession.selectOne("Message-Mapper.messageByMessageNo", message_no);
		return message;
	}
	
	
	//메시지 작성
	@Override
	public void writeMessage(MessageVO message) throws SQLException {
		sqlSession.update("Message-Mapper.writeMessage", message);
	}

	//메시지 읽기
	@Override
	public void readMessage(String message_no) throws SQLException {
		sqlSession.update("Message-Mapper.readMessage", message_no);
	}

	//메시지 삭제
	@Override
	public void deleteSendMailBox(MessageVO message) throws SQLException {
		sqlSession.update("Message-Mapper.deleteSendMailBox", message);
	}


	//메시지 시퀀스 찾기
	@Override
	public String getMessageSequenceNextValue() throws SQLException {
		String seq_num = sqlSession.selectOne("Message-Mapper.getMessageSequenceNextValue");
		return seq_num;
	}

	
	

}
