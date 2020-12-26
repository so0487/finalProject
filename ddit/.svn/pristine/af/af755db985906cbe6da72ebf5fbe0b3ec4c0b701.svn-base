package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProfessorVO;
import kr.or.ddit.request.SearchCriteria;

public interface ProfessorService {
	List<ProfessorVO> getProfessorList(SearchCriteria cri) throws SQLException;
	
	ProfessorVO getProfessorById(String professor_id) throws SQLException;
	
	List<ProfessorVO> getProfessorBySub(String subject_no) throws SQLException;
	
	void registProfessor(MemberVO member) throws SQLException;
	
	void modifyProfessor(ProfessorVO professor) throws SQLException;
	
	void removeProfessor(ProfessorVO professor) throws SQLException;
	
	void registProSub(ProfessorVO professor) throws SQLException;
	
	List<ProfessorVO> getProAdminByMorning(Map<String, String>param) throws SQLException;
	List<ProfessorVO> getProAdminByAfternoon(Map<String, String>param) throws SQLException;
}
