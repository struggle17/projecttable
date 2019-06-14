package opDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectDB {
	
	private String DRIVER="com.mysql.jdbc.Driver";
	private Connection con;
	
	public ConnectDB() {
	}
	
	public void connect(String dbName) {
	    try
	    {
	    	Class.forName(DRIVER);
	    	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cmisdb?characterEncoding=utf8","root","mysql123");
	    } catch (Exception e) 
	    {
	    	e.printStackTrace();
	    }
	}
	
	public ResultSet queryDB(String queryString) {
		try{
			Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = sql.executeQuery(queryString);
			while (rs.next()) {
				System.out.println(rs.getString(1));
			}
			return rs;
		} catch (Exception e) 
	    {
	    	e.printStackTrace();
	    }
		return null;
	}
	
	//查询是否有信息，只返回布尔值
	public boolean queryDBHave(String queryString) {
		try{
			Statement sql=con.createStatement();
			ResultSet rs = sql.executeQuery(queryString);
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) 
	    {
	    }
		return false;
	}
	
	public boolean updateDB(String updateString) {
		try {
			Statement sql=con.createStatement();
			sql.executeUpdate(updateString);
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
	
	public void disConnect() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String args[]) {
		ConnectDB my = new ConnectDB();
		my.connect("CmisDB");
		my.queryDB("SELECT * FROM Course where cname like '%基础%'");
	}
}
