<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%> 
<jsp:useBean id="result" class="cd.ConnetDB" scope="page"/>

<HTML>

<STYLE type=text/css>
BODY {
Background-image: url(../img/Clear.jpg);
}
</STYLE>

<script type="text/javascript" src="calendar.js"></script>
        
<BODY>
<center>
<P>

<script language="javascript"> 
   function checkInput(form)
   { 
      if(form.date.value=="")
      { 
         alert("ʹ�����ڲ���Ϊ��!");
         form.date.focus();
         return false;  
       } 
       if(form.usefor.value=="")
      { 
         alert("��;����Ϊ��!");
         form.usefor.focus();
         return false;  
       }
      return true ;
} 
</script> 

<% 
   String user = (String)session.getAttribute("userName");
   String str = "select clno,usedate,period,usefor,usestatus from Borrow where uno = '"+user+"'";
   ResultSet rs = result.connetSQL(str);
%>

		<title>���ҽ���</title>
		<CENTER>
		  <H1><FONT COLOR=RED>���ҽ���</Font></H1>
		  <form action="borrowInfo.jsp" name="form" onsubmit="return checkInput(this);">
		  <table>
		  <tr>
		  <td>
		  ��ѧ¥:<Select name = "classroom">
             <Option value="��ѧ¥">��ѧ¥</Option>
             <Option value="ʵ��¥">ʵ��¥</Option>
             <Option value="�ۺ�¥">�ۺ�¥</option>
          </Selcet></td>
		  
		  <td>
		  ʹ������:<input type="text" name="date" value="" id="date" onclick="calendar.show(this);" size="10" maxlength="10" readonly="readonly">&nbsp;
		  </td><td>����ʱ���:
		  <select name="period">
		     <option value="һ����">һ����</option>
		     <option value="���Ľ�">���Ľ�</option>
		     <option value="������">������</option>
		     <option value="�߰˽�">�߰˽�</option>
		     <option value="��ʮ��">��ʮ��</option>
		  </select></td></tr></table>
		  <table><td>��;:<input type="text" name="usefor" size = 40 value=""></td></table>
		  <BR><BR><BR><input type="submit" name="submit" value="�鿴���н���">
		  </form>
		  <BR>	       
		  
    <%  if(rs != null){
           
           out.println("���! "+user+",  ������Ľ���");
     %>
        <BR>
        <table border="1" width = 50% bordercolor = cyan >
          <th>���Һ�</th>
          <th>ʹ���߱��</th>
          <th>ʹ������</th>
          <th>����ʱ���</th>
          <th>��;</th>
          <th>״̬</th>
     <%
           while(rs.next()){
              out.println("<tr>");
              out.println("<td align=center>"+rs.getString(1)+"</td>");
              out.println("<td align=center>"+user+"</td>");
              out.println("<td align=center>"+rs.getString(2)+"</td>");
              out.println("<td align=center>"+rs.getString(3)+"</td>");
              out.println("<td align=center>"+rs.getString(4)+"</td>");
              if(rs.getString(5).equals("F"))
                  out.println("<td align=center>δ��׼</td>");
              if(rs.getString(5).equals("T"))
                  out.println("<td align=center>����׼</td>");
              out.println("</tr>");
           }
           
           }
        %>
          </table>
          <%
    
	 
        %>
<BR>     
</BODY>
</HTML>