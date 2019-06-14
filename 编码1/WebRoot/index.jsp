<%@ page contentType="text/html; charset=gb2312" language="java"%>


<HTML>
	<HEAD>
		<TITLE>CIMS教师信息管理系统</TITLE>
		<LINK href="img/sims_index.css" type="text/css" rel="stylesheet">

		<script language="javascript">
function checkform(){
    if(type!=3){
    var frm=document.form			
	if(frm.userid.value==""){
		alert("用户名不能为空。请重新输入！");
		return false;
	}
	if(frm.password.value==""){
		alert("密码不能为空。请重新输入！");
		return false;
	}
	if(rs.next()){
	alert("用户名不存在或密码错误。请重新输入！");
	return false;}
	}
	return true;
}
</script>
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
	</HEAD>
	<BODY>
		<DIV align=center>
			<TABLE id=table1 cellSpacing=0 cellPadding=0 width=770 border=0>
				<TBODY>
					<TR>
						<TD colSpan=3 height=56></TD>
					</TR>
					<TR>
						<TD height="46" rowspan="3">

						</TD>
						<TD height="46" rowspan="3"></TD>
						<TD height="20"></TD>
					</TR>
					<TR>
						<TD height="25"></TD>
					</TR>
					<TR>
						<TD height="12">
							<div align="right">
								&nbsp;&nbsp;
							</div>
						</TD>
					</TR>
					<TR>
						<TD width=246 height=14></TD>
						<TD width=21></TD>
						<TD width=503>
							<div align="right"></div>
						</TD>
					</TR>
					<TR>
						<TD width=246 background="img/denglu0.jpg" height=301>

							<form name="form" method="POST" action="login.jsp" onSubmit="return checkform()">
								<TABLE id=table3 cellSpacing=0 cellPadding=0 width="249"
									border=0 height="216">
									<TBODY>
										<TR>
											<TD align=right width="20%"></TD>
											<TD width="5%"></TD>
											<TD width="75%"></TD>
										</TR>
										<TR>
											<TD align=right width="20%"></TD>
											<TD width="5%"></TD>
											<TD width="75%"></TD>
										</TR>
										<TR>
											<TD align=right width="20%" height=13></TD>
											<TD width="5%"></TD>
											<TD width="75%"></TD>
										</TR>

										<TR>
											<TD align=right width="20%">
												用户名
											</TD>
											<TD width="5%"></TD>
											<TD width="75%">
												<input type="text" name="userid" size="20">
											</TD>
										</TR>
										<TR>
											<TD align=right height=5></TD>
											<TD></TD>
											<TD></TD>
										</TR>
										<TR>
											<TD align=right>
												密&nbsp; 码
											</TD>
											<TD></TD>
											<TD>
												<input name="password" type="password" class="userpwd">
											</TD>
										</TR>
										<TR>
											<TD align=right height=10></TD>
											<TD></TD>
											<TD></TD>
										</TR>
										<TR>
											<TD height="25" colspan="3" align=right>
												<p>
													<label>
														<div align="center">
															<input type="radio" name="role" value="1" checked>
															学生
															<input type="radio" name="role" value="2">
															教师
															<input type="radio" name="role" value="0">
															管理员
															<input type="radio" name="role" value="3">
															访客
														</div>
													</label>
												</p>
											</TD>
										</TR>
										<TR>
											<TD colspan="3">
												<div align="center">
													<input type=image name=denglu src="img/denglu.gif"
														alt="登陆系统" width="78" height="26" border="0">
													&nbsp;
													<a href="index.jsp"><img src="img/quxiao.gif"
															alt="取消操作" width=77 height=26 border=0 onClick="">
													</a>
												</div>
											</TD>
										</TR>

										<TR>
											<TD height=20></TD>
										</TR>
										
										<TR>

											<TD height=49>
												<SPAN id=errMsg style="COLOR: red"></SPAN>
											</TD>

										</TR>
									</TBODY>
								</TABLE>

							</form>
						</TD>
						<TD width=21></TD>
						<TD vAlign=top width=503>
							<TABLE id=table2 cellSpacing=0 cellPadding=0 width="100%"
								border=0>
								<TBODY>
									<TR>
										<TD>
											<IMG height=224 src="img/title.jpg" width=503 border=0>
										</TD>
									</TR>
									<TR>
										<TD height=13></TD>
									</TR>
									<TR>
										<TD>
											<P align=center>
												<IMG height=56 src="img/SIMS.jpg" width=372 border=0>
											</P>
										</TD>
									</TR>
								</TBODY>
							</TABLE>


						</TD>
					</TR>
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
						<TD colspan="3" align="right">
							&nbsp;
							<br>
							<br>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>

	</BODY>
</HTML>

