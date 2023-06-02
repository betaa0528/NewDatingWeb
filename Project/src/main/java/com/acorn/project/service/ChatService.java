package com.acorn.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.project.DAO.Member_tblDAO;
import com.acorn.project.DAO.chatDAO;

@Component
public class ChatService {
	
	@Autowired
	chatDAO chatDao;
	@Autowired
	Member_tblDAO member_tblDAO;
	
	public String[] getChatInfo(String id){
		
		String[] infos= new String[3];
		
		String imgs= member_tblDAO.selectById(id)[12];
		String img= "/project/resources/images/"+imgs.split(",")[0].trim();
		
		String name= member_tblDAO.selectById(id)[1];
				
		infos[0] = id;
		infos[1] = img;
		infos[2] = name;
		
		return infos;
	}
	
	public ArrayList<String[]> selectById2(String id1,String id2){
		return chatDao.selectById2(id1, id2);
	}
	
//	public ArrayList<String[]> getChatInfo2(String id){
//		ArrayList<String[]> members= member_tblDAO.select();
//		ArrayList<String[]> chats= chatDao.select(id);
//		ArrayList<String[]> membersInfos= new ArrayList<String[]>();		
//		
//		for(String[] m:members) {
//			if(!m[0].equals(id)) {
//				
//				String[] infos= new String[3];
//				
//				String imgs= m[12];
//				String img= "/project/resources/images/"+imgs.split(",")[0].trim();
//				
//				String name= m[1];
//				
//				String last_msg= m[7];
//				
//				infos[0] = img;
//				infos[1] = name;
//				infos[2] = last_msg;
//				
//				membersInfos.add(infos);
//			}
//		}
//		return membersInfos;
//	}
	
	public ArrayList<String[]> getChatInfo2(String id){
		ArrayList<String[]> members= member_tblDAO.select();
		ArrayList<String[]> chats= chatDao.select(id);
		ArrayList<String[]> membersInfos= new ArrayList<String[]>();		
		
		for(String[] chat:chats) {
			boolean flag= true;
			for(String[] mi: membersInfos) {
				if(((mi[0].equals(chat[1]) && mi[1].equals(chat[4])) ||
						(mi[0].equals(chat[4]) && mi[1].equals(chat[1])))) {
					flag= false;
				}
			}
			if(flag) {
				if(chat[1].equals(id)) {
					for(String[] m:members) {
						if(chat[4].equals(m[0])) {
							String imgs= m[12];
							String img= "/project/resources/images/"+imgs.split(",")[0].trim();
							membersInfos.add(new String[]{chat[1],chat[4],chat[2],m[1],img});
						}
					}
				}else if(chat[4].equals(id)) {
					for(String[] m:members) {
						if(chat[1].equals(m[0])) {
							String imgs= m[12];
							String img= "/project/resources/images/"+imgs.split(",")[0].trim();
							membersInfos.add(new String[]{chat[4],chat[1],chat[2],m[1],img});
						}
					}
				}
			}
			
			
		}
		return membersInfos;
	}
	
	public void insertChat(String[] chat){
		chatDao.Insert(chat);
	}
}
