package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProfessorVO;
import kr.or.ddit.request.SearchCriteria;

public interface ProfessorDAO {
	List<ProfessorVO> selectProfessorList(SearchCriteria cri) throws SQLException;
	
	ProfessorVO selectProfessorById(String professor_id) throws SQLException;
	
	List<ProfessorVO> selectProfessorBySub(String subject_no) throws SQLException;
	
	void insertProfessor(MemberVO member) throws SQLException;
	
	void updateProfessor(ProfessorVO professor) throws SQLException;
	
	void updateProSub(ProfessorVO professor) throws SQLException;
	
	void deleteProfessor(ProfessorVO professor) throws SQLException;
	
	List<ProfessorVO> selectProAdminByMorning(Map<String, String>param) throws SQLException;
	List<ProfessorVO> selectProAdminByAfternoon(Map<String, String>param) throws SQLException;
}
