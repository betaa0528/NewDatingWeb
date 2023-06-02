package com.acorn.project.Controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.acorn.project.DTO.memberRegDTO;
import com.acorn.project.service.memberRegService;



@Controller
public class memberJoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(memberJoinController.class);

	@Autowired
	memberRegService service;
	
	@GetMapping("/reg")
	public String regMember() {
		return "reg";
	}
	
	@PostMapping("/reg")
	public String regMember(memberRegDTO dto) {
	
		System.out.println(dto);
		service.memberJoinService(dto);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/reg/memberIdChk", method = { RequestMethod.POST })
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
		//logger.info("들어왔나? " + memberId);
		//System.out.println(memberId);
		int result = service.memberIdCheck(memberId);
		
		if(result == 0) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}	

	} // memberIdChkPOST() 종료	
	
	/* 첨부 파일 업로드 */
	@PostMapping("/reg/uploadAjaxAction")
	public void uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		logger.info("uploadAjaxActionPOST..........");
		String uploadFolder = "C:/dating/upload";
	
		String imgPath = "회원사진";
		File uploadPath = new File(uploadFolder, imgPath);
		
		
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
			
		for(MultipartFile multipartfile : uploadFile) {
			// 파일이름
			String uploadFileName = multipartfile.getOriginalFilename();
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			logger.info(uploadFileName + " , " + uploadPath);
			logger.info("파일 이름 : " + multipartfile.getOriginalFilename());
			logger.info("파일 타입 : " + multipartfile.getContentType());
			logger.info("파일 크기 : " + multipartfile.getSize());
			logger.info("===============================================");
			
			/* 파일 저장*/
			try {
				multipartfile.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
