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
	<title>教室编号查询</title>
	<CENTER>
	  <H1><FONT COLOR=RED>教室编号查询
	<BR>
	
	  <FONT Size=4><FONT COLOR=black>
	  <FORM action="clnoQuery.jsp" method = post name = form >
	    <P>教室编号:<INPUT type = "text" name = "clno" value="" size=10 onkeydown="onlyEngCh();">
	    
	   <BR><BR><INPUT type="submit" value="提交查询内容" name="submit">
	  </FORM>

<% 
   }
   if(QueryType.equals("dirSearch"))
   {
%>  
    <title>目录查询</title>
    <CENTER>
    <H1><FONT COLOR=RED>目录查询
    <BR>

    <FONT Size=4><FONT COLOR=black>
    <FORM action="rs_crDir.jsp" method = post name = form>
    <Select name = "classroom">
       <Option value="A栋">A栋
       <Option value="E栋">E栋
       <Option value="1号楼">1号楼
       <Option value="2号楼">2号楼
       <Option value="3号楼">3号楼
    </Selcet> 
   <BR><BR><INPUT type="submit" value="提交查询内容" name="submit">
   </FORM>
   
<%
   }
%>

</CENTER>
</BODY>
</HTML>