<%@ page language="java" contentType="text/html; charset=GBK"%>

<html>
<head>
<title>
ºóÌ¨-Ò³Ã¼
</title>
</head>
<body>
	<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
	String userName = (String)session.getAttribute("userName");
	if (userName == null) {
		response.sendRedirect(basePath+"index.jsp");
	}
	%>
    <center>
        <table border="0" width="960" height="93" cellspacing="5" cellpadding="5" background="images/admin_top.jpg">
            <tr>
                <td width="100%" height="80%" align="right" valign="bottom">
                <p>»¶Ó­Äú:<%=userName%></p>
                <a href="<%=basePath%>index.jsp"><img src="images/index.gif" border="0"></a>
                </td>
            </tr>            
        </table>
    </center>
</body>
</html>