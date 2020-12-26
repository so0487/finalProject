package kr.or.ddit.assign.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.assign.dao.AttachToAssignDAO;
import kr.or.ddit.board.dao.AttachDAO;
import kr.or.ddit.dto.AttachToAssignVO;
import kr.or.ddit.dto.AttachVO;

@Controller
@RequestMapping("/assign/attach")
public class AttachToAssignController {
	
	@Autowired
	private AttachToAssignDAO attachToAssignDAO;
	
	@Resource(name="assignFileUploadPath")
	private String assignFileUploadPath;

	@RequestMapping("/getFile")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String attach_no) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		AttachToAssignVO attachToAssign = attachToAssignDAO.selectAttachByAttachNo(attach_no);
		String assignFileUploadPath2 = this.assignFileUploadPath;
		String fileName = attachToAssign.getAttach_name();
		try {
			
			in = new FileInputStream(assignFileUploadPath2 + File.separator + fileName);
			fileName = fileName.substring(fileName.indexOf("$$") + 2);
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition",
					"attachment;filename=\"" + new String(fileName.getBytes("utf-8"), "ISO-8859-1") + "\"");
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		}catch(IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		}finally {
			in.close();
		}
		return entity;
	}

	
}
