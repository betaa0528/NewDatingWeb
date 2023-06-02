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





@Component
public class ClickDAO {

	@Autowired
	DataSource ds;
	
	
	// member_id 가져오기
	public ArrayList<String> getIdList () {
		
		String sql = " select member_id from Member_tbl ";
		
		ArrayList<String> member_id = new ArrayList<String>();
		
		try {
			Connection con = ds.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			
			while ( rs.next()) {
				
				System.out.println("DAO에 있는 GetIdList입니다" + rs.getString(1));
				
				member_id.add(rs.getString(1));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member_id;
	}
	
	
	// 랜덤으로 member_id 가져온거 image 가져오기 
	public ClickDTO getImage(String member_id){
		
		System.out.println("왔니?" +  member_id);
		String sql = " select image, member_id from Member_tbl where Member_id = ? ";
		
		ClickDTO list = null;
		
		try {
			Connection con = ds.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, member_id);
			ResultSet rs = pst.executeQuery();
			
			while( rs.next()) {
				
				System.out.println("DAO에서 id값에 따라 image test" + rs.getString(1));
				System.out.println("DAO에서 id값에 따라 image+id test" + rs.getString(2));
				
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
	
	
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
