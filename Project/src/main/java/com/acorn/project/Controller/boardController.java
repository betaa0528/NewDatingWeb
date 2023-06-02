package com.acorn.project.Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.acorn.project.DTO.boardDTO;
import com.acorn.project.service.boardService;

@Controller
public class boardController {
	
	private static final Logger logger = LoggerFactory.getLogger(boardController.class);

	@Autowired
	boardService service;
	
	@GetMapping("/board")
	public String showBoard(boardDTO dto, Model model, HttpSession session,HttpServletRequest req){
		
		// 세션에서 로그인한 사용자의 정보를 가져옵니다.
        String userId = (String) session.getAttribute("sessionId");
        logger.info("userId" + userId);
        // 게시판 내용 전부 불러옴
        List<boardDTO> list = service.showBoard();
        System.out.println(list);
        
       
        // 자신의 게시물 여부를 확인하여 링크 표시 여부를 결정합니다.
        for (boardDTO board : list) {
            if (board.getMemberId().equals(userId)) {
                board.setShowLinks(true);
            } else {
                board.setShowLinks(false);
            }
        }
        model.addAttribute("boards", list);
//      logger.info("list : " + list);
		return "boardWeb";
		
	}
	

	
	@GetMapping("/board/delete/{memberId}")
	public String deleteBoard(@PathVariable String memberId, HttpSession session) {
		String writerId = (String) session.getAttribute("sessionId");
//		logger.info("wrtieId : " + writerId);
		service.deleteBoard(writerId);
		return "redirect:/board";
		
	}
	
	@GetMapping("/board/create")
	public String createBoard(HttpSession session) {
		String userId = (String) session.getAttribute("sessionId");
//		logger.info("userid : " + userId);
		// 로그인 하지 않으면 로그인 창으로 보냄
		if(userId==null) {
			return "login";
		}
		

		return "createBoard";
	}
	
	@PostMapping("/board/create")
	public String createBoard(@RequestParam(value="boardText") String boardText,
			@RequestParam(value="image", required=false) MultipartFile uploadFile, HttpSession session,
			HttpServletRequest req) {
		//String title = null;
//		logger.info("-----------------------------시작-------------");
		String memberId = (String) session.getAttribute("sessionId");
		String rownum = service.getRownum();
		String updateAt = service.getUpdateAt();
//		logger.info("게시판 작성 내용 :" + boardText);
		String uploadFileName=null;
		
		if(!uploadFile.isEmpty()) {
//			logger.info("uploadBoardPOST..........");
			
			String uploadFolder = "c:/dating/upload";
			
			String imgPath = "게시판사진";
			File uploadPath = new File(uploadFolder, imgPath);
			//String uploadFolder = "resources/image/게시판사진/";
			//String uploadPath = req.getSession().getServletContext().getRealPath(uploadFolder);
			if(!uploadPath.exists()) {
				uploadPath.mkdirs();
			}
			
			
			// 파일이름
			uploadFileName = uploadFile.getOriginalFilename();
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
//			logger.info(uploadFileName + " , " + uploadPath);
//			logger.info("파일 이름 : " + uploadFile.getOriginalFilename());
//			logger.info("파일 타입 : " + uploadFile.getContentType());
//			logger.info("파일 크기 : " + uploadFile.getSize());
//			logger.info("===============================================");
			
			/* 파일 저장*/
			try {
				uploadFile.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			logger.info("uploadfile 없음");
		}
		
		service.createBoard(rownum, boardText, uploadFileName ,memberId, updateAt);
		return "redirect:/board";
	}

}
