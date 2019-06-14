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
<title>教室号查询</title>
<CENTER>
 
<BR>

<%  String str = request.getParameter("clno");
  
    
    str = "select Schedule.clno,course.cno,cname,weekday,period,tname,Teacher.deptname from Schedule,Course,Teacher where Schedule.cno=Course.cno and Schedule.tno=Teacher.tno and clno='"+str+"'";
    ResultSet rs = result.connetSQL(str);
    
    out.print("<B><font size=5 color=red>"+"教室使用情况");
    out.print("<BR><BR>");
	
	out.println("<table width = 50% cellspacing=0 class=Tab > ");
	out.println("<tr>");
	out.println("<th>教室号</th>");
	out.println("<th>课程号</th>");
	out.println("<th>课程名</th>");
	out.println("<th>上课时间</th>");
	out.println("<th>节次</th>");
	out.println("<th>教师姓名</th>");
	out.println("<th>所在院系</th>");

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