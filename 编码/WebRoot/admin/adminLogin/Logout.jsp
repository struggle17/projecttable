<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<html>
<head>
	<title>
  	教室管理系统后台登陆检验
  	</title>
  	<%
  	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
    
    session.removeAttribute("userName");
    response.sendRedirect(basePath+"index.jsp");
  	%>
</head>
<body>
</body>
