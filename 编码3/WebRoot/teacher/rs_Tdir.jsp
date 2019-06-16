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

<% String dirStr = request.getParameter("department");
    byte bb[] = dirStr.getBytes("ISO-8859-1");
    dirStr = new String(bb);
    String str ;
    str = "select Teacher.tno,tname,sex,Teacher.deptname,Course.cname,Schedule.clno,weekday,period "+
    "from Teacher,Course,Schedule where Teacher.tno=Schedule.tno AND Course.cno=Schedule.cno and Teacher.deptname='"+dirStr+"'";
    ResultSet rs = result.connetSQL(str);
%>
    
    <B><font size=4>教师开课信息</font>
    <BR><BR>
	
	<table width = 60% cellspacing=0 class=Tab >
	<tr>
		<th>教师编号</th>
		<th>教师姓名</th>
		<th>性别</th>
		<th>所属院系</th>
		<th>课程名</th>
		<th>上课地点</th>
		<th>上课时间</th>
		<th>节次</th>
	</tr>
	<%
		while(rs.next()) {
	%>
		   <tr>
		   <td align = center><%=rs.getString(1)%></td>
		   <td align = center><%=rs.getString(2)%></td>
		   <td align = center><%=rs.getString(3)%></td>
		   <td align = center><%=rs.getString(4)%></td>
		   <td align = center><%=rs.getString(5)%></td>
		   <td align = center><%=rs.getString(6)%></td>
		   <td align = center><%=rs.getString(7)%></td>
		   <td align = center><%=rs.getString(8)%></td>
		   </tr>
	<% }
	%>	    
	<table>
	<td height=70>
	<input type="button" name="return" value="返回首页" onclick="window.location.href('../welcome.jsp')" style="heigth = 100 width:70px"/>
	</td>
	</table>
</table>
</B>
</center>
</BODY>
<HTML>