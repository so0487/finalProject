package kr.or.ddit.message.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.dto.AttachToMessageVO;
import kr.or.ddit.message.dao.AttachToMessageDAO;

@RestController
@RequestMapping("/message/attach")

public class AttachToMessageController {
	@Autowired
	private AttachToMessageDAO attachToMessageDAO;
	public void setAttachToMessageDAO(AttachToMessageDAO attachToMessageDAO) {
		this.attachToMessageDAO = attachToMessageDAO;
	}

	@Resource(name = "messagefileUploadPath")
	private String messagefileUploadPath;

	@RequestMapping("/getFile")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String attach_no) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		AttachToMessageVO attach = attachToMessageDAO.selectAttachByAttachNo(attach_no);
		String messagefileUploadPath = this.messagefileUploadPath;
		String fileName = attach.getFile_name();
		try {
			
			in = new FileInputStream(messagefileUploadPath + File.separator + fileName);
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
