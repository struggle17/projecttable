<%@ page contentType="text/html;charset=GB2312"%>
<HTML>

<STYLE type=text/css>
BODY {
Background-image: url(img/Clear.jpg);
}
</STYLE>

<BODY>
<title>���ҹ�����Ϣϵͳ</title>
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
			display: block;/*���ÿ鼶Ԫ��*/
			width: 100px;/*���Ϊ100����*/
			font-weight: bold;/*����Ӵ�*/
			color: black;/*������ɫΪ��ɫ*/
			background-color: #8EE5EE;/*����ɫ����Ϊ��ɫ*/
			text-align: center;/*�ı�����*/
			padding: 5px;/*5px�ı߾�*/
			text-decoration: none;

		}
		a:hover,a:active{
			background-color:#388E8E;
		}
	</style>
<CENTER>
  <H1>����ʦ����ѧ ���ҹ�����Ϣϵͳ</H1>

  <% 
  String userName = (String)session.getAttribute("userName");
  session.setAttribute("userName",userName);
  %>
<p>��ӭ��:<%=userName%></p>
<HR color=white>
  <BR><FONT Size=4>

<nav>
		<ul>
			<li><a href="teacher/teacher.jsp">��ʦ��ѯ</a></li>
			<li><a href="classroom/classroom.jsp">���Ҳ�ѯ</a></li>
			<li><a href="course/course.jsp">�γ̲�ѯ</a></li>
			<li><a href="study/study.jsp">��ϰ��ѯ</a></li>
			<li><a href="borrow/borrow.jsp">���ҽ���</a></li>
			<li><a href="alterpasswd.jsp">�޸�����</a></li>
		</ul>
	</nav>
<BR><BR><image src="img/Fore.jpg" ></image>
<BR><BR>�������ѧ�뼼��2016��4��

</FONT>
</CENTER>
</BODY>
</HTML>
