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
    
    <B><font size=4>��ʦ������Ϣ</font>
    <BR><BR>
	
	<table width = 60% cellspacing=0 class=Tab >
	<tr>
		<th>��ʦ���</th>
		<th>��ʦ����</th>
		<th>�Ա�</th>
		<th>����Ժϵ</th>
		<th>�γ���</th>
		<th>�Ͽεص�</th>
		<th>�Ͽ�ʱ��</th>
		<th>�ڴ�</th>
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
	<input type="button" name="return" value="������ҳ" onclick="window.location.href('../welcome.jsp')" style="heigth = 100 width:70px"/>
	</td>
	</table>
</table>
</B>
</center>
</BODY>
<HTML>