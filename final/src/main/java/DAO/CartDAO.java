package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import DBcon.DBcon;
import DTO.Cartbean;


public class CartDAO {
	
	public ArrayList<Cartbean> getCartList(int num) {

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;


		ArrayList<Cartbean> list = new ArrayList<Cartbean>();

		try {
			
			conn = DBcon.getConnection();
			String sql = null;
							
				sql = "select c.cart_num, c.cart_date, m.mem_num, p.pro_num, p.pro_imgName, p.pro_name, p.pro_price, c.cart_amount from cart as c join member as m\n"
						+ "on m.mem_num = c.mem_num join product as p on p.pro_num = c.pro_num where m.mem_num="+num;
				
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);

			while(rs.next()){
				// bean 객체에 할당
				Cartbean cbean = new Cartbean();
				
				cbean.setCart_num(rs.getInt("cart_num"));
				cbean.setPro_num(rs.getInt("pro_num"));
				cbean.setMem_num(rs.getInt("mem_num"));
				cbean.setCart_amount(rs.getInt("cart_amount"));
				cbean.setCart_date(rs.getString("cart_date"));
				cbean.setPro_imgName(rs.getString("pro_imgName"));
				cbean.setPro_name(rs.getString("pro_name"));
				cbean.setPro_price(rs.getInt("pro_price"));
				
				
				list.add(cbean);
			}
			
			
		} catch (SQLException ex) {
			System.out.println("cart 조회가 실패했습니다.");
			System.out.println("SQLException: " + ex.getMessage());
			throw new RuntimeException(ex.getMessage());
		} catch (ClassNotFoundException cnfe) {
			System.out.println("DBConnection:ClassNotFoundException");
			throw new RuntimeException(cnfe.getMessage());
		} finally {

			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				System.out.println("SQLException: " + e.getMessage());
				throw new RuntimeException(e.getMessage());
			}

		}

		return list;

	}
	
	public int getCartProduct(int mem_num,int pro_num) {
				
		Connection con = null;
		ResultSet rs = null;
		int cnt = 0;
		PreparedStatement pstmt = null;

		
		try {

			con = DBcon.getConnection();
			
			String sql = null;
	
			sql = "Select cart_num from cart where mem_num="+mem_num+" and pro_num="+pro_num;
	
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				cnt = rs.getInt(1);
				
			}
			

		} catch (SQLException ex) {

			System.out.println("cart 테이블 수정 실패했습니다.<br>");
	
			System.out.println("SQLException: " + ex.getMessage());

		throw new RuntimeException(ex.getMessage());
		} 
		  catch (ClassNotFoundException cnfe) {
			System.out.println("DBConnection:ClassNotFoundException");
			throw new RuntimeException(cnfe.getMessage());
		} finally {

			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (con != null) {
					con.close();
					con = null;
				}
			} catch (Exception e) {
				System.out.println("SQLException: " + e.getMessage());
				throw new RuntimeException(e.getMessage());
			}

		}
		
		
		return cnt;
		
	}
	
	public int insertCart(Cartbean cbean){

		Connection con = null;
		int rs = 0;
		PreparedStatement pstmt = null;

		try {

			con = DBcon.getConnection();
	
			int mem_num = cbean.getMem_num();
			int pro_num = cbean.getPro_num();
			int cart_amount = cbean.getCart_amount();
			int cart_num=0;
	
			String sql = null;
	
			cart_num = getCartProduct(mem_num, pro_num);

		// 회원아이디와 상품아이디를 이용해서 기존에 장바구니에

		// 상품이 등록되어 있으면 장바구니 기본키를 반환

		if(cart_num !=0) {

			sql = "UPDATE cart SET cart_amount = cart_amount+?, cart_date=NOW() WHERE cart_num=?";
	
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cart_amount);
			pstmt.setInt(2, cart_num);
	
			rs = pstmt.executeUpdate();

		}else{

			sql = "INSERT INTO cart VALUES (null,?,?,?,NOW()) ";
	
			pstmt = con.prepareStatement(sql);
	
			pstmt.setInt(1, mem_num);
			pstmt.setInt(2, pro_num);
			pstmt.setInt(3, cart_amount);
	
			rs = pstmt.executeUpdate();

		}

		//System.out.println(sql);

		} catch (SQLException ex) {

			System.out.println("cart 테이블 수정 실패했습니다.<br>");
	
			System.out.println("SQLException: " + ex.getMessage());

		throw new RuntimeException(ex.getMessage());
		} 
		  catch (ClassNotFoundException cnfe) {
			System.out.println("DBConnection:ClassNotFoundException");
			throw new RuntimeException(cnfe.getMessage());
		} finally {

			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (con != null) {
					con.close();
					con = null;
				}
			} catch (Exception e) {
				System.out.println("SQLException: " + e.getMessage());
				throw new RuntimeException(e.getMessage());
			}

		}
		
		return rs;
		
	}
	
	public int deleteCart(String cart_num){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int rs = 0;
		
		try {
			
			con = DBcon.getConnection();
			
			String sql = "DELETE FROM cart where cart_num ='"+cart_num+"'";
			
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
	
public int deleteAllCart(String mem_num){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int rs = 0;
		
		try {
			
			con = DBcon.getConnection();
			
			String sql = "DELETE FROM cart where mem_num ='"+mem_num+"'";
			
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

}
