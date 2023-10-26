package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import DBcon.DBcon;
import DTO.Productbean;

public class ProductDAO {
	
public int getListCount(String search) {
		
		Connection con = null;

		ResultSet rs = null;

		PreparedStatement pstmt = null;

		int cnt=0;
		
		try {
			
			con = DBcon.getConnection();
			
			String sql = null;
			
			if(search == null) {

				sql = " SELECT COUNT(pro_num) FROM product ";

				}else {

				sql = " SELECT COUNT(pro_num) FROM product WHERE pro_name LIKE '%"+search+"%' "; 

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

	public ArrayList<Productbean> productList(int pageNum,int limit,String search) {

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<Productbean> list = new ArrayList<Productbean>();

		try {

			int total_record = getListCount(search);
			
			int start = (pageNum - 1) * limit;

			int index = start + 1;
			
			conn = DBcon.getConnection();
			String sql = null;

			if (search != null && search != "") {

				sql = "select * from product where pro_name LIKE '%" + search + "%'";

			} else {

				sql = "select * from product ";

			}

			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = pstmt.executeQuery(sql);

			while (rs.absolute(index)) { // 행단위로 읽어옴
				// bean 객체에 할당
				Productbean pbean = new Productbean();
				pbean.setPro_num(rs.getInt("pro_num"));
				pbean.setPro_name(rs.getString("pro_name"));
				pbean.setPro_price(rs.getInt("pro_price"));
				pbean.setPro_stock(rs.getInt("pro_stock"));
				pbean.setPro_imgName(rs.getString("pro_imgName"));
				pbean.setPro_explain(rs.getString("pro_explain"));
				pbean.setPro_hot(rs.getString("pro_hot"));
				pbean.setPro_new(rs.getString("pro_new"));
				pbean.setPro_display(rs.getString("pro_display"));
				pbean.setPro_pdate(rs.getString("pro_pdate"));

				list.add(pbean);
				
				if (index < (start + limit) && index <= total_record) {

					index++;
				}
					else {
					break;
				}
			}

		} catch (SQLException ex) {
			System.out.println("product 조회가 실패했습니다.");
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

	public int insertProduct(Productbean pbean) {

		Connection con = null;
		PreparedStatement pstmt = null;
		int rs = 0;

		try {
			con = DBcon.getConnection();

			String sql = "INSERT INTO product (pro_name,pro_price,pro_stock,pro_imgName,pro_explain,pro_hot,pro_new,pro_display,pro_pdate) VALUES (?,?,?,?,?,?,?,?,NOW())";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, pbean.getPro_name());
			pstmt.setInt(2, pbean.getPro_price());
			pstmt.setInt(3, pbean.getPro_stock());
			pstmt.setString(4, pbean.getPro_imgName());
			pstmt.setString(5, pbean.getPro_explain());
			pstmt.setString(6, pbean.getPro_hot());
			pstmt.setString(7, pbean.getPro_new());
			pstmt.setString(8, pbean.getPro_display());
			rs = pstmt.executeUpdate();

			System.out.println("fileupload 테이블 삽입이 " + rs + " 성공했습니다.");
		} catch (SQLException ex) {
			System.out.println("member 등록이 실패했습니다.");
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

	public int deleteProduct(String pro_num) {

		Connection con = null;
		PreparedStatement pstmt = null;

		int rs = 0;

		try {

			con = DBcon.getConnection();

			String sql = "DELETE FROM product where pro_num ='" + pro_num + "'";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeUpdate();
			
			

			System.out.println("product 데이터 삭제가 " + rs + " 성공했습니다.");
		} catch (SQLException ex) {
			System.out.println("product 데이터 삭제가 실패했습니다.<br>");
			System.out.println("SQLException: " + ex.getMessage());
		} catch (ClassNotFoundException cnfe) {
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
	
	public Productbean goUpdate(String pro_num) {
		
		Connection con = null;
		// db 연결 객체
		ResultSet rs = null;
		// 실행 결과 저장 객체
		Statement stmt = null;
		// sql 실행 객체
		
		Productbean pbean = new Productbean();
		
		try {
			
			con = DBcon.getConnection();
			String sql = null;

			sql = "select * from product where pro_num='"+pro_num+"'";			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				pbean.setPro_num(rs.getInt("pro_num"));
				pbean.setPro_name(rs.getString("pro_name"));
				pbean.setPro_price(rs.getInt("pro_price"));
				pbean.setPro_stock(rs.getInt("pro_stock"));
				pbean.setPro_imgName(rs.getString("pro_imgName"));
				pbean.setPro_explain(rs.getString("pro_explain"));
				pbean.setPro_hot(rs.getString("pro_hot"));
				pbean.setPro_new(rs.getString("pro_new"));
				pbean.setPro_display(rs.getString("pro_display"));
				pbean.setPro_pdate(rs.getString("pro_pdate"));
			
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
		
		return pbean;
	}
	
	public int updateProduct(Productbean pbean) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		
		String sql2 = null;
		
		try {
			con = DBcon.getConnection();

			if(pbean.getPro_imgName() !=null) sql2 = ", pro_imgName=?";

			else sql2 = "";
			
			int pro_num = pbean.getPro_num();
			
			String sql = "UPDATE product set pro_name=?,pro_price=?,pro_stock=?,pro_explain=?,pro_hot=?,pro_new=?,pro_display=?"+sql2+" where pro_num="+pro_num;
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, pbean.getPro_name());
			pstmt.setInt(2, pbean.getPro_price());
			pstmt.setInt(3, pbean.getPro_stock());
			pstmt.setString(4, pbean.getPro_explain());
			pstmt.setString(5, pbean.getPro_hot());
			pstmt.setString(6, pbean.getPro_new());
			pstmt.setString(7, pbean.getPro_display());

			if(pbean.getPro_imgName() != null)pstmt.setString(8, pbean.getPro_imgName());
			rs = pstmt.executeUpdate();
			System.out.println(pbean.getPro_imgName());
			System.out.println("product 테이블 삽입이 " + rs + " 성공했습니다.");
		} catch (SQLException ex) {
			System.out.println("product 등록이 실패했습니다.");
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
	
	public ArrayList<Productbean> userItemList(String search){
		
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<Productbean> list = new ArrayList<Productbean>();
		
		try {
			
			conn = DBcon.getConnection();
			String sql = null;

			if (search != null && search != "") {

				sql = "select * from product where pro_name LIKE '%" + search + "%'";

			} else {

				sql = "select * from product where pro_display = 'Yes'";

			}

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);

			while (rs.next()) { // 행단위로 읽어옴
				// bean 객체에 할당
				Productbean pbean = new Productbean();
				pbean.setPro_num(rs.getInt("pro_num"));
				pbean.setPro_name(rs.getString("pro_name"));
				pbean.setPro_price(rs.getInt("pro_price"));
				pbean.setPro_stock(rs.getInt("pro_stock"));
				pbean.setPro_imgName(rs.getString("pro_imgName"));
				pbean.setPro_explain(rs.getString("pro_explain"));
				pbean.setPro_hot(rs.getString("pro_hot"));
				pbean.setPro_new(rs.getString("pro_new"));
				pbean.setPro_display(rs.getString("pro_display"));
				pbean.setPro_pdate(rs.getString("pro_pdate"));

				list.add(pbean);
						
			}

		} catch (SQLException ex) {
			System.out.println("product 조회가 실패했습니다.");
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
	
	public ArrayList<Productbean> userHotList(String search){
		
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<Productbean> list = new ArrayList<Productbean>();
		
		try {
			
			conn = DBcon.getConnection();
			String sql = null;

			if (search != null && search != "") {

				sql = "select * from product where pro_name LIKE '%" + search + "%'";

			} else {

				sql = "select * from product where pro_display = 'Yes' and pro_hot = 'Yes'";

			}

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);

			while (rs.next()) { // 행단위로 읽어옴
				// bean 객체에 할당
				Productbean pbean = new Productbean();
				pbean.setPro_num(rs.getInt("pro_num"));
				pbean.setPro_name(rs.getString("pro_name"));
				pbean.setPro_price(rs.getInt("pro_price"));
				pbean.setPro_stock(rs.getInt("pro_stock"));
				pbean.setPro_imgName(rs.getString("pro_imgName"));
				pbean.setPro_explain(rs.getString("pro_explain"));
				pbean.setPro_hot(rs.getString("pro_hot"));
				pbean.setPro_new(rs.getString("pro_new"));
				pbean.setPro_display(rs.getString("pro_display"));
				pbean.setPro_pdate(rs.getString("pro_pdate"));

				list.add(pbean);
						
			}

		} catch (SQLException ex) {
			System.out.println("product 조회가 실패했습니다.");
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
	
	public ArrayList<Productbean> userNewList(String search){
		
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<Productbean> list = new ArrayList<Productbean>();
		
		try {
			
			conn = DBcon.getConnection();
			String sql = null;

			if (search != null && search != "") {

				sql = "select * from product where pro_name LIKE '%" + search + "%'";

			} else {

				sql = "select * from product where pro_display = 'Yes' and pro_new = 'Yes'";

			}

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);

			while (rs.next()) { // 행단위로 읽어옴
				// bean 객체에 할당
				Productbean pbean = new Productbean();
				pbean.setPro_num(rs.getInt("pro_num"));
				pbean.setPro_name(rs.getString("pro_name"));
				pbean.setPro_price(rs.getInt("pro_price"));
				pbean.setPro_stock(rs.getInt("pro_stock"));
				pbean.setPro_imgName(rs.getString("pro_imgName"));
				pbean.setPro_explain(rs.getString("pro_explain"));
				pbean.setPro_hot(rs.getString("pro_hot"));
				pbean.setPro_new(rs.getString("pro_new"));
				pbean.setPro_display(rs.getString("pro_display"));
				pbean.setPro_pdate(rs.getString("pro_pdate"));

				list.add(pbean);
						
			}

		} catch (SQLException ex) {
			System.out.println("product 조회가 실패했습니다.");
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
	
	public Productbean productInfo(String num) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Productbean pbean = new Productbean();

		

		try {

			con = DBcon.getConnection();

			String sql = "Select * FROM product where pro_num ='" + num + "'";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			
			if(rs.next()){
				
				pbean.setPro_num(rs.getInt("pro_num"));
				pbean.setPro_name(rs.getString("pro_name"));
				pbean.setPro_price(rs.getInt("pro_price"));
				pbean.setPro_stock(rs.getInt("pro_stock"));
				pbean.setPro_imgName(rs.getString("pro_imgName"));
				pbean.setPro_explain(rs.getString("pro_explain"));
				pbean.setPro_hot(rs.getString("pro_hot"));
				pbean.setPro_new(rs.getString("pro_new"));
				pbean.setPro_display(rs.getString("pro_display"));
				pbean.setPro_pdate(rs.getString("pro_pdate"));
								
			}
			

			System.out.println("product 데이터 삭제가 " + rs + " 성공했습니다.");
		} catch (SQLException ex) {
			System.out.println("product 데이터 삭제가 실패했습니다.<br>");
			System.out.println("SQLException: " + ex.getMessage());
		} catch (ClassNotFoundException cnfe) {
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

		return pbean;

	}
}
