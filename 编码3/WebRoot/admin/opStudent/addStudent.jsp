<%@ page language="java" contentType="text/html; charset=GBK"%>
<jsp:useBean id="cvariable" class="myUtils.ComVariable" scope="page"></jsp:useBean>

<html>
<head>
<title>增加学生信息
</title>
	<script>
	function checkFrom(form) 
	{
		var strNum = form.studentNum.value;
		var length = strNum.length;
		if(length == 0)
		{
			alert("学号不能为空");
			form.studentNum.focus();
			return false;
		} else if (length != 10) {
			alert("学号只能为10位阿拉伯数字");
			form.studentNum.focus();
			return false;
		} else {
			for (var i = 0; i < length; i++) {
				if (strNum.charAt(i) > '9' || strNum.charAt(i) < '0') {
					alert("学号数字只能为0~9");
					form.studentNum.focus();
					return false;
				}
			}
		}
		if (form.studentName.value.length == 0) {
			alert("学生姓名不能为空");
			form.studentName.focus();
			return false;
		}
		return true;
	}
	</script>
	<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
	%>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        <tr><td align="center">
            <table border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="350">
            <tr><td>
            	<center>
            	<font size=6>增加学生信息</font>
            		<table width="220", height="160">
            		<tr><td>
            			<form id="addCourse" name="addCourseForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opStudent/addStudentOk" onsubmit="return checkFrom(this);">
	            			<P>&nbsp;&nbsp;学&nbsp;号&nbsp;:<input type="text" name="studentNum" size=17/>
	            			<br>学生姓名:<input type="text" name="studentName" size=17/>
						    <br>所属院系:<Select name="deptname">
						    		   <%
						    		   String strTemp[] = cvariable.getDeptnames();
						    		   int length = strTemp.length;
						    		   for (int i = 0; i < length; i++) {
						    		   %>
						    		   <option value=<%=strTemp[i]%>><%=strTemp[i]%>
						    		   <%
						    		   }%>
						   		       </Select>
						   	</P>
						   	<center>
						   	<input type="submit" value="添加" name="submit" style="width:100px;height:22px"/>
						   	<input type="button" value="取消并返回" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opStudent/lookStudents&id=1')" style="width:100px;height:22px"/>
						   	</center>
	            		</form>
            		</td></tr>
            		</table>
            	</center>
            </td></tr>
            </table>
        </td></tr>
        </table>
    </center>
</body>
</html>