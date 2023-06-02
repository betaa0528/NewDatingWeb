package com.acorn.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.project.DTO.memberRegDTO;


@Component
public class memberRegDAO{

	@Autowired
	DataSource dataSource;
	
	

	public void memberJoin(memberRegDTO dto) {
		String sql = "insert into member_tbl values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement pst = null;
		System.out.println("sql = " + sql);
		
		try {
			con = dataSource.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, dto.getMember_id());
			pst.setString(2, dto.getMname());
			pst.setString(3, dto.getEmail());
			pst.setString(4, dto.getMpassword());
			pst.setInt(5, dto.getAge());
			pst.setString(6, dto.getGender());
			pst.setString(7, dto.getPhone());
			pst.setString(8, dto.getIntroduce());
			pst.setString(9, dto.getGrade());
			pst.setString(10, dto.getMbti());
			pst.setString(11, dto.getReligion());
			pst.setString(12, dto.getJob());
			pst.setString(13, dto.getImage());
			pst.setString(14, dto.getHeight());
			pst.setString(15, dto.getWeight());
			pst.setString(16, dto.getLove_type());
			pst.setString(17, dto.getLike_cnt());
			pst.setString(18, dto.getGame_point());
			pst.setInt(19, 0);
			pst.setInt(20, 0);
			pst.setInt(21, 0);
			pst.setInt(22, 0);
			
			pst.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pst, con);
		}
		

	}
	public int memberIdCheck(String memberId) {
		String sql = " select * from member_tbl where member_id= ? ";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, memberId);
			rs = pst.executeQuery();
			boolean result = rs.next();
			if(result==true) {
				//System.out.println("tlqkf!!");
				return 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pst, con, rs);
		}
		
		return 0;
	}




	private void close(AutoCloseable... autoCloseables) {
		for (AutoCloseable a : autoCloseables) {
			try {
				a.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public memberRegDTO findByMemberId(String memberId) {
	    String sql = "SELECT * FROM member_tbl WHERE member_id = ?";
	    Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, memberId);
			rs = pst.executeQuery();
			if(rs.next()) {
				memberRegDTO member = new memberRegDTO();
				member.setMember_id(rs.getString(1));
				member.setMname(rs.getString(2));
				member.setEmail(rs.getString(3));
				member.setMpassword(rs.getString(4));
				member.setGender(rs.getString(6));
				member.setPhone(rs.getString(7));
				member.setGrade(rs.getString(9));
				member.setImage(rs.getString(13));
				member.setLike_cnt(rs.getString(17));
				member.setGame_point(rs.getString(18));
				return member;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
		
	    
      


	
}
