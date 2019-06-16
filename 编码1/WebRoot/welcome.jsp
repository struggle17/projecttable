<%@ page contentType="text/html;charset=GB2312"%>
<HTML>

<STYLE type=text/css>
BODY {
Background-image: url(img/Clear.jpg);
}
</STYLE>

<BODY>
<title>教室管理信息系统</title>
<CENTER>
  <H1>西北师范大学 </H1>
  <H2>教室管理信息系统</H2>
  <% 
  String userName = (String)session.getAttribute("userName");
  session.setAttribute("userName",userName);
  %>
<p>欢迎您:<%=userName%></p>
<HR color=white>
  <BR><FONT Size=4>
<A HREF="teacher/teacher.jsp">教师查询</A>&nbsp;
<A HREF="classroom/classroom.jsp">教室查询</A>&nbsp; 
<A HREF="course/course.jsp">课程查询</A>&nbsp;
<A HREF="study/study.jsp">自习查询</A>&nbsp;
<A HREF="borrow/borrow.jsp">教室借用</A>&nbsp;
<A HREF="alterpasswd.jsp">修改密码</A>
<BR><BR><image src="img/fore.jpg" ></image>
<BR><BR>计算机科学与技术2班

</FONT>
</CENTER>
</BODY>
</HTML>
