<%@ page contentType="text/html;charset=GB2312"%>
<HTML>

<STYLE type=text/css>
BODY {
Background-image: url(img/Clear.jpg);
}
</STYLE>

<BODY>
<title>教室管理信息系统</title>
<style>
		ul{
			list-style:none;
			margin-left:350px;
			padding:0;
		}
		li{
			float: left;
		}
		a:link,a:visited{
			display: block;/*设置块级元素*/
			width: 100px;/*宽度为100像素*/
			font-weight: bold;/*字体加粗*/
			color: black;/*字体颜色为白色*/
			background-color: #8EE5EE;/*背景色设置为蓝色*/
			text-align: center;/*文本居中*/
			padding: 5px;/*5px的边距*/
			text-decoration: none;

		}
		a:hover,a:active{
			background-color:#388E8E;
		}
	</style>
<CENTER>
  <H1>西北师范大学 教室管理信息系统</H1>

  <% 
  String userName = (String)session.getAttribute("userName");
  session.setAttribute("userName",userName);
  %>
<p>欢迎您:<%=userName%></p>
<HR color=white>
  <BR><FONT Size=4>

<nav>
		<ul>
			<li><a href="teacher/teacher.jsp">教师查询</a></li>
			<li><a href="classroom/classroom.jsp">教室查询</a></li>
			<li><a href="course/course.jsp">课程查询</a></li>
			<li><a href="study/study.jsp">自习查询</a></li>
			<li><a href="borrow/borrow.jsp">教室借用</a></li>
			<li><a href="alterpasswd.jsp">修改密码</a></li>
		</ul>
	</nav>
<BR><BR><image src="img/Fore.jpg" ></image>
<BR><BR>计算机科学与技术2016级4班

</FONT>
</CENTER>
</BODY>
</HTML>
