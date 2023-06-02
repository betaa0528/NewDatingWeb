package com.acorn.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.project.DAO.ClickDAO;
import com.acorn.project.DAO.MatchingDAO;
import com.acorn.project.DAO.Member_tblDAO;
import com.acorn.project.DTO.ClickDTO;
import com.acorn.project.DTO.MatchingDTO;

@Component
public class MatchingService {

	@Autowired
	MatchingDAO dao;
	
	@Autowired
	ClickDAO ck_dao;
	
	@Autowired
	Member_tblDAO mem_dao;
	
	public String checkgender(String member_id) {
		
		String gender = dao.getGender(member_id);
		
		if( gender.equals("M")) {
			return "F";
		}else {
			return "M";
		}
	}
	
	public ClickDTO no_mat_list(String member_id){
		
		ArrayList<ClickDTO> info = dao.getlist(checkgender(member_id));
		ArrayList<String> info2 = dao.re_mem_list(member_id);
		ArrayList<ClickDTO> indexs= new ArrayList<ClickDTO>();
		
		
		if ( !info2.isEmpty() ) {	// info2에 있는 arraylist가 텅 비어있니? 근데 채워져있음
			
			for( int i=0; i<info.size(); i++) { // 멤버 수만큼 
				
				for( int j=0; j<info2.size(); j++) {  // info2 만큼
					
					if( info.get(i).getMember_id().equals(info2.get(j))) { 
						indexs.add(info.get(i));
						break;
					}
				}
				
			}
		}
		
		for(ClickDTO dto: indexs) {
			info.remove(dto);
		}
		
		for(int a=0; a<info.size();a++) {
			System.out.println(info.get(a).getMember_id());
		}
		
		int randominfo = (int)Math.floor(Math.random()*info.size());
		if(info.size()>0) {
			String receiver_mem_id = info.get(randominfo).getMember_id();
			return dao.getImage(receiver_mem_id);
		}else {
			return null;
		}
		
	}
	
	public void insert_match(MatchingDTO dto) {
		dao.insert_match(dto);
	}
	//
	
	
	// 
	public String getStatus(String id1,String id2) {
		return dao.getStatus(id1, id2);
	}
	
	//
	public ArrayList<String> getMember_info(String member_id) {
		
		ArrayList<String> Match_mem_list = mem_dao.getMember_info(member_id);
		return Match_mem_list;
	}
		
}
