<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%> 
<jsp:useBean id="result" class="cd.ConnetDB" scope="session"/>
<HTML>
<STYLE type=text/css>
BODY {
Background-image: url(../img/Clear.jpg);
}
</STYLE>
<BODY>


<% String QueryType = request.getParameter("search");
   if(QueryType==null)
   {
     QueryType="";
   }
   if(QueryType.equals("nameSearch"))
   {
%>

<title>课程名查询</title>
<CENTER>
  <H1><FONT COLOR=RED>课程名查询
<BR>

  
  <FONT Size=4><FONT COLOR=black>
  <FORM action="rs_Cname.jsp" method = post name = form>
    <P>课程名:<INPUT type = "text" name = "courseName" value="" size=10>
    
   <BR><BR><INPUT type="submit" value="提交查询内容" name="submit">
  </FORM>

<% }

   if(QueryType.equals("dirSearch"))
   {
   
 %>
   <title>目录查询</title>
<CENTER>
  <H1><FONT COLOR=RED>目录查询
<BR>

  <FONT Size=4><FONT COLOR=black>
  <FORM action="rs_Cdir.jsp" method = post name = form>
    <Select name = "department">
       <Option value="软件与信息工程学院">软件与信息工程学院
       <Option value="外国语学院">外国语学院
       <Option value="经济与管理学院">经济与管理学院
       <Option value="规划与生态学院">规划与生态学院
       <Option value="东盟国际学院">东盟国际学院
       <Option value="现代体育学院">现代体育学院
       <Option value="旅游管理学院">旅游管理学院
       <Option value="艺术学院">艺术学院
    </Selcet> 
   <BR><BR><INPUT type="submit" value="提交查询内容" name="submit">
  </FORM>
<%  
   }
%>


</CENTER>
</BODY>
</HTML>