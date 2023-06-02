package com.acorn.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.project.DTO.firstimpressionChkDTO;
import com.acorn.project.DTO.firstimpressionDTO;

@Component
public class firstimpressionDAO {

	@Autowired
	DataSource ds;
	
	//해당 유저의 정보 불러오기
	public List<firstimpressionDTO> getMemberList(String memberid){
		String sql = " select * from member_tbl where member_id= ?";
		List<firstimpressionDTO> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, memberid);
			rs = pst.executeQuery();
			while(rs.next()) {
				String id = rs.getString(1);
				String introduce =rs.getString("introduce");
				
				String[] imgs = rs.getString("image").split(",");
				String imgName = imgs[0];
				int like1 = rs.getInt("like_type1");
				int like2 = rs.getInt("like_type2");
				int like3 = rs.getInt("like_type3");
				int like4 = rs.getInt("like_type4");
				String gender = rs.getString("gender");
				list.add(new firstimpressionDTO(id,like1,like2,like3,like4,gender, introduce, imgName));
			}
			
			return list;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs, pst,con);
		}
		return list;
		
	}
	
	// 나와 다른 성별의 사람들의 id를 받아 리스트로 불러옴
	public List<String> getOtherMembers(String memberId) {
		String sql = " select * from member_tbl where member_id != ? and gender != (select gender from member_tbl where member_id= ?) ";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<>();
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, memberId);
			pst.setString(2, memberId);
			rs = pst.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			
			
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs, pst,con);
		}
		
		return list;
	}
	
	// 버튼 누르면 좋아요가 올라간다.
	public void firstimpressionUpadate(String memberId, String liketype) {
		String sql = " update member_tbl set " + liketype + " = " + liketype + " + 1 ";
			   sql += " where member_id= ? ";
//		System.out.println(sql);
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, memberId);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	// 버튼을 누르면 내역이 쌓인다
	public void firstimpressionRecord(firstimpressionChkDTO dto) {
		String sql = " insert into likechk values (?,?,?) " ;
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, dto.getSendId());
			pst.setString(2, dto.getReciveId());
			pst.setString(3, dto.getLike_type());
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pst,con);
		}
	}
	
	
	//내가 좋아요를 누른 내역을 볼 수 있다
	public List<String> getfirstimpressionList(String memberId) {
		String sql = " select recieveid from likechk where sendId = ? ";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<String> list =  new ArrayList<>();
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, memberId);
			rs = pst.executeQuery();
			
			
			while(rs.next()) {
				list.add(rs.getString(1));
				
			}
			return list;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs, pst, con);
		}
		
		return list;
		
	}
	
	//합치기
	public List<firstimpressionDTO> allmethod(String memberId) {
		List<String> others =  getOtherMembers(memberId);
		List<String> LikedList = getfirstimpressionList(memberId);
		List<String> showOther = new ArrayList<>();
		List<firstimpressionDTO> showMemberInfo = null;
		if(LikedList ==null) {
			showOther = others;

		} else {
			for(String l : LikedList) {
				if(others.contains(l)) {
					others.remove(l);
				}
			}
			showOther = others;
		}
		
		
		if(!showOther.isEmpty()) {
			int ranNum = (int) (Math.random() * showOther.size());
			String ranMemberId = showOther.get(ranNum);
			showMemberInfo = getMemberList(ranMemberId);
			return showMemberInfo;
		}
		
		
		return showMemberInfo;
	
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
	
	
	
}
