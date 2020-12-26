package kr.or.ddit.classes.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.classes.dao.CurriculumDAO;
import kr.or.ddit.dto.CurriculumVO;
import kr.or.ddit.request.PageMaker;
import kr.or.ddit.request.SearchCriteria;

public class CurriculumServiceImpl implements CurriculumService {
	private CurriculumDAO curriculumDAO;

	public void setCurriculumDAO(CurriculumDAO curriculumDAO) {
		this.curriculumDAO = curriculumDAO;
	}

	@Override
	public Map<String, Object> getCurriculumList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<CurriculumVO> curriculumList = curriculumDAO.selectSearchCurriculumList(cri);
		
		int totalCount=curriculumDAO.selectSearchCurriculumListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("curriculumList", curriculumList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public CurriculumVO getCurriculumByNo(String curriculum_no) throws SQLException {
		CurriculumVO curriculum = curriculumDAO.selectCurriculumByNo(curriculum_no);
		return curriculum;
	}

	@Override
	public void registCurriculum(CurriculumVO curriculum) throws SQLException {
		curriculumDAO.insertCurriculum(curriculum);
		
	}

	@Override
	public void modifyCurriculum(CurriculumVO curriculum) throws SQLException {
		curriculumDAO.updateCurriculum(curriculum);
		
	}

	@Override
	public void removeCurriculum(CurriculumVO curriculum) throws SQLException {
		curriculumDAO.deleteCurriculum(curriculum);
		
	}

	@Override
	public String getCurriculumNo() throws SQLException {
		
		return curriculumDAO.selectCurriculumNo();
	}
	
}
