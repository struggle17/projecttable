<%@ page contentType="text/html;charset=GB2312"%>
<HTML>
<STYLE type=text/css>
BODY {
Background-image: url(../img/Clear.jpg);
}
</STYLE>
<BODY>

<%
   String QueryType = request.getParameter("search");
   if(QueryType==null)
   {
     QueryType="";
   }
   if(QueryType.equals("numSearch"))
   {
   
 %>
	<title>���ұ�Ų�ѯ</title>
	<CENTER>
	  <H1><FONT COLOR=RED>���ұ�Ų�ѯ
	<BR>
	
	  <FONT Size=4><FONT COLOR=black>
	  <FORM action="clnoQuery.jsp" method = post name = form >
	    <P>���ұ��:<INPUT type = "text" name = "clno" value="" size=10 onkeydown="onlyEngCh();">
	    
	   <BR><BR><INPUT type="submit" value="�ύ��ѯ����" name="submit">
	  </FORM>

<% 
   }
   if(QueryType.equals("dirSearch"))
   {
%>  
    <title>Ŀ¼��ѯ</title>
    <CENTER>
    <H1><FONT COLOR=RED>Ŀ¼��ѯ
    <BR>

    <FONT Size=4><FONT COLOR=black>
    <FORM action="rs_crDir.jsp" method = post name = form>
    <Select name = "classroom">
       <Option value="A��">A��
       <Option value="E��">E��
       <Option value="1��¥">1��¥
       <Option value="2��¥">2��¥
       <Option value="3��¥">3��¥
    </Selcet> 
   <BR><BR><INPUT type="submit" value="�ύ��ѯ����" name="submit">
   </FORM>
   
<%
   }
%>

</CENTER>
</BODY>
</HTML>