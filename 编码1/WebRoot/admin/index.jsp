<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<html>
<STYLE type=text/css>
BODY {
Background-image: url(img/Clear.jpg);
}
</STYLE>
<head>
  <title>教室管理系统后台首页</title>
  <%
	String mainPage=(String)request.getParameter("mainPage");
    if(mainPage==null||mainPage.equals(""))
    {
		mainPage="default.jsp";
	}
	else
	{
		mainPage += ".jsp";
	}
	//out.println(mainPage);
  %>
</head>
<body bgcolor="#F0F0F0">
    <center>
        <table border="0" width="920" cellspacing="0" bgcolor="white">
            <tr><td colspan="2"><%@ include file="top.jsp"%></td></tr>
            <tr height="10" bgcolor="lightgrey"><td colspan="2"></td></tr>
            <tr>
            	<td width="100" align="center" valign="top"><jsp:include page="left.jsp"/></td>
            	<td width="800" align="center" valign="top"><jsp:include page="<%=mainPage%>"/></td>
            </tr>
            <tr height="7" bgcolor="lightgrey"><td colspan="2"></td></tr>
            <tr><td colspan="2"><%@ include file="end.jsp" %></td></tr>
        </table>        
    </center>
</body>
