<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%> 
<jsp:useBean id="result" class="cd.ConnetDB" scope="page"/>

<HTML>

<STYLE type=text/css>
BODY {
Background-image: url(../img/Clear.jpg);
}
</STYLE>

<BODY>
<title>�ս��Ҳ�ѯ���</title>
<CENTER>
  <H1><FONT COLOR=RED>�ս��Ҳ�ѯ���
<BR>
  <FONT Size=4 COLOR=black>
  
  <% String clStr=request.getParameter("classroom");
     String weekStr=request.getParameter("weekday");
     String periodStr=request.getParameter("period");
   %>
   
   
  <FORM action="rs_free.jsp" method = post name = form>
    <table border=1 bordercolor = green width = 30%>
    <td>��ѧ¥:
    <Select name = "classroom">
       <Option value="��ѧ¥">��ѧ¥</Option>
       <Option value="ʵ��¥">ʵ��¥</Option>
       <Option value="�ݷ�¥">�ݷ�¥</option>
    </Selcet> 
    </td>
    <td>
    ����:
    <Select name = "weekday">
       <Option value="����һ">����һ</Option>
       <Option value="���ڶ�">���ڶ�</Option>
       <Option value="������">������</Option>
       <Option value="������">������</Option>
       <Option value="������">������</Option>
       <Option value="������">������</Option>
       <Option value="������">������</Option>
    </Selcet>
    </td>
    <td>����ʱ���:
		  <select name="period">
		     <option value="һ����">һ����</option>
		     <option value="���Ľ�">���Ľ�</option>
		     <option value="������">������</option>
		     <option value="�߰˽�">�߰˽�</option>
		     <option value="��ʮ��">��ʮ��</option>
		  </select></td>
    <td>
    <INPUT type="submit" value="�鿴" name="submit">
    </td>
   </table>
  </FORM>
  
  
  <% 

     String str=" ";
     
     byte b1[] = clStr.getBytes("ISO-8859-1");
     clStr = new String(b1);
     
     byte b2[] = weekStr.getBytes("ISO-8859-1");
     weekStr = new String(b2);
     
     byte b3[] = periodStr.getBytes("ISO-8859-1");
     periodStr = new String(b3);
     
     if(clStr.equals("��ѧ¥")){
        str="select * from Classroom where clno like '2___' or clno like 'XJ___' or clno like 'DJ___' and clno not in" +
        "(select clno from Schedule "+
        "where  period = '"+periodStr+"' and weekday = '"+weekStr+"') ";
     }   
     
     if(clStr.equals("ʵ��¥")){
        str="select * from Classroom where clno like 'S___' or clno like 'SJ_' and clno not in" +
        "(select clno from Schedule "+
        "where  period = '"+periodStr+"' and weekday = '"+weekStr+"')";
     }
     
     if(clStr.equals("�ݷ�¥")){
        str="select * from Classroom where clno like 'YF____' and clno not in" +
        "(select clno from Schedule "+
        "where  period = '"+periodStr+"' and weekday = '"+weekStr+"')";
     }
 
     ResultSet rs = result.connetSQL(str);
    
 
    out.print("<BR>");
	out.println("<table width = '30%' border = 1 bordercolor = cyan cellspacing='0' cellpadding='0'  class = Tab> ");
	out.println("<tr>");
	out.println("<th>���Һ�</th>");
	out.println("<th>�豸</th>");
	out.println("<th>��������</th>");
	out.println("<th>ʱ���</th>");
	out.println("<th>�ڴ�</th>");
	
	
	out.println("</tr>");
	while(rs.next()) {
	   out.print("<tr>");
	   out.println("<td align = center>"+rs.getString(1)+"</td>");
	   out.println("<td align = center>"+rs.getString(2)+"</td>");
	   out.println("<td align = center>"+rs.getString(3)+"</td>");
	   out.println("<td align = center>"+weekStr+"</td>");
	   out.println("<td align = center>"+periodStr+"</td>");
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