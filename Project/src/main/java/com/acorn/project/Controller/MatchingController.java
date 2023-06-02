package com.acorn.project.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.project.DTO.ClickDTO;
import com.acorn.project.DTO.MatchingDTO;
import com.acorn.project.service.ChatService;
import com.acorn.project.service.ClickService;
import com.acorn.project.service.LikeService;
import com.acorn.project.service.MatchingService;

@Controller
public class MatchingController {

	
	@Autowired
	MatchingService mt_service;
	
	@Autowired
	ClickService ck_service;
	
	@Autowired
	LikeService likeService;
	
	@Autowired
	ChatService chatService;
	
	HttpSession session;

	
	@GetMapping("/test22")
	public String test(Model model, HttpServletRequest request) {
		
		session= request.getSession();
		String member_id = (String) session.getAttribute("sessionId");

		// 여기입니다 코드 수정한 곳 
		ClickDTO result4 = mt_service.no_mat_list(member_id);
		model.addAttribute("result4" , result4);
		if(result4 !=null) {
			int result1 = likeService.getLikecnt(result4 .getMember_id());
			model.addAttribute("result1" , result1);
			model.addAttribute("result2", result4 .getMember_id());
		}
		
		return "test22";
	}
	
	//, produces = "application/json; charset=UTF-8"
	
	@PostMapping( value="/test1" )
	@ResponseBody
	public ClickDTO A_match(@RequestParam String cnt, @RequestParam String receiver_member_id,
			@RequestParam String matching_status ,HttpServletRequest request ,HttpServletResponse  response) {
		
				
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		 
		session= request.getSession();
		String id = (String) session.getAttribute("sessionId");
		
		
		if(matching_status.equals("Y")) {
			MatchingDTO mDto= new MatchingDTO(null,id,receiver_member_id,matching_status);
			mt_service.insert_match(mDto);
			//이제 상대방도 자신에게 like를 보냈는지 확인해서 매칭을 결정
			if(mt_service.getStatus(receiver_member_id, id).equals("Y")) {
				chatService.insertChat(new String[]{" ",id,receiver_member_id});
			}
			
		}
		likeService.updateLike(cnt, receiver_member_id);
		
		ClickDTO result4 = mt_service.no_mat_list(id);
		
		return result4;
	}
	
}
