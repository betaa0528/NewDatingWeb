package com.acorn.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.project.DAO.ClickDAO;
import com.acorn.project.DTO.ClickDTO;

@Component
public class ClickService {

	@Autowired
	ClickDAO dao;
	
	
	public ClickDTO getIdList () {
		
		ArrayList<String> list = dao.getIdList();

	    int a = (int)Math.floor(Math.random() * list.size()) ;

		return dao.getImage(list.get(a)); 
	    
	}
	
	
	
	
	
	public static void main(String args[]) {
		
		
		
		
	}
}
