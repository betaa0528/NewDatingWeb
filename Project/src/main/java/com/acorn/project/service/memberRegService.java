package com.acorn.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.acorn.project.DAO.memberRegDAO;
import com.acorn.project.DTO.memberRegDTO;

@Component
public class memberRegService {

	@Autowired
	memberRegDAO dao;

	public void setDao(memberRegDAO dao) {
		this.dao = dao;
	}
	
	public int memberIdCheck(String memberId) {
//		dao.memberIdCheck(memberId);
		int result = dao.memberIdCheck(memberId);
		return result;
		
	}

	public void memberJoinService(memberRegDTO dto) {
		dao.memberJoin(dto);
		
	}

	public memberRegDTO authenticate(String memberId, String mpassword) {
		memberRegDTO member = dao.findByMemberId(memberId);
		if( member !=null && member.getMpassword().equals(mpassword)) {
			return member;
		} else {
			return null;
		}
		
	}
	


}
