<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="dbAdmin" class="opDB.ConnectDB" scope="page"></jsp:useBean>

<html>
<head>
	<title>
  	教室管理系统后台登陆检验
  	</title>
  	<%
  	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
  	String userName = (String)request.getParameter("userName");
  	String password = (String)request.getParameter("password");
  	String strQuery = "SELECT * FROM Admin where userName='"+userName+"' and password='"+password+"'";
  	dbAdmin.connect("CmisDB");
  	boolean isHave = dbAdmin.queryDBHave(strQuery);
  	%>
</head>
<body>
    <center>
    <%
    if (isHave) {
    	session.setAttribute("userName", userName);
    	response.sendRedirect(basePath+"admin/index.jsp"); 
    } else {%>
    	<br/>用户名或者密码错误，请重新登陆<br/><br/>
    	<input type="button" value="返回" onclick="window.location.href('Login.jsp')" style="width:70px;">
    	<input type="button" name="return" value="返回首页" onclick="window.location.href('<%=basePath%>index.jsp')" style="width:70px"/>
    <% 
    }%>
    </center>
</body>
