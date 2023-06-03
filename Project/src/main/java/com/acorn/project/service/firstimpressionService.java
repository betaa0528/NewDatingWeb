package com.acorn.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.project.DAO.Member_tblDAO;
import com.acorn.project.DAO.firstimpressionDAO;
import com.acorn.project.DTO.firstimpressionChkDTO;
import com.acorn.project.DTO.firstimpressionDTO;

@Component
public class firstimpressionService {
	
	@Autowired
	firstimpressionDAO dao;
	
	@Autowired
	Member_tblDAO memberdao;

	public void setDao(firstimpressionDAO dao) {
		this.dao = dao;
	}
	
	public List<firstimpressionDTO> memberList(String memberid){
		List<firstimpressionDTO> list = dao.getMemberList(memberid);
		return list;
	}
	
	public List<String> otherMembers(String memberId){
		List<String> list = dao.getOtherMembers(memberId);
		return list;
	}
	
	public void firstimpressionUpdate(String memberId, String liketype) {
		dao.firstimpressionUpadate(memberId, liketype);
	}
	
	public void firstimpressionRecord(firstimpressionChkDTO dto) {
		dao.firstimpressionRecord(dto);
	}
	
	public List<String> firstimpressionList(String memberId){
		List<String> list = dao.getfirstimpressionList(memberId);
		return list;
	}

	
	public List<firstimpressionDTO> allMethod(String memberId){
		List<firstimpressionDTO> list = dao.allmethod(memberId);
		return list;
	}
	
	// 
	public ArrayList<String> getMember_info2(String member_id) {
		ArrayList<String> getmember_info2 = memberdao.getMember_info2(member_id);
		return getmember_info2;
	}
	
//	public List<likeDTO> getAllUsers(){
//		List<likeDTO> dto = dao.selectAllUsers();
//		return dto;
//	}
}
