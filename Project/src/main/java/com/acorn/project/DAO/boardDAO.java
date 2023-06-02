package com.acorn.project.DAO;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;

import com.acorn.project.DTO.boardDTO;

@Component
public class boardDAO {

	@Autowired
	DataSource dataSource;

	public List<boardDTO> getBoard() {
		
		String sql = "select * from community";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs =null;
		List<boardDTO> list = new ArrayList<>();
		
		try {
			con = dataSource.getConnection();
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()) {
				String communityId = rs.getString(1);
				String content = rs.getString(2);
				String imgName =  rs.getString(4);
				String createAt = rs.getString(3);
				String memberId = rs.getString(5);
				list.add(new boardDTO(communityId,content,createAt,imgName,memberId));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs,pst,con);
		}
		
		return list;
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

	public void deleteMyBoard(String writerId) {
		String sql = "delete from community where member_id = ? ";
		
		
		try {
			Connection con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, writerId);
			pst.executeUpdate();
			
			close(pst, con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void createBoard(String rownum, String boardText,String imgName ,String memberId,String createAt) {
		String sql = "insert into community values(?,?,?,?,?) ";
		boardDAO dao = new boardDAO();

	
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs =null;
		try {
			con = dataSource.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, "c"+rownum);
			pst.setString(2, boardText);
			pst.setString(3, createAt);
			pst.setString(4, imgName);
			pst.setString(5, memberId);
			pst.executeUpdate();
			
			close(pst,con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	// 마지막 행번호 불러오기
	public String boardRownum() {
		String sql = " select lpad(substr(community_id,2,3)+1, 3,'0') from (select community_id from community order by 1 desc) where rownum=1 ";
		String rownum = null;
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs =null;
		try {
			con= dataSource.getConnection();
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			if(rs.next()) {
				rownum = rs.getString(1);
			}
			return rownum;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rownum;
	}
	
	
	// 오늘 날짜 불러오기
	public String boardDate() {
		String sql = " select to_char(sysdate,'yyyy-mm-dd') from dual ";
		String updateAt = null;
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs =null;
		try {
			con=dataSource.getConnection();
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			if(rs.next()) {
				updateAt = rs.getString(1);
			}
			return updateAt;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return updateAt;
	}

	public ResponseEntity<byte[]> getImageName(String fileName){
		File file = new File("c:\\dating\\upload\\게시판사진\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
}
