package cd;

import java.sql.*;
import java.util.*;

public class Login
{
	Vector result_stu = new Vector();
	Vector result_teacher = new Vector();
	Connection con ;
	Statement sql ;
	ResultSet rs_stu ;
	ResultSet rs_teacher ;
	
	public Login(){
	}
	
	public Vector getResult_stu(String user){
		try{
		   Class.forName("com.mysql.jdbc.Driver");
	    }
	    catch(Exception e){}
	    try{
	    	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmisdb?characterEncoding=utf8","root","mysql123");
	    	sql = con.createStatement();
	    	rs_stu = sql.executeQuery("select * from Student where sno = '"+user+"'");
	    	while(rs_stu.next()){
	    		result_stu.add(rs_stu.getString(1));
	    	}
	    	con.close();
	    }
	    catch(SQLException e){ }
	    return result_stu;
	}
	
	public Vector getResult_teacher(String user){
		try{
		   Class.forName("com.mysql.jdbc.Driver");
	    }
	    catch(Exception e){}
	    try{
	    	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmisdb?characterEncoding=utf8","root","mysql123");
	    	sql = con.createStatement();
	    	rs_teacher = sql.executeQuery("select * from Teacher where tno = '"+user+"'");
	    	while(rs_teacher.next()){
	    		result_teacher.add(rs_teacher.getString(1));
	    	}
	    	con.close();
	    }
	    catch(SQLException e){ }
	    return result_teacher;
	}
	
/*	public static void main(String[] a){
		System.out.println(new Login().getResult("2008210767").get(0));
	}*/
}