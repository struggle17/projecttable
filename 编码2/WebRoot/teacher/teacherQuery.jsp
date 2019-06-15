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

<script language="javascript">
  function checkInput(form)
  {
    if(form.teacherName.value=="")
    { 
       alert("姓名不能为空");
       form.teacherName.focus();
       return false;  
    }
    return true ;
  } 
</script>

<% String QueryType = request.getParameter("search");
   if(QueryType==null)
   {
     QueryType="";
   }
   if(QueryType.equals("nameSearch"))
   {
%>

<title>教师姓名查询</title>
<CENTER>
  <H1><FONT COLOR=RED>教师姓名查询
<BR>

  
  <FONT Size=4><FONT COLOR=black>
  <FORM action="rs_Tname.jsp"  name = "form" onsubmit="return checkInput(this);">
    <P>姓名:<INPUT type = "text" name = "teacherName" value="" size=10>
    
   <BR><BR><INPUT type="submit" value="提交查询内容" name="submit">
  </FORM>

<% }

   if(QueryType.equals("dirSearch"))
   {
   
 %>
   <title>教师 目录查询</title>
<CENTER>
  <H1><FONT COLOR=RED>目录查询
<BR>

  <FONT Size=4><FONT COLOR=black>
  <FORM action="rs_Tdir.jsp" method = post name = form>
    <Select name = "department">
       <Option value="软件与信息工程学院">软件与信息工程学院
       <Option value="外国语学院">外国语学院
       <Option value="经济与管理学院">经济与管理学院
       <Option value="生态与规划学院">生态与规划学院
       <Option value="东盟国际学院">东盟国际学院
       <Option value="现代体育学院">现代体育学院
       <Option value="旅游管理学院">旅游管理学院
       <Option value="艺术学院">艺术学院

    </Selcet>
    <INPUT type="submit" value="提交查询内容" name="submit">
  </FORM>
<%  
   }
%>

</CENTER>
</BODY>
<HTML>