package com.acorn.project.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.acorn.project.DAO.Admin_tblDAO;

@Controller
public class Adimin_tblController {

	@Autowired
	Admin_tblDAO admin_tbldao;
	
	 @GetMapping( value="/admintest" , produces ="test/html;charset=UTF-8" ) //한글 성정 방법
	 public String showadminList(Model model  ) {
		 ArrayList<String[]> a = new ArrayList<String[]>();
		 a = admin_tbldao.select();
//		 String[] a_ = a.get(0);
		 model.addAttribute("list", a);
		 System.out.println(a);
		 return "testadmin";
		 
	 }
	        
	    	 
	    	
}
