package kr.or.ddit.message.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.AttachToMessageVO;

public interface AttachToMessageDAO {
	public List<AttachToMessageVO> selectAttachByMessageNo(String message_no) throws SQLException;

	public AttachToMessageVO selectAttachByAttachNo(String attach_no) throws SQLException;

	public void insertAttach(AttachToMessageVO attach) throws SQLException;

	public void deleteAttach(String attach_no) throws SQLException;

	public void deleteAllAttach(String message_no) throws SQLException;
}
