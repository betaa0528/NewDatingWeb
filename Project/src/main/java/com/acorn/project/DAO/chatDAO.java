package com.acorn.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class chatDAO {
	
	@Autowired
	DataSource dataSource;
	
	public ArrayList<String[]> select(String id){
		ArrayList<String[]> dto = new ArrayList<String[]>();
		String sql = "select * from chat where sender_member_id=? or receiver_member_id=?"
				+ "order by chat_id desc";
		
		try {
			Connection con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, id);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				String[] temp= new String[5];
				for(int i=0;i<temp.length;i++) {
					temp[i]= rs.getString(i+1);
				}
				dto.add(temp);
				
			}
			
			rs.close();
			pst.close();
			con.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return dto;
	}
	
	public ArrayList<String[]> selectById2(String id1, String id2){
		ArrayList<String[]> dto = new ArrayList<String[]>();
		String sql = "select sender_member_id,content,"
				+ "substr(to_char(chat_time,'yyyymmddhhmi'),1,4)||'년'||"
				+ "substr(to_char(chat_time,'yyyymmddhhmi'),5,2)||'월'||"
				+ "substr(to_char(chat_time,'yyyymmddhhmi'),7,2)||'일'||"
				+ "substr(to_char(chat_time,'yyyymmddhhmi'),9,2)||'시'||"
				+ "substr(to_char(chat_time,'yyyymmddhhmi'),11,2)||'분'"
				+ " from chat where (sender_member_id=? and receiver_member_id=?) or "
				+ " (sender_member_id=? and receiver_member_id=?) "
				+ " order by chat_id";
		
		try {
			Connection con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,id1);
			pst.setString(2,id2);
			pst.setString(3,id2);
			pst.setString(4,id1);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				String[] temp= new String[3];
				for(int i=0;i<temp.length;i++) {
					temp[i]= rs.getString(i+1);
				}
				dto.add(temp);
			}
			
			rs.close();
			pst.close();
			con.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return dto;
		
	}
	
	public void Insert(String[] dto){
		String sql = "insert into chat values('chat'||chat_sequence.NEXTVAL,?,?,SYSDATE,?)";
		
		try {
			Connection con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, dto[1]);
			pst.setString(2, dto[0]);
			pst.setString(3, dto[2]);
			
			pst.executeUpdate();
			pst.close();
			con.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	

	
}