<%@ page contentType="text/html;charset=GB2312"%>
<HTML>

<STYLE type=text/css>
BODY {
Background-image: url(img/Clear.jpg);
}
</STYLE>

<BODY>
<title>���ҹ�����Ϣϵͳ</title>
<CENTER>
  <H1>�������պ����ѧ����ѧԺ </H1>
  <H2>���ҹ�����Ϣϵͳ</H2>
  <% 
  String userName = (String)session.getAttribute("userName");
  session.setAttribute("userName",userName);
  %>
<p>��ӭ��:<%=userName%></p>
<HR color=white>
  <BR><FONT Size=4>
<A HREF="teacher/teacher.jsp">��ʦ��ѯ</A>&nbsp;
<A HREF="classroom/classroom.jsp">���Ҳ�ѯ</A>&nbsp; 
<A HREF="course/course.jsp">�γ̲�ѯ</A>&nbsp;
<A HREF="study/study.jsp">��ϰ��ѯ</A>&nbsp;
<A HREF="borrow/borrow.jsp">���ҽ���</A>&nbsp;
<A HREF="alterpasswd.jsp">�޸�����</A>
<BR><BR><image src="img/fore.jpg" ></image>
<BR><BR>�������ѧ�뼼��11��2��

</FONT>
</CENTER>
</BODY>
</HTML>
