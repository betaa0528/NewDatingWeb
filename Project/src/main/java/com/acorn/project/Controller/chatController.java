package com.acorn.project.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.project.service.ChatService;

@Controller
public class chatController {

	@Autowired
	ChatService chatService;
	HttpSession session2;
	String myId;
	
	
	
	
	//추후 session에 저장된 아이디로 교체
	//주의! 시험시 파라미터가 있으므로 http://localhost:8090/project/chatting_room?id1=member001&id2=member002
	// 와 같이 작성해야합니다. (우측에서 채팅 상대를 눌렀을때 정해지는 매핑)
	 @GetMapping( value="/chatting_room" , produces ="test/html;charset=UTF-8" ) 
	 public void chatting_room(Model model,@RequestParam String id) {
		 
		 model.addAttribute("myInfo",chatService.getChatInfo(myId)); //자신의 이미지
		 model.addAttribute("opponentInfo",chatService.getChatInfo(id)); //상대방의 이미지
		 model.addAttribute("chatRecord",chatService.selectById2(myId,id)); //상대방의 이미지
		 model.addAttribute("opponentsInfo",chatService.getChatInfo2(myId)); 
	 }
	 //초기화면, 입장시 세션에 저장되어있는 id가 들어가도록 연결시키면 됩니다.
	 // 시험시 다음 값을 입력: http://localhost:8090/project/chatting_room2?id1=member001
	 @GetMapping( value="/chatting_room2" , produces ="test/html;charset=UTF-8" ) 
	 public void chatting_room(Model model, HttpServletRequest request) {
		 session2 = request.getSession();
		 myId = (String) session2.getAttribute("sessionId");
	
		 model.addAttribute("myInfo",chatService.getChatInfo(myId)); //자신의 이미지
		 model.addAttribute("opponentsInfo",chatService.getChatInfo2(myId)); 
	 }
	 
	 
	 @PostMapping("/insert")
	 @ResponseBody 
	 public void insertChat(@RequestParam String info1,@RequestParam String info2,@RequestParam String info3  ) {
		 System.out.println(info1+" "+info2+" "+info3);
	     chatService.insertChat(new String[] {info1,info2,info3});

	 }
    	
}
