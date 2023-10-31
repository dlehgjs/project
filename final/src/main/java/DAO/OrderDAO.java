package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import DBcon.DBcon;
import DTO.Orderbean;

public class OrderDAO {

	public ArrayList<Orderbean> orderList(String search){
		
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		ArrayList<Orderbean> list = new ArrayList<Orderbean>();
		
		try {
			
			conn = DBcon.getConnection();
			String sql = null;
			
			if(search != null && search !=""){
				
				sql = "select * from orderTbl where mem_name LIKE '%"+search+"%'";
				
			}
			else{

				sql = "select * from orderTbl ";	
				
			}

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			
			while(rs.next()) { // 행단위로 읽어옴
				// bean 객체에 할당
				Orderbean obean = new Orderbean();
				obean.setOrder_num(rs.getInt("order_num"));
				obean.setOrder_code(rs.getInt("order_code"));
				obean.setMem_num(rs.getInt("mem_num"));
				obean.setOrder_name(rs.getString("order_name"));
				obean.setOrder_phoneNum(rs.getString("order_phoneNum"));
				obean.setOrder_addr(rs.getString("order_addr"));
				obean.setOrder_type(rs.getString("order_type"));
				obean.setOrder_parcel(rs.getString("order_parcel"));
				obean.setOrder_postCode(rs.getInt("order_postCode"));
				
				list.add(obean);
			}

		} catch (SQLException ex) {
			System.out.println("orderTbl 조회가 실패했습니다.");
			System.out.println("SQLException: " + ex.getMessage());
			throw new RuntimeException(ex.getMessage());
		} catch(ClassNotFoundException cnfe){
			System.out.println("DBConnection:ClassNotFoundException");
			throw new RuntimeException(cnfe.getMessage());
		} finally {
			
			try{
				if ( stmt != null ){ stmt.close(); stmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				System.out.println("SQLException: " + e.getMessage());
				throw new RuntimeException(e.getMessage());
			}
			
		}
		
		return list;

	}
	
public ArrayList<Orderbean> userOrderList(int mem_num){
		
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		ArrayList<Orderbean> list = new ArrayList<Orderbean>();
		
		try {
			
			conn = DBcon.getConnection();
			String sql = null;
			
		
				sql = "select order_code, order_name, order_phoneNum, order_addr, order_type, order_parcel, order_postCode from orderTbl where mem_num ="+mem_num;		
			

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			
			while(rs.next()) { // 행단위로 읽어옴
				// bean 객체에 할당
				Orderbean obean = new Orderbean();
				obean.setOrder_num(rs.getInt("order_num"));
				obean.setOrder_code(rs.getInt("order_code"));
				obean.setMem_num(rs.getInt("mem_num"));
				obean.setOrder_name(rs.getString("order_name"));
				obean.setOrder_phoneNum(rs.getString("order_phoneNum"));
				obean.setOrder_addr(rs.getString("order_addr"));
				obean.setOrder_type(rs.getString("order_type"));
				obean.setOrder_parcel(rs.getString("order_parcel"));
				obean.setOrder_postCode(rs.getInt("order_postCode"));
				
				list.add(obean);
			}

		} catch (SQLException ex) {
			System.out.println("orderTbl 조회가 실패했습니다.");
			System.out.println("SQLException: " + ex.getMessage());
			throw new RuntimeException(ex.getMessage());
		} catch(ClassNotFoundException cnfe){
			System.out.println("DBConnection:ClassNotFoundException");
			throw new RuntimeException(cnfe.getMessage());
		} finally {
			
			try{
				if ( stmt != null ){ stmt.close(); stmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				System.out.println("SQLException: " + e.getMessage());
				throw new RuntimeException(e.getMessage());
			}
			
		}
		
		return list;

	}
		
		
	
}
