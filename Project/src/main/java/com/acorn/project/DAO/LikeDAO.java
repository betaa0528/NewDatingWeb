package com.acorn.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.project.DTO.LikeDTO;

@Component
public class LikeDAO {

	@Autowired
	DataSource ds;
	
	
	public ArrayList<LikeDTO> getList(){
		
		ArrayList<LikeDTO> mlike = new ArrayList<>();
		
		String sql = " select mname, image, like_cnt from Member_tbl";
		
		try {
			Connection con = ds.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			
			while( rs.next()) {
				String mname = rs.getString(1);
				String image = rs.getString(2);
				String like_cnt = rs.getString(3);
				
				LikeDTO like = new LikeDTO(mname,image,like_cnt);
				
				mlike.add(like);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mlike;
	}
	
	
	// update Like 수 증가 
	public void updateLike(String like_cnt, String member_id) {
		
		System.out.println("like_cnt=" + like_cnt);
		
	    String sql = "UPDATE Member_tbl SET like_cnt = ? where member_id = ? ";

	    try {
	        Connection con = ds.getConnection();
	        PreparedStatement pst = con.prepareStatement(sql);

	        int cnt = Integer.parseInt(like_cnt);
	        pst.setInt(1, cnt);
	        pst.setString(2, member_id);
	        
	        pst.executeUpdate();

	        pst.close();
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	// Select Like 수 확인
	public int getLikecnt(String member_id) {
		
		int cnt = 0;

	    String sql = "SELECT like_cnt FROM Member_tbl where member_id = ? ";

	    try {
	        Connection con = ds.getConnection();
	        PreparedStatement pst = con.prepareStatement(sql);
	        pst.setString(1, member_id);
	        ResultSet rs = pst.executeQuery();   
	        
	        if (rs.next()) {
	        	//
	        	System.out.println( rs.getString(1));
	            cnt = Integer.parseInt(rs.getString(1));
	      
	        }

	        rs.close();
	        pst.close();
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return cnt;
	}
	
	
	
	//
	public ArrayList<String> testdata() {
		
	    ArrayList<String> likedata = new ArrayList<>();
	    
	    String sql = "SELECT like_cnt FROM Member_tbl";
	    
	    try {
	        Connection con = ds.getConnection();
	        PreparedStatement pst = con.prepareStatement(sql);
	        ResultSet rs = pst.executeQuery();
	        
	        while (rs.next()) {
	            String mname = rs.getString(1);
	            likedata.add(mname);
	        }
	        
	        rs.close();
	        pst.close();
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return likedata;
	}
	
	
	public static void main(String[] args) {
		
		
	}
}