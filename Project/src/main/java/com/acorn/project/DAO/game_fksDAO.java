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
public class game_fksDAO {
	
	@Autowired
	DataSource dataSource;
	
	public ArrayList<String[]> select(){
		
		ArrayList<String[]> dto = new ArrayList<String[]>();
		
		String sql = "select * from game_fks";
		
		try {
			Connection con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				String[] temp= new String[2];
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
		System.out.println("dtd :" + dto);
		return dto;
		
	}
	
//	public static void main(String[] args) {
//		Admin_tblDAO  a = new Admin_tblDAO();
//		for(String[] a_ : a.select()) {
//			for(String a__:a_) {
//				System.out.println(a__);
//			}
//		}
//	}	
	
}