package com.acorn.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.acorn.project.DAO.boardDAO;
import com.acorn.project.DTO.boardDTO;

@Component
public class boardService {

	@Autowired
	boardDAO dao;

	public void setDao(boardDAO dao) {
		this.dao = dao;
	}
	
	public List<boardDTO> showBoard(){
		List<boardDTO> list = dao.getBoard();
		return list;
	}

	public void deleteBoard(String writerId) {
		dao.deleteMyBoard(writerId);
	}
	
	public String getRownum() {
//		System.out.println("??");
		String rownum = dao.boardRownum(); 
		return rownum;
	}
	
	public String getUpdateAt() {
		String updateAt = dao.boardDate();
		return updateAt;
	}
	
	public void createBoard(String rownum, String boardText, String imgName,String memberId , String updateAt) {
		dao.createBoard(rownum, boardText,imgName ,memberId,updateAt);
	}

	public ResponseEntity<byte[]> getImage(String imgName) {
		return dao.getImageName(imgName);
		
	}
		
}
