package com.acorn.project.Controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.acorn.project.DTO.MemberDTO;
import com.acorn.project.service.UserLoginService;

@Controller
public class UserLoginController {
	
	@Autowired
	UserLoginService service;
	
	
	/*로그인*/
	@GetMapping("/userLogout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	}
	
	
	@GetMapping("/userLogin")
	public String login() {
		return "login";
	}
	
	@PostMapping("/userLogin")
	public String login(String id, String pw, boolean rememberId, HttpServletRequest request, HttpServletResponse response) {
	

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		//아이디,비번 확인하기
		if(!loginCheck(id, pw)) {
			request.setAttribute("errorMsg", "아이디 또는 비밀번호가 올바르지 않습니다."); 
			return "login";
		}

		
		//정상적으로 로그인 성공
		HttpSession session = request.getSession();
		session.setAttribute("sessionId", id);
		session.setMaxInactiveInterval(-1); 
		
		//아이디 기억
		if(rememberId) {
			
			//쿠키생성
			Cookie cookie = new Cookie("id", id);
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		return "index";
	}
	
	
	private boolean loginCheck(String member_id, String mpassword) {
		
		 MemberDTO result = service.check(member_id);
		 if ( (result.getMpassword() != null) &&  result.getMpassword().equals(mpassword)) {
	        	
	            return true;	        
	    } 
		 return false;	   
	}
	
	
	
	
	
	
	
	
	
	/*아이디 찾기*/
	@GetMapping("/page")
	public String showMemberId() {
		return "findIdPage";
    }
	
	@PostMapping(value="/page")

	public String findMemberId(String myMname, String myEmail, Model model) {
		
		//유효성 검사
		  if (myMname == null || myMname.isEmpty()) {
		        model.addAttribute("error", "이름을 입력해주세요.");
		        return "findIdPage";
		    }

		   if (myEmail == null || myEmail.isEmpty()) {
		        model.addAttribute("error", "이메일을 입력해주세요.");
		        return "findIdPage";
		    }

		   
		   
			MemberDTO resultDto = service.findId2(myMname, myEmail);
		 	
		    if (resultDto.getMname() == null) {
		        model.addAttribute("error", "일치하는 정보가 없습니다.");
		        return "findIdPage";
		    } else if(resultDto.getEmail() == null) {
		    	model.addAttribute("error", "일치하는 정보가 없습니다.");
		    }
		    
		    
		    
		    
		MemberDTO resultDto2 = service.findId2(myMname, myEmail);
		model.addAttribute("dto", resultDto2);

		return "findIdPage2";
	}
	
	
	
	
	
	
	
	
	
	
	/*비밀번호 찾기*/
	@GetMapping("/page2")
	public String showMemberPassword() {
		return "findPasswordPage";
    }
	
	@PostMapping("/page2")
	public String findMemberPassword(String myMember_id, String myEmail2, Model model) {
		
		//유효성 검사
		  if (myMember_id == null || myMember_id.isEmpty()) {
		        model.addAttribute("error", "아이디를 입력해주세요.");
		        return "findPasswordPage";
		    }

		   if (myEmail2 == null || myEmail2.isEmpty()) {
		        model.addAttribute("error", "이메일을 입력해주세요.");
		        return "findPasswordPage";
		    }

		   
		   
			MemberDTO resultDto = service.findPassword2(myMember_id, myEmail2);
		    if (resultDto.getMember_id() == null) {
		        model.addAttribute("error", "일치하는 정보가 없습니다.");
		        return "findPasswordPage";
		    } 

		    
		model.addAttribute("dto", resultDto);
		return "findPasswordPage2";
	}
	
	
	
	
	
	
	
	
	/*마이페이지*/
	//showUpdateForm:회원 정보 수정 폼을 보여주는 GET 요청을 처리
		@GetMapping("/form")   //@RequestParam: HTTP 요청 파라미터를 메서드의 파라미터로 전달받을 떄 사용
		public String showUpdateForm(HttpServletRequest request, Model model) {   //HttpServletRequest: HTTP 요청과 관련된 정보와 기능을 제공하는 객체. 이를 통해 세션 정보를 얻어올 수 있다.
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(-1);
			//logger.info("session :" + memberId);
			
			String memberId = (String)session.getAttribute("sessionId");
			//logger.info("memberId : " + memberId);
			MemberDTO member = service.getMemberData(memberId);
			//logger.info("member :" + member);
			
			/*Model 객체의 addAttribute() 메서드를 사용하여 member 객체를 "member"라는 이름으로 모델에 추가. 
			 * 이렇게 함으로써 뷰에서 해당 정보에 접근할 수 있습니다.*/
			
			// 이미지 출력
			
			
			
			String[] imgs = service.getImages(memberId);
			String[] selectedImage = new String[imgs.length];
			for (int i = 0; i < imgs.length; i++) {
			    selectedImage[i] = imgs[i].trim();
			    //break;
			}
			
			
			model.addAttribute("selectedImage", selectedImage); // 이미지 경로를 모델에 추가

			model.addAttribute("member", member);
			return "update"; // update: 회원 정보 수정을 위한 입력 폼
		}
		
		//processUpdateForm: 회원 정보를 업데이트하는 POST 요청을 처리
		@PostMapping("/form")
		public String processUpdateForm(MemberDTO dto) {
			service.updateMember(dto);
			return "redirect:/form";
			
		}
		
		@GetMapping("/form2")
		public String printImages(Model model) {
		    String[] imgs = service.getImages("member_id");
		    model.addAttribute("member", new MemberDTO()); // MemberDTO 객체 생성 및 모델에 추가
		    model.addAttribute("test", imgs);
		    return "update.jsp";
		}
		
		
		
		/*시작*/
		@GetMapping("/main")
		public String main() {
			return "main";
		}
		
	
}