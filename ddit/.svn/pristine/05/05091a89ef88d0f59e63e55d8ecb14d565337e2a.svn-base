package kr.or.ddit.counsel.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.counsel.dao.CounselDAO;
import kr.or.ddit.dto.CounselVO;
import kr.or.ddit.dto.ReviewVO;
import kr.or.ddit.request.PageMaker;
import kr.or.ddit.request.SearchCriteria;

public class CounselServiceImpl implements CounselService {
	private CounselDAO counselDAO;

	public void setCounselDAO(CounselDAO counselDAO) {
		this.counselDAO = counselDAO;
	}

	@Override
	public Map<String,Object> getCounselList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		int totalCount=counselDAO.selectSearchCounselListCount1(cri);
		List<CounselVO> counselList = counselDAO.selectCounselList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("counselList", counselList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public CounselVO getCounselByNo(String counsel_no) throws SQLException {
		CounselVO counsel = counselDAO.selectCounselByNo(counsel_no);
		return counsel;
	}

	@Override
	public void registCounsel(CounselVO counsel) throws SQLException {
		counselDAO.insertCounsel(counsel);
		
	}

	@Override
	public void modifyCounsel(CounselVO counsel) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeCounsel(CounselVO counsel) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> getCounselListByProfessor(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		int totalCount=counselDAO.selectSearchCounselListCount3(cri);
		List<CounselVO> counselList = counselDAO.selectCounselListByProfessor(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("counselList", counselList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getCouncelListByMember(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		int totalCount=counselDAO.selectSearchCounselListCount2(cri);
		List<CounselVO> counselList = counselDAO.selectCouncelListByMember(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("counselList", counselList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public String getCounselNo() throws SQLException {
		String counsel_no = counselDAO.selectCounselNo();
		return counsel_no;
	}

	@Override
	public void modifyCounselStudent(CounselVO counsel) throws SQLException {
		counselDAO.updateCounselStudent(counsel);
		
	}
	
}
