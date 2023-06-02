package com.acorn.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.project.DAO.Member_tblDAO;

@Component
public class GameService {
	@Autowired
	Member_tblDAO memberDao;
	
	public void updateGamePoint(String id, int score){
		memberDao.updateGamePoint(id, score,memberDao.getGamePoint(id));
	}
	
}
