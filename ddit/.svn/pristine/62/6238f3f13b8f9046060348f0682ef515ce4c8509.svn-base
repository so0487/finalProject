package kr.or.ddit.emprate.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.dto.CurriculumVO;
import kr.or.ddit.emprate.service.EmpRateService;

@Controller
@RequestMapping("/curriculum/emprate")
public class EmpRateController {
	@Autowired
	EmpRateService empRateService;
	
	@RequestMapping("/list")
	public ModelAndView studentEmpRatio(ModelAndView mnv, HttpServletRequest request) {
		
		String url = "emprate/studentEmpRatio.page";
		
		
		try {
			
			
			
			Map<String, Object>curriculumMap = empRateService.curriculumEmpRatio();
			
			
			
			mnv.addAllObjects(curriculumMap);
			
			System.out.println("curriculumMap" + curriculumMap);
			
			mnv.setViewName(url);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return mnv;
	}
	
	
	
	@RequestMapping("/studnetEmp")
	public ResponseEntity<Map<String, Object>>studentEmpRatio(@RequestParam("curri_curriculum_no")String curri_curriculum_no) throws Exception{
		
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object>dataMap = empRateService.studentEmpRatio(curri_curriculum_no);
		
		entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		
		
		System.out.println("entity : "+entity);
		
		return entity;
	}
	
	

}
