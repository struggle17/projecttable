<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*" errorPage=""%>

<HTML>
	<HEAD>
		<TITLE>CIMS教室信息管理系统 －－ 登录验证</TITLE>
		<LINK href="img/sims_index.css" type="text/css" rel="stylesheet">

	</HEAD>
	<BODY>
		<%
			Connection con;
			Statement sql;
			ResultSet rs;
			String user = new String(
					((request.getParameter("userid")).trim())
							.getBytes("ISO-8859-1"));
			String pass = new String(
					((request.getParameter("password")).trim())
							.getBytes("ISO-8859-1"));

			String type = new String(((request.getParameter("role")).trim())
					.getBytes("ISO-8859-1"));
			int inttype = Integer.parseInt(type);		

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
			if(inttype==3){
			    response.sendRedirect("visitorWelcome.jsp");
			}
			else{
				rs = sql.executeQuery("select role from admin where userName='"
					+ user + "' and password='" + pass + "' and role='" + type
					+ "'");

				if (rs.next()) {
					session.setAttribute("userName", user);
					session.setAttribute("role", type);
					if(inttype==0){
					response.sendRedirect("admin/adminWelcome.jsp");}
					else
					    response.sendRedirect("welcome.jsp");
				} else {
		%>

		<style type="text/css">
<!--
body {
	background-image: url();
}

#Layer1 {
	position: absolute;
	width: 250px;
	height: 115px;
	z-index: 1;
	left: 312px;
	top: 298px;
}

.STYLE19 {
	font-size: 20px
}

.STYLE20 {
	color: #000066;
	font-weight: bold;
}

.STYLE6 {
	font-size: 16px;
	color: #663399;
}

.STYLE7 {
	color: #0033CC
}

.STYLE12 {
	color: #FFFF99
}
-->
</style>



		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<style type="text/css">
<!--
a:link {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
	color: #000000;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
}
-->
</style>

		<DIV align=center>
			<TABLE id=table1 cellSpacing=0 cellPadding=0 width=770 border=0>
				<TBODY>
					<TR>
						<TD colSpan=3 height=45></TD>
					</TR>
					<TR>
						<TD width="29" height="46" rowspan="3">

						</TD>
						<TD width="195" height="46" rowspan="3">

						</TD>
						<TD width="546" height="20"></TD>
					</TR>
					<TR>
						<TD height="25">
							<IMG src="img/SIMS.jpg" alt="SIMS学生信息管理系统" width=372 height=56
								border=0>
						</TD>
					</TR>
					<TR>
						<TD height="12">
							<div align="right">
								&nbsp;&nbsp;
							</div>
						</TD>
					</TR>
				</TBODY>
			</TABLE>

			<IMG src="img/line.jpg" width=757 height=5 border=0>
			<TD width=21>
				<p>
					&nbsp;
				</p>
				<table width="317" height="183" border="2" align="center">
					<tr>
						<td height="175" bgcolor="#9999FF">
							<p align="center" class="STYLE19 STYLE20">
								<span class="STYLE12">用户名不存在或密码错误。</span>
							</p>
							<p align="center" class="STYLE20 STYLE6">
								请
								<a href="index1.jsp" class="STYLE7">重新登录</a>！
							</p>
						</td>
					</tr>
				</table>
				<p>
					&nbsp;
				</p>
				<p>
					&nbsp;
				</p>
			</TD>
			<TD vAlign=top width=503>
				<TABLE id=table2 cellSpacing=0 cellPadding=0 width="100%" border=0>
					<TBODY>
						<TR>
						</TR>
					</TBODY>
				</TABLE>

			</TD>

			<TR>
				<TD height=52></TD>
			</TR>
			<TR>
				<TD colSpan=3>
					<IMG height=5 src="file/line.jpg" width=757 border=0>
				</TD>
			</TR>
			<TR>
				<TD height=15></TD>
			</TR>
			<TR>
				<TD colspan="3">
					<P align=right>
						&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
						&nbsp;&nbsp; &nbsp;&nbsp;
					</P>
				</TD>
			</TR>

		</DIV>


		<%
			rs.close();
				sql.close();
				con.close();
			}
			}
		%>
	</BODY>
</HTML>
