package com.acorn.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.project.DTO.ClickDTO;
import com.acorn.project.DTO.MatchingDTO;


@Component
public class MatchingDAO {

	
	@Autowired
	DataSource ds;
	
	@Autowired
	ClickDAO ck_dao;
	
	
	public String getGender(String member_id) {
		
		String sql = " select gender from Member_tbl where member_id = ? ";
		
		String gender = "";
		
		try {
			Connection con = ds.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, member_id);
			ResultSet rs = pst.executeQuery();
			
			if( rs.next()) {
				gender = rs.getString(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return gender;
	}
	
	
	public ArrayList<ClickDTO> getlist(String gender){
		
		String sql = " select member_id , image from Member_tbl where gender = ? ";
		
		ArrayList<ClickDTO> list = new ArrayList<ClickDTO>();
		
		try {
			Connection con = ds.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, gender);
			ResultSet rs = pst.executeQuery();
			
			while( rs.next()) {	
				
				ClickDTO dto = new ClickDTO(rs.getString(2),rs.getString(1));
				list.add(dto);
				
			}
			con.close();
			pst.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<String> re_mem_list(String sender_member_id) {
		
		String sql = " select receiver_member_id From Match where sender_member_id = ? " ; 
		
		ArrayList<String> re_mem_list = new ArrayList<String>();
		
		
		try {
			Connection con = ds.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, sender_member_id);
			ResultSet rs = pst.executeQuery();
			
			while ( rs.next()) {
				 
				re_mem_list.add(rs.getString(1));				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return re_mem_list;
	}
	
public String getStatus(String id1,String id2) {
		
		String sql = " select matching_status From Match where sender_member_id = ? and receiver_member_id=?" ; 
		String status = "";
		
		try {
			Connection con = ds.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, id1);
			pst.setString(2, id2);
			ResultSet rs = pst.executeQuery();
			
			if ( rs.next()) { 
				status= rs.getString(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
	public ClickDTO getImage(String member_id){
		
		String sql = " select image, member_id from Member_tbl where Member_id = ? ";
		
		ClickDTO list = null;
		
		try {
			Connection con = ds.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, member_id);
			ResultSet rs = pst.executeQuery();
			
			while( rs.next()) {
								
				list = new ClickDTO( rs.getString(1), member_id);

			}
			
			con.close();
			pst.close();
			rs.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	
	}
	
	// 필요없음
//	public void up_match(String matching_id , String matching_status, String receiver_status ) {
//		
//		String sql = " update Matching set matching_status = ? , receiver_status = ? where matching_id = ? " ; 
//		
//		
//		try {
//			Connection con = ds.getConnection();
//			PreparedStatement pst = con.prepareStatement(sql);
//			
//			pst.setString(1, matching_status); 	// 1,2,3 순서는 순서대로다 where 상관 XX
//			pst.setString(2, receiver_status);
//			pst.setString(3, matching_id);
//			
//			pst.executeUpdate();
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	
//	}
	
	// 
	public void insert_match(MatchingDTO dto) {
		
		String sql = " insert into Match values ('Matching'||matching_seq.nextval,?,?,?) ";
		
		try {
			Connection con = ds.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			
			pst.setString(1, dto.getSender_member_id()); // insert,update 무조건 ?의 순서입니다
			pst.setString(2, dto.getReceiver_member_id());
			pst.setString(3, dto.getMatching_status());
			
			pst.executeUpdate();
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
		
	
	
	
	
}
