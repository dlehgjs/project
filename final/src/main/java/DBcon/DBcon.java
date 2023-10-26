package DBcon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBcon {

public static Connection getConnection() throws SQLException, ClassNotFoundException{
		
		Connection conn=null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			String url = "jdbc:mysql://localhost:3306/projectDB";
			String user = "root";
			String password = "@Seoulit1004";
			conn = DriverManager.getConnection(url,user,password);		
		}catch(SQLException sqle){
			System.out.println("DBConnection:SQLException");
			throw new RuntimeException(sqle.getMessage());
		}catch(ClassNotFoundException cnfe){
			System.out.println("DBConnection:ClassNotFoundException");
			throw new RuntimeException(cnfe.getMessage());
		}
		return conn; 

	}
}
