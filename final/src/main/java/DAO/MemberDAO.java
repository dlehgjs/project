package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import DBcon.DBcon;
import DTO.Memberbean;



public class MemberDAO {

	public int getListCount(String search) {
		
		Connection con = null;

		ResultSet rs = null;

		PreparedStatement pstmt = null;

		int cnt=0;
		
		try {
			
			con = DBcon.getConnection();
			
			String sql = null;
			
			if(search == null) {

				sql = " SELECT COUNT(mem_num) FROM member ";

				}else {

				sql = " SELECT COUNT(mem_num) FROM member WHERE mem_name LIKE '%"+search+"%' "; 

				}
				
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			if(rs.next()){

				cnt = rs.getInt(1);

			}
			
			System.out.println("member 데이터 삭제가 "+rs+" 성공했습니다.");
		} catch (SQLException ex) {
			System.out.println("member 데이터 삭제가 실패했습니다.<br>");
			System.out.println("SQLException: " + ex.getMessage());
		}catch(ClassNotFoundException cnfe){
			System.out.println("DBConnection:ClassNotFoundException");
			throw new RuntimeException(cnfe.getMessage());
		}
		 finally {
				
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( con != null ){ con.close(); con=null;	}
			}catch(Exception e){
				System.out.println("SQLException: " + e.getMessage());
				throw new RuntimeException(e.getMessage());
			}
		
		 }
		
