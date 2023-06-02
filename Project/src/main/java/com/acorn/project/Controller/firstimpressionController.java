package com.acorn.project.Controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.project.DTO.firstimpressionChkDTO;
import com.acorn.project.DTO.firstimpressionDTO;
import com.acorn.project.service.firstimpressionService;

@Controller
public class firstimpressionController {

	
	@Autowired
	firstimpressionService service;
	
	@GetMapping("/firstimpression")
	public String firstimpressionMain(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("sessionId");
		if(memberId==null) {
			return "login";
		}
		List<firstimpressionDTO> list = service.allMethod(memberId);
		model.addAttribute("list", list);
		return "firstimpression";
	}
	
	
	@PostMapping("/firstimpression")
	public String firstimpressionMainPost() {
		
		return "redirect:/firstimpression";
	}
	
	@PostMapping("/firstimpression/firstimpressionUp")
	@ResponseBody
	public void firstimpressionUp(@RequestParam Map<String, Object> firstimpressionResult,HttpSession session) {
		String sendId= (String)session.getAttribute("sessionId");
		String showid = (String) firstimpressionResult.get("showid");
		String firstimpressionType = "like_type" + (String) firstimpressionResult.get("btnVal");
		firstimpressionChkDTO dto = new firstimpressionChkDTO(sendId, showid, (String) firstimpressionResult.get("btnVal"));
		if(showid!=null) {
			service.firstimpressionUpdate(showid, firstimpressionType);
			service.firstimpressionRecord(dto);
		}
		
		
		
	}
	
}
