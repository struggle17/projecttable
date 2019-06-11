<%@ page language="java" contentType="text/html; charset=GBK"%>
<jsp:useBean id="cvariable" class="myUtils.ComVariable" scope="page"></jsp:useBean>

<html>
<head>
<title>增加教室信息</title>
	<script>
	function checkFrom(form) 
	{
		var strNum = form.classroomNum.value;
		var length = strNum.length;
		var strNum1 = form.holdNum.value;
		var length1 = strNum1.length;
		
		if(length == 0)
		{
			alert("教室编号不能为空");
			form.classroomNum.focus();
			return false;
		} else {
			for (var i = 0; i < length; i++) {
				if (!((strNum.charAt(i) >= 'a' && strNum.charAt(i) <= 'z') ||
					  (strNum.charAt(i) >= 'A' && strNum.charAt(i) <= 'Z') ||
					  (strNum.charAt(i) >= '0' && strNum.charAt(i) <= '9') ||
					   strNum.charAt(i) == '_')) {
					alert("课程编号不合法\n必须为数字，字母，下划线");
					form.classroomNum.focus();
					return false;
				}
			}
		}
		if(length1 == 0)
		{
			alert("容纳人数不能为空!");
			form.holdNum.focus();
			return false;
		} else {
			for (var i = 0; i < length1; i++) {
				if (strNum1.charAt(i) < '0' || strNum1.charAt(i) > '9') {
					alert("容纳人数不合法\n必须为30~300的整数");
					form.holdNum.focus();
					return false;
				}
			}
			if (strNum1 > 300 || strNum1 < 30) {
				alert("容纳人数不合法\n必须为30~300的整数");
				form.holdNum.focus();
				return false;
			}
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
            	<font size=6>增加教室信息</font>
            		<table width="220", height="160">
            		<tr><td>
            			<form id="addClassroom" name="addClassroomForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opClassroom/addClassroomOk" onsubmit="return checkFrom(this);">
	            			<P> 教室编号:<input type="text" name="classroomNum" size=17/>
	            			<br>容纳人数:<input type="text" name="holdNum" size=17/><br>
						         设&nbsp;&nbsp;&nbsp;&nbsp;备:<Select name="deviceType" style="width:131px">
												    		   <%
												    		   String strTemp[] = cvariable.getDevices();
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
						   	<input type="button" value="取消并返回" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opClassroom/lookClassrooms&id=1')" style="width:100px;height:22px"/>
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