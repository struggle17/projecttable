<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
<head>
<title>
请登陆
</title>
 <%
   	String path = request.getContextPath();
   	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
 %>
<script type="text/javascript"> 
function postForm()
{
	var userName=document.form.userName.value;
	var password=document.form.password.value;
	if (userName == "" || userName == " ")
	{
		alert("请填账号");
		return false;
	} else if (password == "" || password == " ")
	{
		alert("密码不能为空");
		return false;
	}return true;
}
</script>
</head>
<body>
<center>
<div style="margin: 0 auto; width:500px;">
<div style="border:2px #0C9 solid; width:500px; height:250px; margin-top:150px; background:#DFEDB4">
<h1 style="text-align:center"><br/>教室管理系统后台登陆</h1>
<div style=" width:170px; margin:0 auto">
  <form name="form" method="post" action="checkLogin.jsp" onsubmit="return postForm()" style="margin:0; padding:0;">
  <table width="170px" border="0">
    <tr>
      <td>登陆名：
        <label>
          <input type="text" name="userName" size=20/>
        </label></td>
    </tr>
    <tr>
      <td>密  码：
        <label>
          <input type="password" name="password" size=21/>
        </label></td>
    </tr>
    <tr>
      <td style="text-align:center"><label>
        <input type="submit" name="Login" value="登陆" style="width:70px"/>
        <input type="button" name="return" value="返回首页" onclick="window.location.href('<%=basePath%>index.jsp')" style="width:70px"/>
      </label></td>
    </tr>
  </table>
  <p><br/>
  </p>
</form>
</div>
</div>
</div>
</center>
</body>
</html>