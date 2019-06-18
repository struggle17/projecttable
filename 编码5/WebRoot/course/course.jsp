<%@ page contentType="text/html;charset=GB2312"%>
<HTML>
<STYLE type=text/css>
BODY {
Background-image: url(../img/Clear.jpg);
}
</STYLE>
<BODY>
<title>课程查询</title>
<CENTER>
  <H1><FONT COLOR=RED>课程查询
<BR>
<HR color = black>
  <BR><FONT Size=4><FONT COLOR=black>
  <FORM action="courseQuery.jsp" method = post name = form>
   <table width = 10% bordercolor=blue>
    <tr>
      <td><INPUT type = "radio" name = "search" value="nameSearch" checked = "ok"><B>课程名检索
      </td>
    </tr>
    <tr><td><INPUT type = "radio" name = "search" value="dirSearch"><B>目录检索
    </td>
    </tr>
    <tr>
    <td align=center>
    <BR><INPUT type="submit" value="提交" name="submit">
    </td></tr>
    </table>
    </FORM>
</CENTER>
</BODY>
<HTML>