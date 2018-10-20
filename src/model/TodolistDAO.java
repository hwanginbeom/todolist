package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.domain.TodolistDTO;

import util.DButil;

public class TodolistDAO {
	
	
	

	public static ArrayList<TodolistDTO> typeSearchal(String type) throws SQLException {
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select *  from TODOLIST ";
		ArrayList<TodolistDTO> data = new ArrayList<TodolistDTO>();
		try {
			con = DButil.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,type);
			rs =pstmt.executeQuery();
			while(rs.next()) {
				data.add(new TodolistDTO(rs.getInt(1),rs.getString(2),rs.getInt(3)));
			}
		}finally {
			DButil.close(con, pstmt, rs);
		}		
		return data;
		
	}
	
	public ArrayList<TodolistDTO> Wrinte(String id,String title, String day) throws SQLException {
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into TODOLIST (?,?,?)";
		ArrayList<TodolistDTO> data = new ArrayList<TodolistDTO>();
		try {
			con = DButil.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,title);
			pstmt.setString(3,day);

			rs =pstmt.executeQuery();
			while(rs.next()) {
				data.add(new TodolistDTO(rs.getInt(1),rs.getString(2),rs.getInt(3)));
			}
		}finally {
			DButil.close(con, pstmt, rs);
		}		
		return data;
		
	}
	
	
	public ArrayList<TodolistDTO> update(String id,String title, String day) throws SQLException {
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update TODOLIST set TITLE=? , DAY=? where id =? ";
		ArrayList<TodolistDTO> data = new ArrayList<TodolistDTO>();
		try {
			con = DButil.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,title);
			pstmt.setString(3,day);

			rs =pstmt.executeQuery();
			while(rs.next()) {
				data.add(new TodolistDTO(rs.getInt(1),rs.getString(2),rs.getInt(3)));
			}
		}finally {
			DButil.close(con, pstmt, rs);
		}		
		return data;
		
	}
	
	public ArrayList<TodolistDTO> delete(String id) throws SQLException {
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " delete from TODOLIST where id =? ";
		ArrayList<TodolistDTO> data = new ArrayList<TodolistDTO>();
		try {
			con = DButil.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
	
			rs =pstmt.executeQuery();
			while(rs.next()) {
				data.add(new TodolistDTO(rs.getInt(1),rs.getString(2),rs.getInt(3)));
			}
		}finally {
			DButil.close(con, pstmt, rs);
		}		
		return data;
		
	}
}