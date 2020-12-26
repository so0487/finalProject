package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProfessorVO;
import kr.or.ddit.member.dao.ProfessorDAO;
import kr.or.ddit.request.SearchCriteria;

public class ProfessorServiceImpl implements ProfessorService {
	private ProfessorDAO professorDAO;

	public void setProfessorDAO(ProfessorDAO professorDAO) {
		this.professorDAO = professorDAO;
	}

	@Override
	public List<ProfessorVO> getProfessorList(SearchCriteria cri) throws SQLException {
		List<ProfessorVO> proList = professorDAO.selectProfessorList(new SearchCriteria());
		return proList;
	}

	@Override
	public ProfessorVO getProfessorById(String professor_id) throws SQLException {
		ProfessorVO professor = professorDAO.selectProfessorById(professor_id);
		return professor;
	}

	@Override
	public void registProfessor(MemberVO member) throws SQLException {
		professorDAO.insertProfessor(member);		
	}

	@Override
	public void modifyProfessor(ProfessorVO professor) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeProfessor(ProfessorVO professor) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void registProSub(ProfessorVO professor) throws SQLException {
		professorDAO.updateProSub(professor);
		
	}

	@Override
	public List<ProfessorVO> getProfessorBySub(String subject_no) throws SQLException {
		return professorDAO.selectProfessorBySub(subject_no);
	}


	@Override
	public List<ProfessorVO> getProAdminByMorning(Map<String, String> param) throws SQLException {
		return professorDAO.selectProAdminByMorning(param);
	}

	@Override
	public List<ProfessorVO> getProAdminByAfternoon(Map<String, String> param) throws SQLException {
		return professorDAO.selectProAdminByAfternoon(param);
	}
	
}
