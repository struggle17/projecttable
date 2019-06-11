<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*" errorPage=""%>

<HTML>
	<HEAD>
		<TITLE>修改密码</TITLE>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<script language="javascript">
function checkform(){
    var frm=document.form7	

	if(frm.alterpwd1.value==""){
		alert("请输入新密码！");
		return false;
	}

	if(frm.alterpwd2.value==""){
	alert("请再次输入新密码！");
	return false;
	}

	if(frm.alterpwd1.value.length<2||frm.alterpwd1.value.length>18||frm.alterpwd2.value.length<2||frm.alterpwd2.value.length>18){
	alert("密码的长度不符合规格。请重新输入！");
	return false;
	}
	
	if(!((frm.alteruser1.value>="0"&&frm.alteruser1.value<":")||(frm.alteruser1.value>="a"&&frm.alteruser1.value<"{")||(frm.alteruser1.value>="A"&&frm.alteruser1.value<"["))||!((frm.alteruser2.value>="0"&&frm.alteruser2.value<":")||(frm.alteruser2.value>="a"&&frm.alteruser2.value<"{")||(frm.alteruser2.value>="A"&&frm.alteruser2.value<"["))){
	alert("输入的密码中含有非法字符。请重新输入！")
	return false;
	}

	if(frm.alterpwd1.value!=frm.alterpwd2.value){
	alert("两次输入的密码不一致，请重新输入！");
	return false;
	}
	
	return true;
}
</script>

		<style type="text/css">
<!--
.STYLE8 {
	font-family: "楷体_GB2312"
}

.STYLE9 {
	font-family: "宋体";
	font-weight: bold;
}

#Layer1 {
	position: absolute;
	width: 200px;
	height: 115px;
	z-index: 1;
	left: 146px;
	top: 80px;
}
-->
</style>
	</HEAD>
	<BODY>
		<%
			Connection con;
			Statement sql;
			ResultSet rs;
			String user = (String) session.getAttribute("userName");
			String type = (String) session.getAttribute("role");

			try {
				Class.forName("com.mysql.jdbc.Driver");

			} catch (Exception e) {
				out.print(e);
			}
			String uri = "jdbc:mysql://localhost:3306/cmisdb?characterEncoding=utf8";
			String username = "root";
			String password = "mysql123";
			con = DriverManager.getConnection(uri, username, password);
			sql = con.createStatement();
			rs = sql.executeQuery("select * from admin where userName ='"
					+ user + "'");

			if (user != null) {
				rs.next();
		%>

		<form name="form7" method="post"
			action="alterownpwdok.jsp?alteruser=<%=user%>"
			onSubmit="return checkform()"> 
            <div align="center">
			
					<p><font size="6"><strong>修改我的密码</strong><br></font></p>
					<p><font size="4">用户名:</font>:<%=user%></p>
					<p><font size="4">新密码:</font><input name="alterpwd1" type="password" ></p>			
					<p><font size="4">重复输入新密码:</font><input name="alterpwd2" type="password" ></p>		
						<span style="background-color: rgb(192, 192, 192);">
						&ldquo;密码&rdquo;由字母a～z、数字0～9组成，长度为2～18个字符。</span> 
	                     <p><font color="#ffffff">3</font></p>	
									<div align="center">
										<label>
											<input type="submit" name="submit" value="确认修改" />
											&nbsp;&nbsp;
										</label>
										<label>
											<input type="reset" name="reset" value="重新输入" />
										</label>
									</div>
							</div>
		</form>
		<%
			rs.close();
				sql.close();
				con.close();
		%>

		<%
			} else {
				response.sendRedirect("welcome.jsp");
			}
		%>


	</BODY>
</HTML>

