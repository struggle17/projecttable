<%@ page contentType="text/html;charset=GB2312"%>
<HTML>
<STYLE type=text/css>
BODY {
Background-image: url(../img/Clear.jpg);
}
</STYLE>
<BODY>
<title>教室查询</title>
<CENTER>
  <H1><FONT COLOR=RED>教室查询
<BR>
<HR color=black>
  <BR><FONT Size=4><FONT COLOR=black>
  <FORM action="classroomQuery.jsp" method = post name = form>
    <INPUT type = "radio" name = "search" value="numSearch" checked = "ok">编号检索
    <BR><INPUT type = "radio" name = "search" value="dirSearch">目录检索
    <BR><BR><INPUT type="submit" value="提交" name="submit">
  </FORM>

</CENTER>
</BODY>
<HTML>