		return cnt;
	}
	
	public ArrayList<Memberbean> selectMember(int pageNum, int limit, String search){
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<Memberbean> list = new ArrayList<Memberbean>();
		
		try {
			
			int total_record = getListCount(search);
			
			int start = (pageNum - 1) * limit;

			int index = start + 1;

			con = DBcon.getConnection();
			String sql = null;
			
			if(search != null && search !=""){
				
				sql = "select * from member where mem_name LIKE '%"+search+"%'";
				
			}
			else{

				sql = "select * from member ";	
				
			}

			pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = pstmt.executeQuery(sql);
			
			
			while(rs.absolute(index)) { // 행단위로 읽어옴
				// bean 객체에 할당
				
				Memberbean mbean = new Memberbean();
				mbean.setMem_num(rs.getInt("mem_num"));
				mbean.setMem_id(rs.getString("mem_id"));
				mbean.setMem_pwd(rs.getString("mem_pwd"));
				mbean.setMem_name(rs.getString("mem_name"));
				mbean.setMem_phoneNum(rs.getString("mem_phoneNum"));
				mbean.setMem_postCode(rs.getString("mem_postCode"));
				mbean.setMem_addr(rs.getString("mem_addr"));
				mbean.setMem_detailaddr(rs.getString("mem_detailaddr"));
				mbean.setMem_mdate(rs.getString("mem_mdate"));
				
				list.add(mbean);
				
				if (index < (start + limit) && index <= total_record) {

					index++;
				}
					else {
					break;
				}
			}

		} catch (SQLException ex) {
			System.out.println("userTbl 조회가 실패했습니다.");
			System.out.println("SQLException: " + ex.getMessage());
			throw new RuntimeException(ex.getMessage());
		} catch(ClassNotFoundException cnfe){
			System.out.println("DBConnection:ClassNotFoundException");
			throw new RuntimeException(cnfe.getMessage());
		} finally {
			
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( con != null ){ con.close(); con=null;	}
			}catch(Exception e){
				System.out.println("SQLException: " + e.getMessage());
				throw new RuntimeException(e.getMessage());
			}
			
		}
		
		return list;

	}
		
	public int deleteUser(String mem_num){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int rs = 0;
		
		try {
			
			con = DBcon.getConnection();
			
			String sql = "DELETE FROM member where mem_num ='"+mem_num+"'";
			
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeUpdate();
			
			System.out.println("member 데이터 삭제가 "+rs+" 성공했습니다.");
		} catch (SQLException ex) {
			System.out.println("member 데이터 삭제가 실패했습니다.<br>");
			System.out.println("SQLException: " + ex.getMessage());
		}catch(ClassNotFoundException cnfe){
			System.out.println("DBConnection:ClassNotFoundException");
			throw new RuntimeException(cnfe.getMessage());
		}
		 finally {
				
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( con != null ){ con.close(); con=null;	}
			}catch(Exception e){
				System.out.println("SQLException: " + e.getMessage());
				throw new RuntimeException(e.getMessage());
			}
		
		 }
		
		return rs;
		
		}
	
	public int insertUser(Memberbean mbean) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int rs = 0;

		try {
			con = DBcon.getConnection();
			
			String sql = "INSERT INTO member(mem_id, mem_pwd, mem_name, mem_phoneNum, mem_postCode, mem_addr, mem_detailaddr, mem_mdate) VALUES(?,?,?,?,?,?,?,NOW())";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mbean.getMem_id());
			pstmt.setString(2, mbean.getMem_pwd());
			pstmt.setString(3, mbean.getMem_name());
			pstmt.setString(4, mbean.getMem_phoneNum());
			pstmt.setString(5, mbean.getMem_postCode());
			pstmt.setString(6, mbean.getMem_addr());
			pstmt.setString(7, mbean.getMem_detailaddr());
			
			
			rs = pstmt.executeUpdate();

			System.out.println("member 데이터 등록이 "+rs+" 성공했습니다.");
		} catch (SQLException ex) {
			System.out.println("member 등록이 실패했습니다.");
			System.out.println("SQLException: " + ex.getMessage());
			throw new RuntimeException(ex.getMessage());
		} catch(ClassNotFoundException cnfe){
			System.out.println("DBConnection:ClassNotFoundException");
			throw new RuntimeException(cnfe.getMessage());
		} finally {
			
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( con != null ){ con.close(); con=null;	}
			}catch(Exception e){
				System.out.println("SQLException: " + e.getMessage());
				throw new RuntimeException(e.getMessage());
			}
		}
		return rs;	
	}
	
	public Boolean getSearchID(String id){
		
		Connection con = null;

		ResultSet rs = null;

		PreparedStatement pstmt = null;

		Boolean rsid = false;

		try {
			
			con = DBcon.getConnection();
			
			String sql = "SELECT mem_id FROM member WHERE mem_id=?"
					;
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()){

			// 동일한 아이디가 존재하면 true를 리턴

			rsid=true; 
			}
			System.out.println("member 데이터 등록이 "+rs+" 성공했습니다.");
			
		} catch (SQLException ex) {
			System.out.println("member 등록이 실패했습니다.");
			System.out.println("SQLException: " + ex.getMessage());
			throw new RuntimeException(ex.getMessage());
		} catch(ClassNotFoundException cnfe){
			System.out.println("DBConnection:ClassNotFoundException");
			throw new RuntimeException(cnfe.getMessage());
		} finally {
			
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( con != null ){ con.close(); con=null;	}
			}catch(Exception e){
				System.out.println("SQLException: " + e.getMessage());
				throw new RuntimeException(e.getMessage());
			}
		}
		return rsid;	
	}

	public int ckDeleteMem(String[] id) {
		
		Connection con = null;
		
		int[] cnt = new int[id.length];
		
		int rss = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			
			con = DBcon.getConnection();
			
			String sql = "DELETE FROM member WHERE mem_id=?";

			pstmt = con.prepareStatement(sql);

			for(String mid : id) {

				pstmt.setString(1, mid);
	
				pstmt.addBatch();

			//pstmt.clearParameters();
			//각각의 쿼리 문이 다를경우 이전 쿼리문 리셋

			}	
			
			cnt = pstmt.executeBatch();
			
			}catch (SQLException ex) {
				System.out.println("member 등록이 실패했습니다.");
				System.out.println("SQLException: " + ex.getMessage());
				throw new RuntimeException(ex.getMessage());
			} catch(ClassNotFoundException cnfe){
				System.out.println("DBConnection:ClassNotFoundException");
				throw new RuntimeException(cnfe.getMessage());
			} finally {
				
				try{
					if ( pstmt != null ){ pstmt.close(); pstmt=null; }
					if ( con != null ){ con.close(); con=null;	}
				}catch(Exception e){
					System.out.println("SQLException: " + e.getMessage());
					throw new RuntimeException(e.getMessage());
				}
			}
			
			for(int i=0; i<cnt.length; i++) {

				if(cnt[i] != -2) rss++;

				}

			return rss;
		}
	
	public Memberbean login(String mem_id , String mem_pwd) {
		
		Connection con = null;
		//db 연결 객체
		ResultSet rs = null;
		//실행 결과 저장 객체
		Statement stmt = null;
		//sql 실행 객체
		
		Memberbean mbean = new Memberbean();
		
		try {
			
			con = DBcon.getConnection();
			String sql = null;
			
			sql = "select * from member where mem_id='"+mem_id+"'and mem_pwd='"+mem_pwd+"'";			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				mbean.setMem_num(rs.getInt("mem_num"));
				mbean.setMem_id(rs.getString("mem_id"));
				mbean.setMem_pwd(rs.getString("mem_pwd"));
				
			}
			
			
			
		} catch (ClassNotFoundException cnfe) {
			System.out.println("DBConnection:ClassNotFoundException<br />");
			System.out.println("DBConnection: " + cnfe.getMessage());
		} catch (SQLException ex) {
			System.out.println("데이터베이스 연결이 실패되었습니다.<br />");
			System.out.println("SQLException: " + ex.getMessage());
		}finally {
			
			try{
				if ( stmt != null ){ stmt.close(); stmt=null; }
				if ( con != null ){ con.close(); con=null;	}
			}catch(Exception e){
				System.out.println("SQLException: " + e.getMessage());
				throw new RuntimeException(e.getMessage());
			}
		
		}
			
		return mbean;
	}
		
}
