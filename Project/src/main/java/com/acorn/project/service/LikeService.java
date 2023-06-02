package com.acorn.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.project.DAO.LikeDAO;

@Component
public class LikeService {
	
	@Autowired
	LikeDAO dao;
	
	public void updateLike(String like_cnt, String member_id) {
		dao.updateLike(like_cnt, member_id);
	}
	public int getLikecnt(String member_id) {
		return dao.getLikecnt(member_id);
	}
}
