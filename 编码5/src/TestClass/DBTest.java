package TestClass;


import java.sql.ResultSet;
import java.sql.SQLException;

import cd.ConnetDB;

public class DBTest {
	public static void main(String[] args) throws SQLException{
		ConnetDB db=new ConnetDB();
		String str = "select Teacher.tno,tname,sex,Teacher.deptname,Course.cname,Schedule.clno,weekday,period "+
    "from Teacher,Course,Schedule where Teacher.tno=Schedule.tno AND Course.cno=Schedule.cno and tname='qqq'";
		ResultSet rs=db.connetSQL(str);
		System.out.println(str);
		while(rs.next()) {
			   System.out.print("<tr>");
			   System.out.println("<td align = center>"+rs.getString(1)+"</td>");
			   System.out.println("<td align = center>"+rs.getString(2)+"</td>");
			   System.out.println("<td align = center>"+rs.getString(3)+"</td>");
			   System.out.println("<td align = center>"+rs.getString(4)+"</td>");
			   System.out.println("<td align = center>"+rs.getString(5)+"</td>");
			   System.out.println("<td align = center>"+rs.getString(6)+"</td>");
			   System.out.println("<td align = center>"+rs.getString(7)+"</td>");
			   System.out.println("<td align = center>"+rs.getString(8)+"</td>");
          
			   System.out.print("</tr>");
			}
	}
}
