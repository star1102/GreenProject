package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RegisterDBBean {

	static RegisterDBBean instance = new RegisterDBBean();
	
	public static RegisterDBBean getInstance(){
		return instance;
	}
	
	private RegisterDBBean(){}
	
	private Connection getConn() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/project_db");
		Connection conn = ds.getConnection();
		return conn;		
	}
	
	public int getMaxNo(){
		int val = 0;
		String sql = "SELECT Max(no) FROM member";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				val = rs.getInt(1);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null)conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return val;
	}
	
	public int checkID(RegisterDataBean bean){
		int val = 0;
		String sql = "SELECT * FROM member where id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1 , bean.getId());
			rs = pstmt.executeQuery();
			if(rs.next()){
				val = 1;	//중복되는 아이디가 검색 된 경우
			}else{
				val = 0;		//중복되는 아이디가 없을 경우
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null)conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return val; 
	}
	
	public int insertMember(RegisterDataBean bean){
		int val = 0;
		String sql = "INSERT INTO member values(?,?,?,?,?,sysdate)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getMaxNo()+1);
			pstmt.setString(2, bean.getId());
			pstmt.setString(3, bean.getPwd());
			pstmt.setString(4, bean.getEmail());
			pstmt.setString(5, bean.getBirth_date());
			val = pstmt.executeUpdate();			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null)conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return val;
	}
}
