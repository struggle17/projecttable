<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%> 
<jsp:useBean id="result" class="cd.ConnetDB" scope="page"/>
<HTML>
<STYLE type=text/css>
BODY {
Background-image: url(../img/Clear.jpg);
}
</STYLE>

<style type="text/css">
.Tab th{ border-collapse:collapse; 
      border:solid 1px #f00
     }
.Tab td{ border-collapse:collapse; border:solid 1px #f00}
</style>


<BODY>
<center>
<% String str = request.getParameter("teacherName");
    byte b[] = str.getBytes("ISO-8859-1");
    str = new String(b);
    String s = "select Teacher.tno,tname,sex,Teacher.deptname,Course.cname,Schedule.clno,weekday,period "+
    "from Teacher,Course,Schedule where Teacher.tno=Schedule.tno AND Course.cno=Schedule.cno and tname='"+str+"'";
    ResultSet rs = result.connetSQL(s);
    
    
    out.print("<B><font size=4>"+"教师开课信息");
    out.print("<BR><BR>");
	
	out.println("<table width = '60%' cellspacing='0' cellpadding='0'  class = Tab> ");
	out.println("<tr>");
	out.println("<th>教师编号</th>");
	out.println("<th>教师姓名</th>");
	out.println("<th>性别</th>");
	out.println("<th>所属院系</th>");

	out.println("<th>课程名</th>");
	out.println("<th>上课地点</th>");
	out.println("<th>上课时间</th>");
	out.println("<th>节次</th>");

	out.println("</tr>");
	while(rs.next()) {
	   out.print("<tr>");
	   out.println("<td align = center>"+rs.getString(1)+"</td>");
	   out.println("<td align = center>"+rs.getString(2)+"</td>");
	   out.println("<td align = center>"+rs.getString(3)+"</td>");
	   out.println("<td align = center>"+rs.getString(4)+"</td>");
	   out.println("<td align = center>"+rs.getString(5)+"</td>");
       out.println("<td align = center>"+rs.getString(6)+"</td>");
	   out.println("<td align = center>"+rs.getString(7)+"</td>");
	   out.println("<td align = center>"+rs.getString(8)+"</td>");
	 

	 
	   out.print("</tr>");
	}
 
	    
%>
<table>
<td height=70>
<input type="button" name="return" value="返回首页" onclick="window.location.href('../welcome.jsp')" style="heigth = 100 width:70px"/>
</td>
</table>
</CENTER>
</BODY>
<HTML>