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
<title>���ҺŲ�ѯ</title>
<CENTER>
 
<BR>

<%  String str = request.getParameter("clno");
  
    
    str = "select Schedule.clno,course.cno,cname,weekday,period,tname,Teacher.deptname from Schedule,Course,Teacher where Schedule.cno=Course.cno and Schedule.tno=Teacher.tno and clno='"+str+"'";
    ResultSet rs = result.connetSQL(str);
    
    out.print("<B><font size=5 color=red>"+"����ʹ�����");
    out.print("<BR><BR>");
	
	out.println("<table width = 50% cellspacing=0 class=Tab > ");
	out.println("<tr>");
	out.println("<th>���Һ�</th>");
	out.println("<th>�γ̺�</th>");
	out.println("<th>�γ���</th>");
	out.println("<th>�Ͽ�ʱ��</th>");
	out.println("<th>�ڴ�</th>");
	out.println("<th>��ʦ����</th>");
	out.println("<th>����Ժϵ</th>");

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
<input type="button" name="return" value="������ҳ" onclick="window.location.href('../welcome.jsp')" style="heigth = 100 width:70px"/>
</td>
</table>  
  
</CENTER>
</BODY>
<HTML>