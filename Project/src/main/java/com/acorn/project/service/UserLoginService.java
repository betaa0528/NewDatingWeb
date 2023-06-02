package com.acorn.project.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.project.DAO.Member_tblDAO;
import com.acorn.project.DTO.MemberDTO;

@Component
public class UserLoginService {
	
	@Autowired
	Member_tblDAO dao;
	
	/*로그인*/
	public MemberDTO check(String member_id) {
		MemberDTO dto = new MemberDTO();
		dto = dao.selectById2(member_id);
		return dto;
	}
	
	public List<String> getLoginList(){
		return null;
	}
	
	
	
	/*아이디 찾기*/
	
	public MemberDTO findId2(String mname, String email) {
		return dao.findId(mname, email);
	}
	
	
	
	
	
	/*비밀번호 찾기*/
	public MemberDTO findPassword2(String member_id, String email) {
		return dao.findPassword(member_id, email);
	}
	
	
	
	
	
	/*마이페이지 수정*/
	public void updateMember(MemberDTO dto) {
		dao.update(dto);
	}
	
	public MemberDTO getMemberData(String memberId) {
		return dao.getMemberData(memberId);
	}
	
	public String[] getImages(String memberId) {
	    MemberDTO memberData = getMemberData(memberId);
	    String[] images = memberData.getImage().split(",");
	    
	    System.out.println(  Arrays.toString(images));
	    return images;
	}
	
	
	
}