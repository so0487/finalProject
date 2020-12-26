package kr.or.ddit.classes.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.classes.dao.ClassDAO;
import kr.or.ddit.classes.dao.ClassStudentListDAO;
import kr.or.ddit.dto.CslVO;

public class ClassStudentListServiceImpl implements ClassStudentListService {
	private ClassStudentListDAO classStudentListDAO;

	public void setClassStudentListDAO(ClassStudentListDAO classStudentListDAO) {
		this.classStudentListDAO = classStudentListDAO;
	}
	
	private ClassDAO classDAO;

	public void setClassDAO(ClassDAO classDAO) {
		this.classDAO = classDAO;
	}

	@Override
	public List<CslVO> getClassStudentListList() throws SQLException {
		
		List<CslVO> cslList = classStudentListDAO.selectClassStudentListList();
		
		return cslList;
	}

	@Override
	public CslVO getClassStudentListByNo(String class_student_list) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registClassStudentList(CslVO csl) throws SQLException {
		classStudentListDAO.insertClassStudentList(csl);
		classDAO.updateClassRealCnt(csl.getClass_no());
	}

	@Override
	public void modifyClassStudentList(CslVO csl) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeClassStudentList(CslVO csl) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getClsNo() throws SQLException {
		String classStudentList_no = classStudentListDAO.selectClsNo();
		return classStudentList_no;
	}

	@Override
	public List<CslVO> getClassStudentListListByClass_no(String class_no) throws SQLException {
		List<CslVO> cslList = classStudentListDAO.selectClassStudentListListByClass_no(class_no);
		return cslList;
	}

	@Override
	public List<CslVO> getCslListByStudent_id(String member_id) throws SQLException {
		List<CslVO> cslList = classStudentListDAO.selectCslListByStudent_id(member_id);
		return cslList;
	}

	@Override
	public List<CslVO> getClsListBylecture_no(String lecture_no) throws SQLException {
		List<CslVO> cslList = classStudentListDAO.selectClsListBylecture_no(lecture_no);
		return cslList;
	}

	@Override
	public void modiClsEmpStatus(String classStudentList_no) throws SQLException {
		classStudentListDAO.modiClsEmpStatus(classStudentList_no);
	}


	
}
