package com.acorn.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.project.DTO.MemberDTO;

@Component
public class Member_tblDAO {
	
	@Autowired
	DataSource dataSource;
	
	public ArrayList<String[]> select(){
		ArrayList<String[]> dto = new ArrayList<String[]>();
		
		String sql = "select * from Member_tbl";
		
		try {
			Connection con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				String[] temp= new String[18];
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
	
	public String[] selectById(String id){
		String[] dto = new String[18];
		
		String sql = "select * from Member_tbl where member_id=?";
		
		try {
			Connection con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {

				for(int i=0;i<dto.length;i++) {
					dto[i]= rs.getString(i+1);
				}
				
			}
			
			rs.close();
			pst.close();
			con.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return dto;
		
	}
	
	/*로그인*/
	public MemberDTO selectById2(String member_id) {
		
		MemberDTO dto = new MemberDTO();
		//int i=0;
		
		String sql = " select * from Member_tbl where member_id=?";
		
		try {
			Connection con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			 pst.setString(1, member_id);
			ResultSet rs = pst.executeQuery();
			
			
	        if (rs.next()) { //ResultSet에 다음 행이 있고 반복 횟수(i)가 2 미만인 동안 루프 본문을 실행하여 데이터를 검색하고 dto 배열을 채운다
	        	MemberDTO user = new MemberDTO(); 
	        	
	            user.setMember_id(rs.getString(1));
	           
	            user.setMpassword(rs.getString(4).trim());
	            
	            System.out.println(rs.getString(1) + ", ," + rs.getString(4));
	            dto = user; 
	        }
	        
			rs.close();
			pst.close();
			con.close();
}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
 }
	
	public int getGamePoint(String id){
		
		int score=0;
		
		String sql = "select game_point from Member_tbl where member_id=?";
		try {
			Connection con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, id);
			ResultSet rs= pst.executeQuery();
			
			if(rs.next()) {
				score= Integer.parseInt(rs.getString(1));
			}
			pst.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return score;
	}
	public void updateGamePoint(String id, int score1,int score2){
		String sql = "update Member_tbl set game_point=? where member_id=?";
		try {
			Connection con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, Integer.toString(score1+score2));
			pst.setString(2, id);

			int num = pst.executeUpdate();
			System.out.println(num);
			pst.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public boolean loginCheck(String id, String pw) {
		String sql = "SELECT mpassword FROM Member_tbl WHERE member_id=?";
		
		try (Connection con = dataSource.getConnection();
			 PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
			
			if (rs.next()) {
				String password = rs.getString("mpassword");
				return password.equals(pw);
			}
			
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}

	/*아이디 찾기*/
	public MemberDTO findId(String mname, String email) {
		
		MemberDTO dto = new MemberDTO();
		
		String sql = "select member_id, mname,email from member_tbl where mname=? and email=?";
		
		Connection con;
		try {
			con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			
			pst.setString(1, mname);
			pst.setString(2, email);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				dto.setMember_id(rs.getString(1));
				dto.setMname(rs.getString(2));
				dto.setEmail(rs.getString(3));
				System.out.println(rs.getString(1));
				
			}
			
			rs.close();
			pst.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
		
	  }
	/*비밀번호 찾기*/
	public MemberDTO findPassword(String member_id, String email) {
		MemberDTO dto = new MemberDTO();
		
		String sql = "select mpassword, member_id, email from member_tbl where member_id=? and email=?";
		
		Connection con;
		try {
			con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			
			pst.setString(1, member_id);
			pst.setString(2, email);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				dto.setMpassword(rs.getString(1));
				dto.setMember_id(rs.getString(2));
				dto.setEmail(rs.getString(3));
				
			}
			
			rs.close();
			pst.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
	  }
	
	/*마이페이지 수정*/
	public void update(MemberDTO dto) {
		String sql=" update Member_tbl set mname=?, email=?, mpassword=?, age=?, gender=?, phone=?, introduce=?, grade=?, "
		        + " mbti=?, religion=?, job=?, image=?, height=?, weight=?, love_type=?, like_cnt=?, game_point=? where member_id=? ";
		
		try {
			Connection con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			
			pst.setString(1, dto.getMname()); 
			pst.setString(2, dto.getEmail());
			pst.setString(3, dto.getMpassword());
			pst.setInt(4, dto.getAge());
			pst.setString(5, dto.getGender());
			pst.setString(6, dto.getPhone());
			pst.setString(7, dto.getIntroduce());
			pst.setString(8, dto.getGrade());
			pst.setString(9, dto.getMbti());
			pst.setString(10, dto.getReligion());
			pst.setString(11, dto.getJob());
			pst.setString(12, dto.getImage());
			pst.setString(13, dto.getHeight());
			pst.setString(14, dto.getWeight());
			pst.setString(15, dto.getLove_type());
			pst.setString(16, dto.getLike_cnt());
			pst.setString(17, dto.getGame_point());
			pst.setString(18, dto.getMember_id());
			pst.executeUpdate();
		  } catch(SQLException e) {
			  e.printStackTrace();
		  }
		}
		
	
		
		public MemberDTO getMemberData(String memberId) {

			MemberDTO member = null;
			
			try{
				
			String sql=" select * from Member_tbl where member_id=?";
			
			
				Connection con = dataSource.getConnection();
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, memberId);
				
				ResultSet rs = pst.executeQuery();
				if(rs.next()) {
					
				member = new MemberDTO(
						rs.getString("member_id"),
		                rs.getString("mname"),
		                rs.getString("email"),
		                rs.getString("mpassword"),
		                rs.getInt("age"),
		                rs.getString("gender"),
		                rs.getString("phone"),
		                rs.getString("introduce"),
		                rs.getString("grade"),
		                rs.getString("mbti"),
		                rs.getString("religion"),
		                rs.getString("job"),
		                rs.getString("image"),
		                rs.getString("height"),
		                rs.getString("weight"),
		                rs.getString("love_type"),
		                rs.getString("like_cnt"),
		                rs.getString("game_point")
				);
				}
			  } catch(SQLException e) {
				  e.printStackTrace();
			  }
			return member;
			}
		
		
		
		// matching 에 사람 정보 
		public ArrayList<String> getMember_info(String member_id) {
			
			String sql = " select mname, age, introduce, mbti, religion, job, love_type from Member_tbl where member_id = ? ";
			
			ArrayList<String> getmemlist = new ArrayList<String>();
			
			try {
				Connection con = dataSource.getConnection();
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, member_id);
				ResultSet rs = pst.executeQuery();
				
				if ( rs.next()) {
					
					getmemlist.add(rs.getString(1));
					getmemlist.add(rs.getString(2));
					getmemlist.add(rs.getString(3));
					getmemlist.add(rs.getString(4));
					getmemlist.add(rs.getString(5));
					getmemlist.add(rs.getString(6));
					getmemlist.add(rs.getString(7));
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return getmemlist;
			
		}
		
		// mypage 내정보 
		public ArrayList<String> getMember_info2(String member_id) {
			
			String sql = " select mname, image, like_cnt, game_point from Member_tbl where member_id = ? ";
			
			ArrayList<String> getmemlist2 = new ArrayList<String>();
			
			try {
				Connection con = dataSource.getConnection();
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, member_id);
				ResultSet rs = pst.executeQuery();
				
				if ( rs.next()) {
					
					getmemlist2.add(rs.getString(1));
					getmemlist2.add(rs.getString(2));
					getmemlist2.add(rs.getString(3));
					getmemlist2.add(rs.getString(4));
	
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return getmemlist2;
			
		}
		
	
}
